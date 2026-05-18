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

    required double salePrice,

    required DateTime? paymentDueDate,

    required double totalPaid,

    required double outstandingBalance,

    required String paymentStatus,

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

        'salePrice': salePrice,

        'paymentDueDate':
        paymentDueDate,

        'totalPaid':
        totalPaid,

        'outstandingBalance':
        outstandingBalance,

        'paymentStatus':
        paymentStatus,

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

        'status': 'Awaiting Processing',

        'nextAction': 'Send shipment to slaughterhouse',

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

  Future<void> advanceShipmentStage({

    required String docId,

    required String newStage,

    required String status,

    required String nextAction,

    required String title,

    required String description,

    String? note,

    double? expenseAmount,

    String? expenseType,

  }) async {

    final user =
        FirebaseAuth.instance.currentUser;

    /// OPTIONAL EXPENSE

    if (expenseAmount != null &&
        expenseType != null) {

      await addExpense(

        docId: docId,

        type: expenseType,

        amount: expenseAmount,
      );
    }

    /// BUILD TIMELINE EVENT

    final timelineEvent = {

      'title': title,

      'description': description,

      'stage': newStage,

      'note': note ?? '',

      'createdAt': Timestamp.now(),

      'createdBy': user?.email,
    };

    /// BUILD ACTIVITY LOG

    final activityLog = {

      'action': title,

      'stage': newStage,

      'note': note ?? '',

      'createdAt': Timestamp.now(),

      'user': user?.email,
    };

    /// UPDATE FIRESTORE

    await shipments.doc(docId).update({

      'currentStage': newStage,

      'status': status,

      'nextAction': nextAction,

      'updatedAt':
      FieldValue.serverTimestamp(),

      'timeline':
      FieldValue.arrayUnion([
        timelineEvent,
      ]),

      'activityLogs':
      FieldValue.arrayUnion([
        activityLog,
      ]),
    });

    /// RECALCULATE

    await recalculateShipmentFinancials(
      docId,
    );
  }
  Future<void> recordPayment({

    required String docId,

    required double amount,

    required String note,

  }) async {

    final doc =
    await shipments.doc(docId).get();

    final data =
    doc.data() as Map<String, dynamic>;

    final currentPaid =
    (data['totalPaid'] ?? 0).toDouble();

    final salePrice =
    (data['salePrice'] ?? 0).toDouble();

    final newPaid =
        currentPaid + amount;

    final outstanding =
        salePrice - newPaid;

    final isCompleted =
        outstanding <= 0;

    await shipments.doc(docId).update({

      'totalPaid': newPaid,

      'outstandingBalance': outstanding,

      'paymentCompleted': isCompleted,

      'paymentStatus':
      isCompleted
          ? 'Completed'
          : 'Partial',

      'paymentReceivedDate':
      Timestamp.now(),

      'paymentHistory':
      FieldValue.arrayUnion([

        {
          'amount': amount,

          'note': note,

          'createdAt':
          Timestamp.now(),

          'receivedBy':
          FirebaseAuth
              .instance
              .currentUser
              ?.email,
        }
      ]),
    });
  }

  Future<void> setPaymentDueDate({

    required String docId,

    required DateTime dueDate,

  }) async {

    await shipments.doc(docId).update({

      'paymentDueDate':
      Timestamp.fromDate(dueDate),
    });
  }

  Future<void> sendToSlaughter({

    required String docId,

    String? note,

  }) async {

    await advanceShipmentStage(

      docId: docId,

      newStage: ShipmentStages.slaughter,

      status: 'At Slaughterhouse',

      nextAction: 'Await slaughter processing',

      title: 'Shipment Sent to Slaughterhouse',

      description:
      'Animals transferred for slaughter processing',

      note: note,

      expenseAmount: 1200,

      expenseType: 'slaughterhouse',
    );
  }

  Future<void> moveToWarehouse({

    required String docId,

    String? note,

  }) async {

    await advanceShipmentStage(

      docId: docId,

      newStage: ShipmentStages.warehouse,

      status: 'In Cold Storage',

      nextAction: 'Prepare export logistics',

      title: 'Shipment Moved to Warehouse',

      description:
      'Cold storage and warehouse processing started',

      note: note,

      expenseAmount: 800,

      expenseType: 'cold_storage',
    );
  }

  Future<void> dispatchShipment({

    required String docId,

    String? note,

  }) async {

    await advanceShipmentStage(

      docId: docId,

      newStage: ShipmentStages.transit,

      status: 'Shipment In Transit',

      nextAction: 'Await delivery confirmation',

      title: 'Shipment Dispatched',

      description:
      'Shipment dispatched via airline freight',

      note: note,

      expenseAmount: 2400,

      expenseType: 'freight',
    );
  }

  Future<void> markDelivered({

    required String docId,

    String? note,

  }) async {

    await advanceShipmentStage(

      docId: docId,

      newStage: ShipmentStages.delivered,

      status: 'Delivered',

      nextAction: 'Finalize payment',

      title: 'Shipment Delivered',

      description:
      'Shipment delivered successfully to destination',

      note: note,
    );
  }

  Future<void> completeShipment({

    required String docId,

    String? note,

  }) async {

    await advanceShipmentStage(

      docId: docId,

      newStage: ShipmentStages.completed,

      status: 'Completed',

      nextAction: 'Workflow Completed',

      title: 'Shipment Completed',

      description:
      'Shipment workflow finalized successfully',

      note: note,

      expenseAmount: 650,

      expenseType: 'airport_handling',
    );

    await shipments.doc(docId).update({

      'paymentStatus': 'Completed',

      'paymentCompleted': true,
    });
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

class ShipmentStages {

  static const owner = 'owner';

  static const slaughter = 'slaughter';

  static const warehouse = 'warehouse';

  static const transit = 'transit';

  static const delivered = 'delivered';

  static const completed = 'completed';
}