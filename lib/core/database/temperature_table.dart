import 'package:drift/drift.dart';

class TemperatureLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get shipmentId => text()();
  RealColumn get value => real()();
  DateTimeColumn get recordedAt => dateTime().withDefault(currentDateAndTime)();
}