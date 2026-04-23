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

  // 👉 INSERT
  Future<void> insertShipment(ShipmentsCompanion entry) =>
      into(shipments).insert(entry);

  // 👉 GET ALL
  Future<List<Shipment>> getAllShipments() =>
      select(shipments).get();
}

// DB FILE
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'meattrace.db'));
    return NativeDatabase(file);
  });
}