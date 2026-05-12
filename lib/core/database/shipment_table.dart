import 'package:drift/drift.dart';

class Shipments extends Table {

  /// PRIMARY KEY
  IntColumn get id => integer().autoIncrement()();

  /// BASIC INFO
  TextColumn get title => text()();

  TextColumn get shipmentCode =>
      text().nullable()();

  /// ROUTE
  TextColumn get origin =>
      text().withDefault(
        const Constant('Pakistan'),
      )();

  TextColumn get destination =>
      text().withDefault(
        const Constant('Dubai'),
      )();

  /// ACTIONS
  TextColumn get nextAction =>
      text().withDefault(
        const Constant('Send to Slaughter'),
      )();

  /// PAYMENT
  TextColumn get paymentStatus =>
      text().withDefault(
        const Constant('pending'),
      )();

  DateTimeColumn get paymentDue =>
      dateTime().nullable()();

  /// FINANCE
  RealColumn get purchaseCost =>
      real().withDefault(
        const Constant(0),
      )();

  RealColumn get salePrice =>
      real().withDefault(
        const Constant(0),
      )();

  RealColumn get weight =>
      real().withDefault(
        const Constant(0),
      )();

  /// STATUS FLOW
  TextColumn get status =>
      text().withDefault(
        const Constant('Purchase Confirmed'),
      )();

  TextColumn get currentStage =>
      text().withDefault(
        const Constant('owner'),
      )();

  /// FLAGS
  BoolColumn get slaughterDone =>
      boolean().withDefault(
        const Constant(false),
      )();

  BoolColumn get warehouseDone =>
      boolean().withDefault(
        const Constant(false),
      )();

  /// FIRESTORE SYNC
  TextColumn get firestoreId =>
      text().nullable()();

  BoolColumn get synced =>
      boolean().withDefault(
        const Constant(false),
      )();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(
        currentDateAndTime,
      )();

  /// ARCHIVE
  BoolColumn get archived =>
      boolean().withDefault(
        const Constant(false),
      )();
}