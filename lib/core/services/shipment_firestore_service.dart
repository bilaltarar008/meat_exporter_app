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
    required String title,
    required double cost,
    required double sale,
    required double weight,
  }) async {

    final user =
        FirebaseAuth.instance.currentUser;

    await shipments.add({

      'userId': user?.uid,

      'email': user?.email,

      'shipmentCode': shipmentCode,

      'title': title,

      'purchaseCost': cost,

      'salePrice': sale,

      'weight': weight,

      'currentStage': 'owner',

      'status': 'Purchase Confirmed',

      'archived': false,

      'createdAt':
      FieldValue.serverTimestamp(),
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
  watchWarehouseShipments() {

    return shipments
        .where(
      'currentStage',
      isEqualTo: 'warehouse',
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
}