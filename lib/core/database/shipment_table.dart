import 'package:drift/drift.dart';

class Shipments extends Table {

  BoolColumn get blocked =>
      boolean().withDefault(
        const Constant(false),
      )();

  TextColumn get blockedReason =>
      text().withDefault(
        const Constant(''),
      )();

  DateTimeColumn get paymentDue =>
      dateTime().nullable()();

  DateTimeColumn get paymentReceivedDate =>
      dateTime().nullable()();

  RealColumn get outstandingBalance =>
      real().withDefault(
        const Constant(0),
      )();

  RealColumn get totalPaid =>
      real().withDefault(
        const Constant(0),
      )();

  /// ================= PRIMARY =================

  IntColumn get id => integer().autoIncrement()();

  /// ================= BASIC =================

  TextColumn get title => text()();

  TextColumn get shipmentCode =>
      text().nullable()();

  /// ================= ROUTE =================

  TextColumn get origin =>
      text().withDefault(
        const Constant('Pakistan'),
      )();

  TextColumn get destination =>
      text().withDefault(
        const Constant('Dubai'),
      )();

  /// ================= OPERATIONS =================

  TextColumn get slaughterhouse =>
      text().nullable()();

  TextColumn get freightForwarder =>
      text().nullable()();

  TextColumn get airline =>
      text().nullable()();

  TextColumn get destinationWarehouse =>
      text().nullable()();

  /// ================= PURCHASE =================

  TextColumn get supplier =>
      text().nullable()();

  TextColumn get buyer =>
      text().nullable()();

  TextColumn get animalType =>
      text().nullable()();

  RealColumn get quantity =>
      real().withDefault(
        const Constant(0),
      )();

  RealColumn get purchaseWeight =>
      real().withDefault(
        const Constant(0),
      )();



  /// ================= WEIGHTS =================

  RealColumn get carcassWeight =>
      real().withDefault(
        const Constant(0),
      )();

  RealColumn get netSaleWeight =>
      real().withDefault(
        const Constant(0),
      )();

  /// ================= ACTIONS =================

  TextColumn get nextAction =>
      text().withDefault(
        const Constant('Send to Slaughter'),
      )();

  /// ================= PAYMENT =================

  TextColumn get paymentStatus =>
      text().withDefault(
        const Constant('pending'),
      )();

  /// ================= FINANCE =================

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

  /// ================= FLIGHT =================

  TextColumn get awbNumber =>
      text().nullable()();

  TextColumn get flightNumber =>
      text().nullable()();

  DateTimeColumn get departureDate =>
      dateTime().nullable()();

  DateTimeColumn get arrivalDate =>
      dateTime().nullable()();

  /// ================= NOTES =================

  TextColumn get notes =>
      text().nullable()();

  /// ================= STATUS FLOW =================

  TextColumn get status =>
      text().withDefault(
        const Constant('Purchase Confirmed'),
      )();

  TextColumn get currentStage =>
      text().withDefault(
        const Constant('owner'),
      )();

  /// ================= FLAGS =================

  BoolColumn get slaughterDone =>
      boolean().withDefault(
        const Constant(false),
      )();

  BoolColumn get warehouseDone =>
      boolean().withDefault(
        const Constant(false),
      )();

  RealColumn get slaughterhouseCost =>
      real().withDefault(
        const Constant(0),
      )();

  RealColumn get coldStorageCost =>
      real().withDefault(
        const Constant(0),
      )();

  RealColumn get freightCost =>
      real().withDefault(
        const Constant(0),
      )();

  RealColumn get airportHandlingCost =>
      real().withDefault(
        const Constant(0),
      )();

  /// ================= FIRESTORE =================

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

  /// ================= ARCHIVE =================

  BoolColumn get archived =>
      boolean().withDefault(
        const Constant(false),
      )();
}