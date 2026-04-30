import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final _db = FirebaseFirestore.instance;

  /// ✅ NEW: Get user by UID (CORRECT WAY)
  Future<Map<String, dynamic>?> getUserByUid(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();

    if (!doc.exists) return null;

    return doc.data();
  }
}