import 'package:cloud_firestore/cloud_firestore.dart';

import 'shipment_firestore_service.dart';

final firestoreService =
ShipmentFirestoreService();

Future<void> restoreShipment(
    String firestoreId,
    ) async {

  await FirebaseFirestore.instance
      .collection('shipments')
      .doc(firestoreId)
      .update({

    'archived': false,
  });
}