import 'package:drift/drift.dart';

class Shipments extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get status =>
      text().withDefault(const Constant('created'))();

  BoolColumn get slaughterDone =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get warehouseDone =>
      boolean().withDefault(const Constant(false))();

  TextColumn get currentStage =>
      text().withDefault(const Constant('owner'))();

}