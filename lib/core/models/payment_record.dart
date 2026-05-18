import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentRecord {

  final double amount;

  final String note;

  final String receivedBy;

  final Timestamp createdAt;

  PaymentRecord({

    required this.amount,

    required this.note,

    required this.receivedBy,

    required this.createdAt,
  });

  Map<String, dynamic> toMap() {

    return {

      'amount': amount,

      'note': note,

      'receivedBy': receivedBy,

      'createdAt': createdAt,
    };
  }
}