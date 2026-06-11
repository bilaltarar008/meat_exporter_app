import 'package:cloud_firestore/cloud_firestore.dart';

class ShipmentWorkflowService {

  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  Future<void> updateShipmentStatus({

    required String shipmentId,

    required String status,

    String? note,
  }) async {

    final shipmentRef =
    firestore
        .collection('shipments')
        .doc(shipmentId);

    await shipmentRef.update({

      'status': status,

      'updatedAt':
      Timestamp.now(),
    });

    await shipmentRef.update({

      'timeline':
      FieldValue.arrayUnion([

        {

          'title': status,

          'description':
          note ?? '',

          'createdAt':
          Timestamp.now(),
        }
      ]),
    });
  }
}

final shipmentWorkflowService =
ShipmentWorkflowService();