import 'package:drift/drift.dart';

class Shipments extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  /// ROUTE
  TextColumn get origin =>
      text().withDefault(const Constant('Pakistan'))();

  TextColumn get destination =>
      text().withDefault(const Constant('Dubai'))();

  /// FINANCE
  RealColumn get purchaseCost =>
      real().withDefault(const Constant(0))();

  RealColumn get salePrice =>
      real().withDefault(const Constant(0))();

  RealColumn get weight =>
      real().withDefault(const Constant(0))();

  /// STATUS FLOW
  TextColumn get status =>
      text().withDefault(const Constant('Purchase Confirmed'))();

  TextColumn get currentStage =>
      text().withDefault(const Constant('owner'))();

  TextColumn get nextAction =>
      text().withDefault(const Constant('Send to Slaughter'))();

  /// FLAGS
  BoolColumn get slaughterDone =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get warehouseDone =>
      boolean().withDefault(const Constant(false))();

  /// PAYMENT
  TextColumn get paymentStatus =>
      text().withDefault(const Constant('pending'))();
}