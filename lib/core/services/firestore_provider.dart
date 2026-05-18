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

class ShipmentStages {

  static const owner = 'owner';

  static const slaughter = 'slaughter';

  static const warehouse = 'warehouse';

  static const transit = 'transit';

  static const delivered = 'delivered';

  static const completed = 'completed';
}