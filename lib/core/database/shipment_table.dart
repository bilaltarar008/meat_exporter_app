import 'package:drift/drift.dart';

class Shipments extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get stage =>
      text().withDefault(const Constant('created'))();

  BoolColumn get slaughterDone =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get warehouseDone =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}