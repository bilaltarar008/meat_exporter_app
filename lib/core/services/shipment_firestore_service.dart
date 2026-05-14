import 'package:cloud_firestore/cloud_firestore.dart';
import '../database/app_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShipmentFirestoreService {

  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  /// ================= COLLECTION =================

  CollectionReference get shipments =>
      _firestore.collection('shipments');

  /// ================= CREATE =================

  Future<void> createShipment({

    required String shipmentCode,

    required String originCountry,
    required String originCity,

    required String destinationCountry,
    required String destinationCity,

    required String slaughterhouse,
    required String destinationWarehouse,

    required String supplier,

    required String animalType,

    required double quantity,
    required double purchaseWeight,

    required double purchaseCost,

    required String freightForwarder,
    required String airline,

    required String awbNumber,
    required String flightNumber,

    required String notes,

  }) async {

    try {

      final user =
          FirebaseAuth.instance.currentUser;

      if (user == null) {

        throw Exception(
          "User not logged in",
        );
      }

      await shipments.add({

        /// USER
        'userId': user.uid,
        'email': user.email,

        /// BASIC
        'shipmentCode': shipmentCode,

        /// ROUTE
        'originCountry': originCountry,
        'originCity': originCity,

        'destinationCountry': destinationCountry,
        'destinationCity': destinationCity,

        /// OPERATIONS
        'slaughterhouse': slaughterhouse,
        'destinationWarehouse': destinationWarehouse,

        /// PURCHASE
        'supplier': supplier,
        'animalType': animalType,

        'quantity': quantity,
        'purchaseWeight': purchaseWeight,
        'purchaseCost': purchaseCost,

        /// FLIGHT
        'freightForwarder': freightForwarder,
        'airline': airline,

        'awbNumber': awbNumber,
        'flightNumber': flightNumber,

        /// NOTES
        'notes': notes,

        /// STAGE
        'currentStage': 'owner',

        'status': 'Purchase Confirmed',

        'nextAction': 'Send to slaughterhouse',

        /// PAYMENT
        'paymentStatus': 'Pending',
        'paymentCompleted': false,

        /// FINANCIALS
        'slaughterhouseCost': 0,
        'coldStorageCost': 0,
        'freightCost': 0,
        'airportHandlingCost': 0,

        'totalExpenses': purchaseCost,
        'totalRevenue': 0,
        'profit': 0,
        'margin': 0,

        /// TIMELINE
        'timeline': [

          {
            'title': 'Shipment Created',
            'description': 'Shipment workflow initialized',
            'stage': 'owner',
            'createdAt': Timestamp.now(),
          },

          {
            'title': 'Purchase Confirmed',
            'description': 'Purchase and sourcing completed',
            'stage': 'owner',
            'createdAt': Timestamp.now(),
          },
        ],

        /// CUTS
        'cuts': [],

        /// EXPENSES
        'expenses': [

          {
            'type': 'purchase',
            'amount': purchaseCost,
            'createdAt': Timestamp.now(),
          },
        ],

        /// DOCUMENTS
        'documents': [],

        /// ACTIVITY
        'activityLogs': [

          {
            'action': 'Shipment Created',
            'user': user.email,
            'stage': 'owner',
            'createdAt': Timestamp.now(),
          },
        ],

        /// FLAGS
        'archived': false,

        /// TIMESTAMPS
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

    } catch (e) {

      debugPrint(
        "CREATE SHIPMENT ERROR: $e",
      );

      rethrow;
    }
  }

  /// ================= WATCH =================

  Future<void> moveToSlaughter(
      String docId,
      ) async {

    await addSlaughterExpense(
      docId: docId,
      amount: 1200,
    );

    await shipments.doc(docId).update({

      'currentStage': 'slaughter',

      'status': 'Animals Sent to Slaughter',

      'nextAction': 'Await slaughter processing',

      'updatedAt':
      FieldValue.serverTimestamp(),

      'timeline': FieldValue.arrayUnion([

        {
          'title': 'Moved to Slaughter',
          'description': 'Shipment transferred to slaughterhouse',
          'stage': 'slaughter',
          'createdAt': Timestamp.now(),
        }

      ]),

      'activityLogs': FieldValue.arrayUnion([

        {
          'action': 'Stage Changed to Slaughter',
          'stage': 'slaughter',
          'createdAt': Timestamp.now(),
        }

      ]),
    });

    await recalculateShipmentFinancials(
      docId,
    );
  }

  Future<void> moveToWarehouse(
      String docId,
      ) async {

    await addWarehouseExpense(
      docId: docId,
      amount: 800,
    );

    await addFreightExpense(
      docId: docId,
      amount: 2400,
    );

    await shipments.doc(docId).update({

      'currentStage': 'warehouse',

      'status': 'Processing Completed',

      'nextAction': 'Prepare warehouse operations',

      'updatedAt':
      FieldValue.serverTimestamp(),

      'timeline': FieldValue.arrayUnion([

        {
          'title': 'Transferred to Warehouse',
          'description': 'Shipment moved to warehouse stage',
          'stage': 'warehouse',
          'createdAt': Timestamp.now(),
        }

      ]),

      'activityLogs': FieldValue.arrayUnion([

        {
          'action': 'Stage Changed to Warehouse',
          'stage': 'warehouse',
          'createdAt': Timestamp.now(),
        }

      ]),
    });

    await recalculateShipmentFinancials(
      docId,
    );
  }

  Future<void> completeShipment(
      String docId,
      ) async {

    await addAirportHandlingExpense(
      docId: docId,
      amount: 650,
    );

    await shipments.doc(docId).update({

      'currentStage': 'completed',

      'status': 'Shipment Completed',

      'nextAction': 'Completed',

      'paymentStatus': 'Completed',

      'updatedAt':
      FieldValue.serverTimestamp(),

      'timeline': FieldValue.arrayUnion([

        {
          'title': 'Shipment Completed',
          'description': 'Workflow successfully completed',
          'stage': 'completed',
          'createdAt': Timestamp.now(),
        }

      ]),

      'activityLogs': FieldValue.arrayUnion([

        {
          'action': 'Shipment Completed',
          'stage': 'completed',
          'createdAt': Timestamp.now(),
        }

      ]),
    });

    await recalculateShipmentFinancials(
      docId,
    );
  }

  /// ================= WATCH =================



  Stream<List<Map<String, dynamic>>>
  watchSlaughterShipments() {

    return shipments
        .where(
      'currentStage',
      isEqualTo: 'slaughter',
    )
        .where(
      'archived',
      isEqualTo: false,
    )
        .snapshots()
        .map((snapshot) {

      return snapshot.docs.map((doc) {

        final data =
        doc.data() as Map<String, dynamic>;

        data['id'] = doc.id;

        return data;

      }).toList();
    });
  }

  Future<void> addExpense({

    required String docId,

    required String type,

    required double amount,

  }) async {

    await shipments.doc(docId).update({

      'expenses': FieldValue.arrayUnion([

        {
          'type': type,
          'amount': amount,
          'createdAt': Timestamp.now(),
        }

      ]),
    });

    await recalculateShipmentFinancials(
      docId,
    );
  }


  Future<void> addSlaughterExpense({
    required String docId,
    required double amount,
  }) async {

    await addExpense(
      docId: docId,
      type: 'slaughterhouse',
      amount: amount,
    );

    await shipments.doc(docId).update({

      'slaughterhouseCost': amount,

      'updatedAt':
      FieldValue.serverTimestamp(),
    });
  }

  Future<void> addWarehouseExpense({
    required String docId,
    required double amount,
  }) async {

    await addExpense(
      docId: docId,
      type: 'cold_storage',
      amount: amount,
    );

    await shipments.doc(docId).update({

      'coldStorageCost': amount,

      'updatedAt':
      FieldValue.serverTimestamp(),
    });
  }

  Future<void> addFreightExpense({
    required String docId,
    required double amount,
  }) async {

    await addExpense(
      docId: docId,
      type: 'freight',
      amount: amount,
    );

    await shipments.doc(docId).update({

      'freightCost': amount,

      'updatedAt':
      FieldValue.serverTimestamp(),
    });
  }

  Future<void> addAirportHandlingExpense({
    required String docId,
    required double amount,
  }) async {

    await addExpense(
      docId: docId,
      type: 'airport_handling',
      amount: amount,
    );

    await shipments.doc(docId).update({

      'airportHandlingCost': amount,

      'updatedAt':
      FieldValue.serverTimestamp(),
    });
  }

  /// ================= DELETE =================

  Future<void> deleteShipment(
      String docId,
      ) async {

    await shipments.doc(docId).delete();
  }

  Stream<List<Map<String, dynamic>>>
  watchWarehouseShipments() {

    return shipments
        .where(
      'currentStage',
      isEqualTo: 'warehouse',
    )
        .where(
      'archived',
      isEqualTo: false,
    )
        .snapshots()
        .map((snapshot) {

      return snapshot.docs.map((doc) {

        final data =
        doc.data() as Map<String, dynamic>;

        data['id'] = doc.id;

        return data;

      }).toList();
    });
  }

  Stream<List<Map<String, dynamic>>>
  watchShipments() {

    final user =
        FirebaseAuth.instance.currentUser;

    return shipments

        .where(
      'userId',
      isEqualTo: user?.uid,
    )

        .where(
      'archived',
      isEqualTo: false,
    )

        .snapshots()

        .map((snapshot) {

      return snapshot.docs.map((doc) {

        final data =
        doc.data() as Map<String, dynamic>;

        data['id'] = doc.id;

        return data;

      }).toList();
    });
  }


  Future<String> createShipmentFromLocal(
      Shipment shipment,
      ) async {

    final user =
        FirebaseAuth.instance.currentUser;

    final doc =
    await shipments.add({

      'userId': user?.uid,

      'email': user?.email,

      'localId': shipment.id,

      'shipmentCode':
      shipment.shipmentCode,

      'title':
      shipment.title,

      'purchaseCost':
      shipment.purchaseCost,

      'totalExpenses': shipment.purchaseCost,

      'totalRevenue': 0,

      'profit': 0,

      'margin': 0,


      'salePrice':
      shipment.salePrice,

      'weight':
      shipment.weight,

      'status':
      shipment.status,

      'currentStage':
      shipment.currentStage,

      'archived':
      shipment.archived,

      'createdAt':
      FieldValue.serverTimestamp(),

      'updatedAt':
      FieldValue.serverTimestamp(),
    });

    return doc.id;
  }

  Future<void> updateShipment(
      Shipment shipment,
      ) async {

    if (shipment.firestoreId == null) return;

    await shipments
        .doc(shipment.firestoreId!)
        .update({

      'title':
      shipment.title,

      'purchaseCost':
      shipment.purchaseCost,

      'salePrice':
      shipment.salePrice,

      'weight':
      shipment.weight,

      'status':
      shipment.status,

      'currentStage':
      shipment.currentStage,

      'archived':
      shipment.archived,

      'updatedAt':
      FieldValue.serverTimestamp(),
    });
  }



  /// ================= UPDATE STAGE =================

  Future<void> updateStage({
    required String docId,
    required String stage,
    required String status,
  }) async {

    await shipments.doc(docId).update({

      'currentStage': stage,
      'status': status,
    });
  }

  Stream<List<Map<String, dynamic>>> watchArchivedShipments() {

    final user =
        FirebaseAuth.instance.currentUser;

    return shipments

        .where(
      'userId',
      isEqualTo: user?.uid,
    )

        .where(
      'archived',
      isEqualTo: true,
    )

        .snapshots()

        .map((snapshot) {

      return snapshot.docs.map((doc) {

        final data =
        doc.data() as Map<String, dynamic>;

        data['id'] = doc.id;

        return data;

      }).toList();
    });
  }



  /// ================= ARCHIVE =================
  Future<void> archiveShipment(
      String docId,
      ) async {

    await shipments.doc(docId).update({

      'archived': true,

      'updatedAt':
      FieldValue.serverTimestamp(),
    });
  }

  Future<void> recalculateShipmentFinancials(
      String docId,
      ) async {

    final doc =
    await shipments.doc(docId).get();

    final data =
    doc.data() as Map<String, dynamic>;

    final expenses =
    List<Map<String, dynamic>>.from(
      data['expenses'] ?? [],
    );

    double totalExpenses = 0;

    for (final e in expenses) {

      totalExpenses +=
          (e['amount'] ?? 0).toDouble();
    }

    final revenue =
    (data['salePrice'] ?? 0).toDouble();

    final profit =
        revenue - totalExpenses;

    double margin = 0;

    if (revenue > 0) {

      margin =
          (profit / revenue) * 100;
    }

    await shipments.doc(docId).update({

      'totalExpenses': totalExpenses,

      'totalRevenue': revenue,

      'profit': profit,

      'margin': margin,

      'updatedAt':
      FieldValue.serverTimestamp(),
    });
  }

  Future<void> restoreShipment(
      String docId,
      ) async {

    await shipments.doc(docId).update({

      'archived': false,

      'updatedAt':
      FieldValue.serverTimestamp(),
    });
  }
}