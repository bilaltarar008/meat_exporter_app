import 'package:drift/drift.dart';

class EventLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get shipmentId => text()();
  TextColumn get message => text()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
}