import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'shipment_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Shipments])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // CREATE
  Future<int> createShipment(String title) {
    return into(shipments).insert(
      ShipmentsCompanion.insert(title: title),
    );
  }

  Future updateShipmentTitle(int id, String newTitle) {
    return (update(shipments)..where((t) => t.id.equals(id)))
        .write(ShipmentsCompanion(title: Value(newTitle)));
  }

  // READ
  Stream<List<Shipment>> watchShipments() {
    return select(shipments).watch();
  }

  // UPDATE
  Future updateShipmentStatus(int id, String status) {
    return (update(shipments)..where((t) => t.id.equals(id)))
        .write(ShipmentsCompanion(status: Value(status)));
  }

  // DELETE
  Future deleteShipment(int id) {
    return (delete(shipments)..where((t) => t.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}