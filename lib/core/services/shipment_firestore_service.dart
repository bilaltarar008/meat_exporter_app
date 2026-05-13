import 'package:cloud_firestore/cloud_firestore.dart';
import '../database/app_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    required String buyer,

    required String animalType,

    required double quantity,
    required double purchaseWeight,

    required double purchaseCost,
    required double salePrice,

    required String freightForwarder,
    required String airline,

    required String awbNumber,
    required String flightNumber,

    required String notes,
  }) async {

    final user =
        FirebaseAuth.instance.currentUser;

    await shipments.add({

      'userId': user?.uid,
      'email': user?.email,

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
      'buyer': buyer,

      'animalType': animalType,

      'quantity': quantity,
      'purchaseWeight': purchaseWeight,

      'purchaseCost': purchaseCost,
      'salePrice': salePrice,

      /// FLIGHT
      'freightForwarder': freightForwarder,
      'airline': airline,

      'awbNumber': awbNumber,
      'flightNumber': flightNumber,

      /// NOTES
      'notes': notes,

      /// STATUS
      'currentStage': 'owner',

      'status': 'Purchase Confirmed',

      'nextAction': 'Send to slaughterhouse',

      /// PAYMENT
      'paymentStatus': 'Pending',

      'paymentCompleted': false,

      /// TIMELINE
      'timeline': [],

      /// CUTS
      'cuts': [],

      /// EXPENSES
      'expenses': [],

      /// DOCUMENTS
      'documents': [],

      /// ACTIVITY
      'activityLogs': [],

      /// FLAGS
      'archived': false,

      'createdAt': FieldValue.serverTimestamp(),

      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// ================= WATCH =================

  Future<void> moveToSlaughter(
      String docId,
      ) async {

    await shipments.doc(docId).update({

      'currentStage': 'slaughter',

      'status': 'Animals Sent to Slaughter',

      'updatedAt':
      FieldValue.serverTimestamp(),
    });
  }

  Future<void> moveToWarehouse(
      String docId,
      ) async {

    await shipments.doc(docId).update({

      'currentStage': 'warehouse',

      'status': 'Processing Completed',

      'updatedAt':
      FieldValue.serverTimestamp(),
    });
  }

  Future<void> completeShipment(
      String docId,
      ) async {

    await shipments.doc(docId).update({

      'currentStage': 'completed',

      'status': 'Shipment Completed',

      'updatedAt':
      FieldValue.serverTimestamp(),
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