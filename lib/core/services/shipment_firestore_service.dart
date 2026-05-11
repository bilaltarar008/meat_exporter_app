import 'package:cloud_firestore/cloud_firestore.dart';

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

    await shipments.add({

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



  /// ================= WATCH =================

  Stream<List<Map<String, dynamic>>> watchShipments() {
    return shipments
        .where('archived', isEqualTo: false)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return data;
      }).toList();
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
    });
  }
}