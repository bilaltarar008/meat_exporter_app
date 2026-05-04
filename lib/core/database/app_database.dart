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

  double calculateProfit(Shipment s) {
    return s.salePrice - s.purchaseCost;
  }
  Stream<int> countAll() {
    return select(shipments).watch().map((e) => e.length);
  }

  Stream<int> countSlaughter() {
    return (select(shipments)
      ..where((s) => s.currentStage.equals('slaughter')))
        .watch()
        .map((e) => e.length);
  }

  Stream<int> countWarehouse() {
    return (select(shipments)
      ..where((s) => s.currentStage.equals('warehouse')))
        .watch()
        .map((e) => e.length);
  }

  Stream<int> countCompleted() {
    return (select(shipments)
      ..where((s) => s.currentStage.equals('completed')))
        .watch()
        .map((e) => e.length);
  }
  Future createShipmentFull({
    required String title,
    required double cost,
    required double sale,
    required double weight,
  }) {
    return into(shipments).insert(
      ShipmentsCompanion.insert(
        title: title,
        purchaseCost: Value(cost),
        salePrice: Value(sale),
        weight: Value(weight),

        currentStage: const Value('owner'),
        status: const Value('Purchase Confirmed'),
      ),
    );
  }
  @override
  int get schemaVersion => 1;

  /// CREATE
  Future<int> createShipment(String title) async {
    print("DB INSERT: $title");

    final id = await into(shipments).insert(
      ShipmentsCompanion.insert(
        title: title,
        currentStage: const Value('owner'),
      ),
    );

    print("CREATED ID: $id");
    return id;
  }

  /// EDIT
  Future updateShipmentTitle(int id, String newTitle) {
    return (update(shipments)..where((t) => t.id.equals(id)))
        .write(ShipmentsCompanion(title: Value(newTitle)));
  }

  /// DELETE
  Future deleteShipment(int id) {
    return (delete(shipments)..where((t) => t.id.equals(id))).go();
  }

  /// STREAMS
  Stream<List<Shipment>> watchOwnerShipments() {
    return select(shipments).watch();
    // return (select(shipments)
    //   ..where((s) => s.currentStage.equals('owner')))
    //     .watch();
  }

  Future fixStages() async {
    await customStatement("""
    UPDATE shipments
    SET current_stage = 'owner'
    WHERE current_stage IS NULL OR current_stage = ''
  """);
  }

  Future fixBadData() async {
    await customStatement("""
    UPDATE shipments SET origin = 'Pakistan' WHERE origin IS NULL;
  """);

    await customStatement("""
    UPDATE shipments SET destination = 'Dubai' WHERE destination IS NULL;
  """);

    await customStatement("""
    UPDATE shipments SET current_stage = 'owner' WHERE current_stage IS NULL;
  """);

    await customStatement("""
    UPDATE shipments SET status = 'Purchase Confirmed' WHERE status IS NULL;
  """);

    print("🔥 DATA FIXED");
  }

  Stream<List<Shipment>> watchSlaughterShipments() {
    return (select(shipments)
      ..where((s) => s.currentStage.equals('slaughter')))
        .watch();
  }

  Stream<List<Shipment>> watchWarehouseShipments() {
    return (select(shipments)
      ..where((s) => s.currentStage.equals('warehouse')))
        .watch();
  }

  /// FLOW ACTIONS
  Future moveToSlaughter(int id) {
    return (update(shipments)..where((t) => t.id.equals(id)))
        .write(const ShipmentsCompanion(
      currentStage: Value('slaughter'),
      status: Value('Sent to Slaughter'),
    ));
  }

  Future completeSlaughter(int id) {
    return (update(shipments)..where((t) => t.id.equals(id)))
        .write(const ShipmentsCompanion(
      currentStage: Value('warehouse'),
      status: Value('Slaughter Completed'),
      slaughterDone: Value(true),
    ));
  }

  Future completeWarehouse(int id) async {
    await (update(shipments)..where((s) => s.id.equals(id))).write(
      const ShipmentsCompanion(
        warehouseDone: Value(true),
        status: Value('Completed'),
        currentStage: const Value('completed'),
      ),
    );
  }
}



LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();

    final path = p.join(dir.path, 'db.sqlite');
    print("🔥 DB PATH: $path");

    final file = File(path);

    return NativeDatabase(file);
  });
}