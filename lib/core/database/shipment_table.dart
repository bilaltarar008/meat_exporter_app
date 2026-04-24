import 'package:drift/drift.dart';

class Shipments extends Table {
  TextColumn get id => text()();
  TextColumn get origin => text()();
  TextColumn get destination => text()();
  RealColumn get temperature => real()();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}