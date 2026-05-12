import 'dart:async';
import 'package:drift/drift.dart';

import '../database/database_provider.dart';
import '../database/app_database.dart';

import 'shipment_firestore_service.dart';

class SyncService {

  final ShipmentFirestoreService firestore =
  ShipmentFirestoreService();

  /// START AUTO SYNC
  void start() {

    Timer.periodic(
      const Duration(seconds: 10),
          (_) async {

        await syncPendingShipments();
      },
    );
  }



  /// SYNC LOCAL -> FIRESTORE
  Future<void> syncPendingShipments() async {

    final pending = await (
        db.select(db.shipments)
          ..where((s) => s.synced.equals(false))
    ).get();

    for (final shipment in pending) {

      try {

        /// CREATE NEW FIRESTORE DOC
        if (shipment.firestoreId == null) {

          final docId =
          await firestore.createShipmentFromLocal(
            shipment,
          );

          await (
              db.update(db.shipments)
                ..where(
                      (s) => s.id.equals(shipment.id),
                )
          ).write(

            ShipmentsCompanion(

              firestoreId:
              Value(docId),

              synced:
              const Value(true),
            ),
          );

        } else {

          /// UPDATE EXISTING DOC
          await firestore.updateShipment(
            shipment,
          );

          await (
              db.update(db.shipments)
                ..where(
                      (s) => s.id.equals(shipment.id),
                )
          ).write(

             ShipmentsCompanion(
              synced: const Value(true),
            ),
          );
        }

      } catch (e) {

        print("SYNC ERROR: $e");
      }
    }
  }
}