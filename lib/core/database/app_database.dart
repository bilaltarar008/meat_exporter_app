
import 'database_connection.dart';

import 'package:drift/drift.dart';

import 'shipment_table.dart';
import 'shipment_activity_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Shipments,
    ShipmentActivities,
  ],
)
class AppDatabase extends _$AppDatabase {

  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 9;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(

        onUpgrade: (
            Migrator m,
            int from,
            int to,
            ) async {

          if (from < 2) {
            await m.addColumn(
              shipments,
              shipments.archived,
            );
          }

          if (from < 3) {
            await m.addColumn(
              shipments,
              shipments.shipmentCode,
            );
          }

          if (from < 4) {
            await m.createTable(
              shipmentActivities,
            );
          }
          if (from < 5) {

            await m.addColumn(
              shipments,
              shipments.firestoreId,
            );

            await m.addColumn(
              shipments,
              shipments.synced,
            );

            await m.addColumn(
              shipments,
              shipments.updatedAt,
            );
          }
          if (from < 6) {

            await m.addColumn(
              shipments,
              shipments.slaughterhouse,
            );

            await m.addColumn(
              shipments,
              shipments.freightForwarder,
            );

            await m.addColumn(
              shipments,
              shipments.airline,
            );

            await m.addColumn(
              shipments,
              shipments.destinationWarehouse,
            );

            await m.addColumn(
              shipments,
              shipments.supplier,
            );

            await m.addColumn(
              shipments,
              shipments.buyer,
            );

            await m.addColumn(
              shipments,
              shipments.animalType,
            );

            await m.addColumn(
              shipments,
              shipments.quantity,
            );

            await m.addColumn(
              shipments,
              shipments.purchaseWeight,
            );

            await m.addColumn(
              shipments,
              shipments.carcassWeight,
            );

            await m.addColumn(
              shipments,
              shipments.netSaleWeight,
            );

            await m.addColumn(
              shipments,
              shipments.paymentReceivedDate,
            );

            await m.addColumn(
              shipments,
              shipments.outstandingBalance,
            );

            await m.addColumn(
              shipments,
              shipments.awbNumber,
            );

            await m.addColumn(
              shipments,
              shipments.flightNumber,
            );

            await m.addColumn(
              shipments,
              shipments.departureDate,
            );

            await m.addColumn(
              shipments,
              shipments.arrivalDate,
            );

            await m.addColumn(
              shipments,
              shipments.notes,
            );
          }
          if (from < 8) {

            await m.addColumn(
              shipments,
              shipments.slaughterhouseCost,
            );

            await m.addColumn(
              shipments,
              shipments.coldStorageCost,
            );

            await m.addColumn(
              shipments,
              shipments.freightCost,
            );

            await m.addColumn(
              shipments,
              shipments.airportHandlingCost,
            );
          }

          if (from < 9) {

            await m.addColumn(
              shipments,
              shipments.blocked,
            );

            await m.addColumn(
              shipments,
              shipments.blockedReason,
            );

            await m.addColumn(
              shipments,
              shipments.paymentDue,
            );

            await m.addColumn(
              shipments,
              shipments.totalPaid,
            );
          }
        },
      );

  /// =====================================================
  /// SHIPMENT CODE
  /// =====================================================

  Future<String> generateShipmentCode() async {

    final allShipments =
    await select(shipments).get();

    int highestNumber = 0;

    for (final shipment in allShipments) {

      final code = shipment.shipmentCode;

      if (code == null) continue;

      final parts = code.split('-');

      if (parts.length != 2) continue;

      final number =
          int.tryParse(parts[1]) ?? 0;

      if (number > highestNumber) {
        highestNumber = number;
      }
    }

    final nextNumber =
    (highestNumber + 1)
        .toString()
        .padLeft(3, '0');

    final now = DateTime.now();

    final day =
    now.day.toString().padLeft(2, '0');

    final month =
    now.month.toString().padLeft(2, '0');

    return "$day$month-$nextNumber";
  }

  /// =====================================================
  /// CREATE SHIPMENT
  /// =====================================================

  Future<int> createShipmentFull({
    required String title,
    required double cost,
    required double sale,
    required double weight,

  }) async {

    final shipmentCode =
    await generateShipmentCode();

    final id =
    await into(shipments).insert(

      ShipmentsCompanion.insert(

        title: title,

        shipmentCode:
        Value(shipmentCode),

        purchaseCost:
        Value(cost),

        salePrice:
        Value(sale),

        weight:
        Value(weight),

        currentStage:
        const Value('owner'),

        status:
        const Value(
          'Purchase Confirmed',
        ),

        synced: const Value(false),

        updatedAt: Value(DateTime.now()),
      ),
    );

    await addActivity(
      shipmentId: id,
      activity: 'Shipment Created',
      role: 'Owner',
      notes: 'Initial shipment created',
    );

    return id;
  }

  /// =====================================================
  /// ACTIVITIES
  /// =====================================================

  Future addActivity({
    required int shipmentId,
    required String activity,
    required String role,
    String? notes,
  }) {

    return into(shipmentActivities).insert(

      ShipmentActivitiesCompanion.insert(

        shipmentId: shipmentId,

        activity: activity,

        role: role,

        notes: Value(notes),
      ),
    );
  }

  Stream<List<ShipmentActivity>>
  watchActivities(int shipmentId) {

    return (
        select(shipmentActivities)

          ..where(
                (t) => t.shipmentId.equals(
              shipmentId,
            ),
          )

          ..orderBy([
                (t) => OrderingTerm.desc(
              t.createdAt,
            ),
          ])

    ).watch();
  }

  /// =====================================================
  /// COUNTS
  /// =====================================================

  Stream<int> countAll() {
    return (
        select(shipments)
          ..where(
                (s) => s.archived.equals(false),
          )
    ).watch().map((e) => e.length);
  }

  Stream<int> countSlaughter() {
    return (
        select(shipments)
          ..where(
                (s) =>
            s.currentStage.equals(
                'slaughter') &
            s.archived.equals(false),
          )
    ).watch().map((e) => e.length);
  }

  Stream<int> countWarehouse() {
    return (
        select(shipments)
          ..where(
                (s) =>
            s.currentStage.equals(
                'warehouse') &
            s.archived.equals(false),
          )
    ).watch().map((e) => e.length);
  }

  Stream<int> countCompleted() {
    return (
        select(shipments)
          ..where(
                (s) =>
            s.currentStage.equals(
                'completed') &
            s.archived.equals(false),
          )
    ).watch().map((e) => e.length);
  }

  /// =====================================================
  /// WATCH SHIPMENTS
  /// =====================================================

  Stream<List<Shipment>>
  watchAllShipments() {

    return (
        select(shipments)

          ..where(
                (s) => s.archived.equals(false),
          )

    ).watch();
  }

  Stream<List<Shipment>>
  watchOwnerShipments() {

    return (
        select(shipments)

          ..where(
                (s) =>
            s.currentStage.equals(
                'owner') &
            s.archived.equals(false),
          )

    ).watch();
  }

  Stream<List<Shipment>>
  watchSlaughterShipments() {

    return (
        select(shipments)

          ..where(
                (s) =>
            s.currentStage.equals(
                'slaughter') &
            s.archived.equals(false),
          )

    ).watch();
  }

  Stream<List<Shipment>>
  watchWarehouseShipments() {

    return (
        select(shipments)

          ..where(
                (s) =>
            s.currentStage.equals(
                'warehouse') &
            s.archived.equals(false),
          )

    ).watch();
  }

  Stream<List<Shipment>>
  watchCompletedShipments() {

    return (
        select(shipments)

          ..where(
                (s) =>
            s.currentStage.equals(
                'completed') &
            s.archived.equals(false),
          )

    ).watch();
  }

  Stream<List<Shipment>>
  watchArchivedShipments() {

    return (
        select(shipments)

          ..where(
                (s) => s.archived.equals(true),
          )

    ).watch();
  }

  /// =====================================================
  /// FLOW ACTIONS
  /// =====================================================

  Future moveToSlaughter(
      int id,
      ) async {

    await (
        update(shipments)

          ..where(
                (t) => t.id.equals(id),
          )

    ).write(

      ShipmentsCompanion(

        currentStage:
        const Value('slaughter'),

        status:
        const Value(
          'Sent to Slaughter',
        ),

        synced:
        const Value(false),

        updatedAt:
        Value(DateTime.now()),
      ),
    );

    await addActivity(
      shipmentId: id,
      activity:
      'Shipment Sent to Slaughter',
      role: 'Owner',
    );
  }

  Future completeSlaughter(
      int id,
      ) async {

    await (
        update(shipments)

          ..where(
                (t) => t.id.equals(id),
          )

    ).write(

      ShipmentsCompanion(

        currentStage:
        const Value('warehouse'),

        status:
        const Value(
          'Slaughter Completed',
        ),

        slaughterDone:
        const Value(true),

        synced:
        const Value(false),

        updatedAt:
        Value(DateTime.now()),
      ),
    );

    await addActivity(
      shipmentId: id,
      activity:
      'Slaughter Completed',
      role: 'Slaughterhouse',
    );
  }

  Future completeWarehouse(
      int id,
      ) async {

    await (
        update(shipments)

          ..where(
                (s) => s.id.equals(id),
          )

    ).write(

      ShipmentsCompanion(

        warehouseDone:
        const Value(true),

        status:
        const Value('Completed'),

        currentStage:
        const Value('completed'),

        synced:
        const Value(false),

        updatedAt:
        Value(DateTime.now()),
      ),
    );

    await addActivity(
      shipmentId: id,
      activity:
      'Shipment Completed',
      role: 'Warehouse',
    );
  }

  /// =====================================================
  /// STATUS
  /// =====================================================

  Future updateStatus(
      int id,
      String status,
      String nextAction,
      ) {

    return (
        update(shipments)

          ..where(
                (t) => t.id.equals(id),
          )

    ).write(

      ShipmentsCompanion(

        status:
        Value(status),

        nextAction:
        Value(nextAction),

        synced:
        const Value(false),

        updatedAt:
        Value(DateTime.now()),
      ),
    );
  }

  /// =====================================================
  /// ARCHIVE
  /// =====================================================

  Future archiveShipment(
      int id,
      ) {

    return (
        update(shipments)

          ..where(
                (t) => t.id.equals(id),
          )

    ).write(

      ShipmentsCompanion(

        archived:
        const Value(true),

        synced:
        const Value(false),

        updatedAt:
        Value(DateTime.now()),
      ),
    );
  }

  Future<void> restoreShipment(int id) async {

    await (
        update(shipments)
          ..where((tbl) => tbl.id.equals(id))
    ).write(

      ShipmentsCompanion(

        archived:
        const Value(false),

        synced:
        const Value(false),

        updatedAt:
        Value(DateTime.now()),
      ),
    );
  }

  /// =====================================================
  /// FIXES
  /// =====================================================

  Future fixStages() async {

    await customStatement("""

      UPDATE shipments
      SET current_stage = 'owner'
      WHERE current_stage IS NULL

    """);
  }
}


