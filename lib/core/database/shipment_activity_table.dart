import 'package:drift/drift.dart';

class ShipmentActivities extends Table {

  IntColumn get id =>
      integer().autoIncrement()();

  IntColumn get shipmentId =>
      integer()();

  TextColumn get activity =>
      text()();

  TextColumn get role =>
      text()();

  TextColumn get notes =>
      text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(
        currentDateAndTime,
      )();
}