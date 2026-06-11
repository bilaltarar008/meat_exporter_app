import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/supplier_model.dart';
import '../models/slaughterhouse_model.dart';

class MasterDataService {

  final _db = FirebaseFirestore.instance;

  String get uid =>
      FirebaseAuth.instance.currentUser!.uid;

  /// ================= SUPPLIERS =================

  Stream<List<SupplierModel>> watchSuppliers() {

    return _db

        .collection('users')
        .doc(uid)
        .collection('suppliers')

        .snapshots()

        .map((snapshot) {

      return snapshot.docs.map((doc) {

        return SupplierModel.fromMap(
          doc.id,
          doc.data(),
        );

      }).toList();
    });
  }

  Future<void> addSupplier(
      String name,
      ) async {

    await _db

        .collection('users')
        .doc(uid)
        .collection('suppliers')

        .add({

      'name': name.trim(),
      'createdAt': Timestamp.now(),
    });
  }

  /// ================= SLAUGHTERHOUSES =================

  Stream<List<SlaughterhouseModel>>
  watchSlaughterhouses() {

    return _db

        .collection('users')
        .doc(uid)
        .collection('slaughterhouses')

        .snapshots()

        .map((snapshot) {

      return snapshot.docs.map((doc) {

        return SlaughterhouseModel.fromMap(
          doc.id,
          doc.data(),
        );

      }).toList();
    });
  }

  Future<void> addSlaughterhouse(
      String name,
      ) async {

    await _db

        .collection('users')
        .doc(uid)
        .collection('slaughterhouses')

        .add({

      'name': name.trim(),
      'createdAt': Timestamp.now(),
    });
  }
}

final masterDataService =
MasterDataService();