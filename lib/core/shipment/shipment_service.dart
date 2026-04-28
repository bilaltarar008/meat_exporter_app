import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ShipmentService {
  final _db = FirebaseFirestore.instance;

  Future<void> createShipment(String title) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await _db.collection('shipments').add({
      'title': title,
      'ownerId': uid,
      'status': 'created',
      'createdAt': Timestamp.now(),
      'slaughterDone': false,
      'warehouseDone': false,
    });
  }
}