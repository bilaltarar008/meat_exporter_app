import 'package:cloud_firestore/cloud_firestore.dart';

class CountryCityService {

  final FirebaseFirestore _db =
      FirebaseFirestore.instance;

  /// ===============================
  /// WATCH CITIES
  /// ===============================

  Stream<List<String>> watchCities(
      String country,
      ) {

    return _db

        .collection('countries')

        .doc(country)

        .collection('cities')

        .snapshots()

        .map((snapshot) {

      return snapshot.docs.map((doc) {

        return doc['name'] as String;

      }).toList();
    });
  }

  /// ===============================
  /// ADD CITY
  /// ===============================

  Future<void> addCity({
    required String country,
    required String city,
  }) async {

    /// CREATE COUNTRY DOC

    await _db

        .collection('countries')

        .doc(country)

        .set({
      'name': country,
    });

    /// CREATE CITY DOC

    await _db

        .collection('countries')

        .doc(country)

        .collection('cities')

        .doc(city)

        .set({
      'name': city,
      'createdAt': Timestamp.now(),
    });
  }
}