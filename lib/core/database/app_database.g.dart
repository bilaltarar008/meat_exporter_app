// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ShipmentsTable extends Shipments
    with TableInfo<$ShipmentsTable, Shipment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShipmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
      'origin', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Pakistan'));
  static const VerificationMeta _destinationMeta =
      const VerificationMeta('destination');
  @override
  late final GeneratedColumn<String> destination = GeneratedColumn<String>(
      'destination', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Dubai'));
  static const VerificationMeta _purchaseCostMeta =
      const VerificationMeta('purchaseCost');
  @override
  late final GeneratedColumn<double> purchaseCost = GeneratedColumn<double>(
      'purchase_cost', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _salePriceMeta =
      const VerificationMeta('salePrice');
  @override
  late final GeneratedColumn<double> salePrice = GeneratedColumn<double>(
      'sale_price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Purchase Confirmed'));
  static const VerificationMeta _currentStageMeta =
      const VerificationMeta('currentStage');
  @override
  late final GeneratedColumn<String> currentStage = GeneratedColumn<String>(
      'current_stage', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('owner'));
  static const VerificationMeta _nextActionMeta =
      const VerificationMeta('nextAction');
  @override
  late final GeneratedColumn<String> nextAction = GeneratedColumn<String>(
      'next_action', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Send to Slaughter'));
  static const VerificationMeta _slaughterDoneMeta =
      const VerificationMeta('slaughterDone');
  @override
  late final GeneratedColumn<bool> slaughterDone = GeneratedColumn<bool>(
      'slaughter_done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("slaughter_done" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _warehouseDoneMeta =
      const VerificationMeta('warehouseDone');
  @override
  late final GeneratedColumn<bool> warehouseDone = GeneratedColumn<bool>(
      'warehouse_done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("warehouse_done" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _paymentStatusMeta =
      const VerificationMeta('paymentStatus');
  @override
  late final GeneratedColumn<String> paymentStatus = GeneratedColumn<String>(
      'payment_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        origin,
        destination,
        purchaseCost,
        salePrice,
        weight,
        status,
        currentStage,
        nextAction,
        slaughterDone,
        warehouseDone,
        paymentStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shipments';
  @override
  VerificationContext validateIntegrity(Insertable<Shipment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('origin')) {
      context.handle(_originMeta,
          origin.isAcceptableOrUnknown(data['origin']!, _originMeta));
    }
    if (data.containsKey('destination')) {
      context.handle(
          _destinationMeta,
          destination.isAcceptableOrUnknown(
              data['destination']!, _destinationMeta));
    }
    if (data.containsKey('purchase_cost')) {
      context.handle(
          _purchaseCostMeta,
          purchaseCost.isAcceptableOrUnknown(
              data['purchase_cost']!, _purchaseCostMeta));
    }
    if (data.containsKey('sale_price')) {
      context.handle(_salePriceMeta,
          salePrice.isAcceptableOrUnknown(data['sale_price']!, _salePriceMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('current_stage')) {
      context.handle(
          _currentStageMeta,
          currentStage.isAcceptableOrUnknown(
              data['current_stage']!, _currentStageMeta));
    }
    if (data.containsKey('next_action')) {
      context.handle(
          _nextActionMeta,
          nextAction.isAcceptableOrUnknown(
              data['next_action']!, _nextActionMeta));
    }
    if (data.containsKey('slaughter_done')) {
      context.handle(
          _slaughterDoneMeta,
          slaughterDone.isAcceptableOrUnknown(
              data['slaughter_done']!, _slaughterDoneMeta));
    }
    if (data.containsKey('warehouse_done')) {
      context.handle(
          _warehouseDoneMeta,
          warehouseDone.isAcceptableOrUnknown(
              data['warehouse_done']!, _warehouseDoneMeta));
    }
    if (data.containsKey('payment_status')) {
      context.handle(
          _paymentStatusMeta,
          paymentStatus.isAcceptableOrUnknown(
              data['payment_status']!, _paymentStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Shipment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Shipment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      origin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}origin'])!,
      destination: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}destination'])!,
      purchaseCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}purchase_cost'])!,
      salePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sale_price'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      currentStage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}current_stage'])!,
      nextAction: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}next_action'])!,
      slaughterDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}slaughter_done'])!,
      warehouseDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}warehouse_done'])!,
      paymentStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_status'])!,
    );
  }

  @override
  $ShipmentsTable createAlias(String alias) {
    return $ShipmentsTable(attachedDatabase, alias);
  }
}

class Shipment extends DataClass implements Insertable<Shipment> {
  final int id;
  final String title;

  /// ROUTE
  final String origin;
  final String destination;

  /// FINANCE
  final double purchaseCost;
  final double salePrice;
  final double weight;

  /// STATUS FLOW
  final String status;
  final String currentStage;
  final String nextAction;

  /// FLAGS
  final bool slaughterDone;
  final bool warehouseDone;

  /// PAYMENT
  final String paymentStatus;
  const Shipment(
      {required this.id,
      required this.title,
      required this.origin,
      required this.destination,
      required this.purchaseCost,
      required this.salePrice,
      required this.weight,
      required this.status,
      required this.currentStage,
      required this.nextAction,
      required this.slaughterDone,
      required this.warehouseDone,
      required this.paymentStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['origin'] = Variable<String>(origin);
    map['destination'] = Variable<String>(destination);
    map['purchase_cost'] = Variable<double>(purchaseCost);
    map['sale_price'] = Variable<double>(salePrice);
    map['weight'] = Variable<double>(weight);
    map['status'] = Variable<String>(status);
    map['current_stage'] = Variable<String>(currentStage);
    map['next_action'] = Variable<String>(nextAction);
    map['slaughter_done'] = Variable<bool>(slaughterDone);
    map['warehouse_done'] = Variable<bool>(warehouseDone);
    map['payment_status'] = Variable<String>(paymentStatus);
    return map;
  }

  ShipmentsCompanion toCompanion(bool nullToAbsent) {
    return ShipmentsCompanion(
      id: Value(id),
      title: Value(title),
      origin: Value(origin),
      destination: Value(destination),
      purchaseCost: Value(purchaseCost),
      salePrice: Value(salePrice),
      weight: Value(weight),
      status: Value(status),
      currentStage: Value(currentStage),
      nextAction: Value(nextAction),
      slaughterDone: Value(slaughterDone),
      warehouseDone: Value(warehouseDone),
      paymentStatus: Value(paymentStatus),
    );
  }

  factory Shipment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Shipment(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      origin: serializer.fromJson<String>(json['origin']),
      destination: serializer.fromJson<String>(json['destination']),
      purchaseCost: serializer.fromJson<double>(json['purchaseCost']),
      salePrice: serializer.fromJson<double>(json['salePrice']),
      weight: serializer.fromJson<double>(json['weight']),
      status: serializer.fromJson<String>(json['status']),
      currentStage: serializer.fromJson<String>(json['currentStage']),
      nextAction: serializer.fromJson<String>(json['nextAction']),
      slaughterDone: serializer.fromJson<bool>(json['slaughterDone']),
      warehouseDone: serializer.fromJson<bool>(json['warehouseDone']),
      paymentStatus: serializer.fromJson<String>(json['paymentStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'origin': serializer.toJson<String>(origin),
      'destination': serializer.toJson<String>(destination),
      'purchaseCost': serializer.toJson<double>(purchaseCost),
      'salePrice': serializer.toJson<double>(salePrice),
      'weight': serializer.toJson<double>(weight),
      'status': serializer.toJson<String>(status),
      'currentStage': serializer.toJson<String>(currentStage),
      'nextAction': serializer.toJson<String>(nextAction),
      'slaughterDone': serializer.toJson<bool>(slaughterDone),
      'warehouseDone': serializer.toJson<bool>(warehouseDone),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
    };
  }

  Shipment copyWith(
          {int? id,
          String? title,
          String? origin,
          String? destination,
          double? purchaseCost,
          double? salePrice,
          double? weight,
          String? status,
          String? currentStage,
          String? nextAction,
          bool? slaughterDone,
          bool? warehouseDone,
          String? paymentStatus}) =>
      Shipment(
        id: id ?? this.id,
        title: title ?? this.title,
        origin: origin ?? this.origin,
        destination: destination ?? this.destination,
        purchaseCost: purchaseCost ?? this.purchaseCost,
        salePrice: salePrice ?? this.salePrice,
        weight: weight ?? this.weight,
        status: status ?? this.status,
        currentStage: currentStage ?? this.currentStage,
        nextAction: nextAction ?? this.nextAction,
        slaughterDone: slaughterDone ?? this.slaughterDone,
        warehouseDone: warehouseDone ?? this.warehouseDone,
        paymentStatus: paymentStatus ?? this.paymentStatus,
      );
  Shipment copyWithCompanion(ShipmentsCompanion data) {
    return Shipment(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      origin: data.origin.present ? data.origin.value : this.origin,
      destination:
          data.destination.present ? data.destination.value : this.destination,
      purchaseCost: data.purchaseCost.present
          ? data.purchaseCost.value
          : this.purchaseCost,
      salePrice: data.salePrice.present ? data.salePrice.value : this.salePrice,
      weight: data.weight.present ? data.weight.value : this.weight,
      status: data.status.present ? data.status.value : this.status,
      currentStage: data.currentStage.present
          ? data.currentStage.value
          : this.currentStage,
      nextAction:
          data.nextAction.present ? data.nextAction.value : this.nextAction,
      slaughterDone: data.slaughterDone.present
          ? data.slaughterDone.value
          : this.slaughterDone,
      warehouseDone: data.warehouseDone.present
          ? data.warehouseDone.value
          : this.warehouseDone,
      paymentStatus: data.paymentStatus.present
          ? data.paymentStatus.value
          : this.paymentStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Shipment(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('origin: $origin, ')
          ..write('destination: $destination, ')
          ..write('purchaseCost: $purchaseCost, ')
          ..write('salePrice: $salePrice, ')
          ..write('weight: $weight, ')
          ..write('status: $status, ')
          ..write('currentStage: $currentStage, ')
          ..write('nextAction: $nextAction, ')
          ..write('slaughterDone: $slaughterDone, ')
          ..write('warehouseDone: $warehouseDone, ')
          ..write('paymentStatus: $paymentStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      origin,
      destination,
      purchaseCost,
      salePrice,
      weight,
      status,
      currentStage,
      nextAction,
      slaughterDone,
      warehouseDone,
      paymentStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shipment &&
          other.id == this.id &&
          other.title == this.title &&
          other.origin == this.origin &&
          other.destination == this.destination &&
          other.purchaseCost == this.purchaseCost &&
          other.salePrice == this.salePrice &&
          other.weight == this.weight &&
          other.status == this.status &&
          other.currentStage == this.currentStage &&
          other.nextAction == this.nextAction &&
          other.slaughterDone == this.slaughterDone &&
          other.warehouseDone == this.warehouseDone &&
          other.paymentStatus == this.paymentStatus);
}

class ShipmentsCompanion extends UpdateCompanion<Shipment> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> origin;
  final Value<String> destination;
  final Value<double> purchaseCost;
  final Value<double> salePrice;
  final Value<double> weight;
  final Value<String> status;
  final Value<String> currentStage;
  final Value<String> nextAction;
  final Value<bool> slaughterDone;
  final Value<bool> warehouseDone;
  final Value<String> paymentStatus;
  const ShipmentsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.origin = const Value.absent(),
    this.destination = const Value.absent(),
    this.purchaseCost = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.weight = const Value.absent(),
    this.status = const Value.absent(),
    this.currentStage = const Value.absent(),
    this.nextAction = const Value.absent(),
    this.slaughterDone = const Value.absent(),
    this.warehouseDone = const Value.absent(),
    this.paymentStatus = const Value.absent(),
  });
  ShipmentsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.origin = const Value.absent(),
    this.destination = const Value.absent(),
    this.purchaseCost = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.weight = const Value.absent(),
    this.status = const Value.absent(),
    this.currentStage = const Value.absent(),
    this.nextAction = const Value.absent(),
    this.slaughterDone = const Value.absent(),
    this.warehouseDone = const Value.absent(),
    this.paymentStatus = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Shipment> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? origin,
    Expression<String>? destination,
    Expression<double>? purchaseCost,
    Expression<double>? salePrice,
    Expression<double>? weight,
    Expression<String>? status,
    Expression<String>? currentStage,
    Expression<String>? nextAction,
    Expression<bool>? slaughterDone,
    Expression<bool>? warehouseDone,
    Expression<String>? paymentStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (origin != null) 'origin': origin,
      if (destination != null) 'destination': destination,
      if (purchaseCost != null) 'purchase_cost': purchaseCost,
      if (salePrice != null) 'sale_price': salePrice,
      if (weight != null) 'weight': weight,
      if (status != null) 'status': status,
      if (currentStage != null) 'current_stage': currentStage,
      if (nextAction != null) 'next_action': nextAction,
      if (slaughterDone != null) 'slaughter_done': slaughterDone,
      if (warehouseDone != null) 'warehouse_done': warehouseDone,
      if (paymentStatus != null) 'payment_status': paymentStatus,
    });
  }

  ShipmentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? origin,
      Value<String>? destination,
      Value<double>? purchaseCost,
      Value<double>? salePrice,
      Value<double>? weight,
      Value<String>? status,
      Value<String>? currentStage,
      Value<String>? nextAction,
      Value<bool>? slaughterDone,
      Value<bool>? warehouseDone,
      Value<String>? paymentStatus}) {
    return ShipmentsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      purchaseCost: purchaseCost ?? this.purchaseCost,
      salePrice: salePrice ?? this.salePrice,
      weight: weight ?? this.weight,
      status: status ?? this.status,
      currentStage: currentStage ?? this.currentStage,
      nextAction: nextAction ?? this.nextAction,
      slaughterDone: slaughterDone ?? this.slaughterDone,
      warehouseDone: warehouseDone ?? this.warehouseDone,
      paymentStatus: paymentStatus ?? this.paymentStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (destination.present) {
      map['destination'] = Variable<String>(destination.value);
    }
    if (purchaseCost.present) {
      map['purchase_cost'] = Variable<double>(purchaseCost.value);
    }
    if (salePrice.present) {
      map['sale_price'] = Variable<double>(salePrice.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (currentStage.present) {
      map['current_stage'] = Variable<String>(currentStage.value);
    }
    if (nextAction.present) {
      map['next_action'] = Variable<String>(nextAction.value);
    }
    if (slaughterDone.present) {
      map['slaughter_done'] = Variable<bool>(slaughterDone.value);
    }
    if (warehouseDone.present) {
      map['warehouse_done'] = Variable<bool>(warehouseDone.value);
    }
    if (paymentStatus.present) {
      map['payment_status'] = Variable<String>(paymentStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShipmentsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('origin: $origin, ')
          ..write('destination: $destination, ')
          ..write('purchaseCost: $purchaseCost, ')
          ..write('salePrice: $salePrice, ')
          ..write('weight: $weight, ')
          ..write('status: $status, ')
          ..write('currentStage: $currentStage, ')
          ..write('nextAction: $nextAction, ')
          ..write('slaughterDone: $slaughterDone, ')
          ..write('warehouseDone: $warehouseDone, ')
          ..write('paymentStatus: $paymentStatus')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ShipmentsTable shipments = $ShipmentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [shipments];
}

typedef $$ShipmentsTableCreateCompanionBuilder = ShipmentsCompanion Function({
  Value<int> id,
  required String title,
  Value<String> origin,
  Value<String> destination,
  Value<double> purchaseCost,
  Value<double> salePrice,
  Value<double> weight,
  Value<String> status,
  Value<String> currentStage,
  Value<String> nextAction,
  Value<bool> slaughterDone,
  Value<bool> warehouseDone,
  Value<String> paymentStatus,
});
typedef $$ShipmentsTableUpdateCompanionBuilder = ShipmentsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> origin,
  Value<String> destination,
  Value<double> purchaseCost,
  Value<double> salePrice,
  Value<double> weight,
  Value<String> status,
  Value<String> currentStage,
  Value<String> nextAction,
  Value<bool> slaughterDone,
  Value<bool> warehouseDone,
  Value<String> paymentStatus,
});

class $$ShipmentsTableFilterComposer
    extends Composer<_$AppDatabase, $ShipmentsTable> {
  $$ShipmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get origin => $composableBuilder(
      column: $table.origin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get purchaseCost => $composableBuilder(
      column: $table.purchaseCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get salePrice => $composableBuilder(
      column: $table.salePrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currentStage => $composableBuilder(
      column: $table.currentStage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nextAction => $composableBuilder(
      column: $table.nextAction, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get slaughterDone => $composableBuilder(
      column: $table.slaughterDone, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get warehouseDone => $composableBuilder(
      column: $table.warehouseDone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus, builder: (column) => ColumnFilters(column));
}

class $$ShipmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShipmentsTable> {
  $$ShipmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get origin => $composableBuilder(
      column: $table.origin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get purchaseCost => $composableBuilder(
      column: $table.purchaseCost,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get salePrice => $composableBuilder(
      column: $table.salePrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currentStage => $composableBuilder(
      column: $table.currentStage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nextAction => $composableBuilder(
      column: $table.nextAction, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get slaughterDone => $composableBuilder(
      column: $table.slaughterDone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get warehouseDone => $composableBuilder(
      column: $table.warehouseDone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus,
      builder: (column) => ColumnOrderings(column));
}

class $$ShipmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShipmentsTable> {
  $$ShipmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => column);

  GeneratedColumn<double> get purchaseCost => $composableBuilder(
      column: $table.purchaseCost, builder: (column) => column);

  GeneratedColumn<double> get salePrice =>
      $composableBuilder(column: $table.salePrice, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get currentStage => $composableBuilder(
      column: $table.currentStage, builder: (column) => column);

  GeneratedColumn<String> get nextAction => $composableBuilder(
      column: $table.nextAction, builder: (column) => column);

  GeneratedColumn<bool> get slaughterDone => $composableBuilder(
      column: $table.slaughterDone, builder: (column) => column);

  GeneratedColumn<bool> get warehouseDone => $composableBuilder(
      column: $table.warehouseDone, builder: (column) => column);

  GeneratedColumn<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus, builder: (column) => column);
}

class $$ShipmentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ShipmentsTable,
    Shipment,
    $$ShipmentsTableFilterComposer,
    $$ShipmentsTableOrderingComposer,
    $$ShipmentsTableAnnotationComposer,
    $$ShipmentsTableCreateCompanionBuilder,
    $$ShipmentsTableUpdateCompanionBuilder,
    (Shipment, BaseReferences<_$AppDatabase, $ShipmentsTable, Shipment>),
    Shipment,
    PrefetchHooks Function()> {
  $$ShipmentsTableTableManager(_$AppDatabase db, $ShipmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShipmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShipmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShipmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> origin = const Value.absent(),
            Value<String> destination = const Value.absent(),
            Value<double> purchaseCost = const Value.absent(),
            Value<double> salePrice = const Value.absent(),
            Value<double> weight = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> currentStage = const Value.absent(),
            Value<String> nextAction = const Value.absent(),
            Value<bool> slaughterDone = const Value.absent(),
            Value<bool> warehouseDone = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
          }) =>
              ShipmentsCompanion(
            id: id,
            title: title,
            origin: origin,
            destination: destination,
            purchaseCost: purchaseCost,
            salePrice: salePrice,
            weight: weight,
            status: status,
            currentStage: currentStage,
            nextAction: nextAction,
            slaughterDone: slaughterDone,
            warehouseDone: warehouseDone,
            paymentStatus: paymentStatus,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String> origin = const Value.absent(),
            Value<String> destination = const Value.absent(),
            Value<double> purchaseCost = const Value.absent(),
            Value<double> salePrice = const Value.absent(),
            Value<double> weight = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> currentStage = const Value.absent(),
            Value<String> nextAction = const Value.absent(),
            Value<bool> slaughterDone = const Value.absent(),
            Value<bool> warehouseDone = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
          }) =>
              ShipmentsCompanion.insert(
            id: id,
            title: title,
            origin: origin,
            destination: destination,
            purchaseCost: purchaseCost,
            salePrice: salePrice,
            weight: weight,
            status: status,
            currentStage: currentStage,
            nextAction: nextAction,
            slaughterDone: slaughterDone,
            warehouseDone: warehouseDone,
            paymentStatus: paymentStatus,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ShipmentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ShipmentsTable,
    Shipment,
    $$ShipmentsTableFilterComposer,
    $$ShipmentsTableOrderingComposer,
    $$ShipmentsTableAnnotationComposer,
    $$ShipmentsTableCreateCompanionBuilder,
    $$ShipmentsTableUpdateCompanionBuilder,
    (Shipment, BaseReferences<_$AppDatabase, $ShipmentsTable, Shipment>),
    Shipment,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ShipmentsTableTableManager get shipments =>
      $$ShipmentsTableTableManager(_db, _db.shipments);
}
