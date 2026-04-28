import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final _db = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final result = await _db
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (result.docs.isEmpty) return null;

    return result.docs.first.data();
  }
}