import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'shipment_table.dart';
import 'event_log_table.dart';
import 'temperature_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Shipments, EventLogs, TemperatureLogs],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // 🔹 Shipment APIs
  Future<void> insertShipment(ShipmentsCompanion shipment) =>
      into(shipments).insert(shipment);

  Stream<List<Shipment>> watchShipments() =>
      select(shipments).watch();

  Future<List<Shipment>> getAllShipments() =>
      select(shipments).get();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'app.db'));
    return NativeDatabase(file);
  });
}