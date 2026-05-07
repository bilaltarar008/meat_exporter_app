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
  static const VerificationMeta _shipmentCodeMeta =
      const VerificationMeta('shipmentCode');
  @override
  late final GeneratedColumn<String> shipmentCode = GeneratedColumn<String>(
      'shipment_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
  static const VerificationMeta _nextActionMeta =
      const VerificationMeta('nextAction');
  @override
  late final GeneratedColumn<String> nextAction = GeneratedColumn<String>(
      'next_action', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Send to Slaughter'));
  static const VerificationMeta _paymentStatusMeta =
      const VerificationMeta('paymentStatus');
  @override
  late final GeneratedColumn<String> paymentStatus = GeneratedColumn<String>(
      'payment_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _paymentDueMeta =
      const VerificationMeta('paymentDue');
  @override
  late final GeneratedColumn<DateTime> paymentDue = GeneratedColumn<DateTime>(
      'payment_due', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
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
  static const VerificationMeta _archivedMeta =
      const VerificationMeta('archived');
  @override
  late final GeneratedColumn<bool> archived = GeneratedColumn<bool>(
      'archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        shipmentCode,
        origin,
        destination,
        nextAction,
        paymentStatus,
        paymentDue,
        purchaseCost,
        salePrice,
        weight,
        status,
        currentStage,
        slaughterDone,
        warehouseDone,
        archived
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
    if (data.containsKey('shipment_code')) {
      context.handle(
          _shipmentCodeMeta,
          shipmentCode.isAcceptableOrUnknown(
              data['shipment_code']!, _shipmentCodeMeta));
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
    if (data.containsKey('next_action')) {
      context.handle(
          _nextActionMeta,
          nextAction.isAcceptableOrUnknown(
              data['next_action']!, _nextActionMeta));
    }
    if (data.containsKey('payment_status')) {
      context.handle(
          _paymentStatusMeta,
          paymentStatus.isAcceptableOrUnknown(
              data['payment_status']!, _paymentStatusMeta));
    }
    if (data.containsKey('payment_due')) {
      context.handle(
          _paymentDueMeta,
          paymentDue.isAcceptableOrUnknown(
              data['payment_due']!, _paymentDueMeta));
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
    if (data.containsKey('archived')) {
      context.handle(_archivedMeta,
          archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta));
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
      shipmentCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shipment_code']),
      origin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}origin'])!,
      destination: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}destination'])!,
      nextAction: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}next_action'])!,
      paymentStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_status'])!,
      paymentDue: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}payment_due']),
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
      slaughterDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}slaughter_done'])!,
      warehouseDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}warehouse_done'])!,
      archived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}archived'])!,
    );
  }

  @override
  $ShipmentsTable createAlias(String alias) {
    return $ShipmentsTable(attachedDatabase, alias);
  }
}

class Shipment extends DataClass implements Insertable<Shipment> {
  /// PRIMARY KEY
  final int id;

  /// BASIC INFO
  final String title;
  final String? shipmentCode;

  /// ROUTE
  final String origin;
  final String destination;

  /// ACTIONS
  final String nextAction;

  /// PAYMENT
  final String paymentStatus;
  final DateTime? paymentDue;

  /// FINANCE
  final double purchaseCost;
  final double salePrice;
  final double weight;

  /// STATUS FLOW
  final String status;
  final String currentStage;

  /// FLAGS
  final bool slaughterDone;
  final bool warehouseDone;

  /// ARCHIVE
  final bool archived;
  const Shipment(
      {required this.id,
      required this.title,
      this.shipmentCode,
      required this.origin,
      required this.destination,
      required this.nextAction,
      required this.paymentStatus,
      this.paymentDue,
      required this.purchaseCost,
      required this.salePrice,
      required this.weight,
      required this.status,
      required this.currentStage,
      required this.slaughterDone,
      required this.warehouseDone,
      required this.archived});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || shipmentCode != null) {
      map['shipment_code'] = Variable<String>(shipmentCode);
    }
    map['origin'] = Variable<String>(origin);
    map['destination'] = Variable<String>(destination);
    map['next_action'] = Variable<String>(nextAction);
    map['payment_status'] = Variable<String>(paymentStatus);
    if (!nullToAbsent || paymentDue != null) {
      map['payment_due'] = Variable<DateTime>(paymentDue);
    }
    map['purchase_cost'] = Variable<double>(purchaseCost);
    map['sale_price'] = Variable<double>(salePrice);
    map['weight'] = Variable<double>(weight);
    map['status'] = Variable<String>(status);
    map['current_stage'] = Variable<String>(currentStage);
    map['slaughter_done'] = Variable<bool>(slaughterDone);
    map['warehouse_done'] = Variable<bool>(warehouseDone);
    map['archived'] = Variable<bool>(archived);
    return map;
  }

  ShipmentsCompanion toCompanion(bool nullToAbsent) {
    return ShipmentsCompanion(
      id: Value(id),
      title: Value(title),
      shipmentCode: shipmentCode == null && nullToAbsent
          ? const Value.absent()
          : Value(shipmentCode),
      origin: Value(origin),
      destination: Value(destination),
      nextAction: Value(nextAction),
      paymentStatus: Value(paymentStatus),
      paymentDue: paymentDue == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentDue),
      purchaseCost: Value(purchaseCost),
      salePrice: Value(salePrice),
      weight: Value(weight),
      status: Value(status),
      currentStage: Value(currentStage),
      slaughterDone: Value(slaughterDone),
      warehouseDone: Value(warehouseDone),
      archived: Value(archived),
    );
  }

  factory Shipment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Shipment(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      shipmentCode: serializer.fromJson<String?>(json['shipmentCode']),
      origin: serializer.fromJson<String>(json['origin']),
      destination: serializer.fromJson<String>(json['destination']),
      nextAction: serializer.fromJson<String>(json['nextAction']),
      paymentStatus: serializer.fromJson<String>(json['paymentStatus']),
      paymentDue: serializer.fromJson<DateTime?>(json['paymentDue']),
      purchaseCost: serializer.fromJson<double>(json['purchaseCost']),
      salePrice: serializer.fromJson<double>(json['salePrice']),
      weight: serializer.fromJson<double>(json['weight']),
      status: serializer.fromJson<String>(json['status']),
      currentStage: serializer.fromJson<String>(json['currentStage']),
      slaughterDone: serializer.fromJson<bool>(json['slaughterDone']),
      warehouseDone: serializer.fromJson<bool>(json['warehouseDone']),
      archived: serializer.fromJson<bool>(json['archived']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'shipmentCode': serializer.toJson<String?>(shipmentCode),
      'origin': serializer.toJson<String>(origin),
      'destination': serializer.toJson<String>(destination),
      'nextAction': serializer.toJson<String>(nextAction),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
      'paymentDue': serializer.toJson<DateTime?>(paymentDue),
      'purchaseCost': serializer.toJson<double>(purchaseCost),
      'salePrice': serializer.toJson<double>(salePrice),
      'weight': serializer.toJson<double>(weight),
      'status': serializer.toJson<String>(status),
      'currentStage': serializer.toJson<String>(currentStage),
      'slaughterDone': serializer.toJson<bool>(slaughterDone),
      'warehouseDone': serializer.toJson<bool>(warehouseDone),
      'archived': serializer.toJson<bool>(archived),
    };
  }

  Shipment copyWith(
          {int? id,
          String? title,
          Value<String?> shipmentCode = const Value.absent(),
          String? origin,
          String? destination,
          String? nextAction,
          String? paymentStatus,
          Value<DateTime?> paymentDue = const Value.absent(),
          double? purchaseCost,
          double? salePrice,
          double? weight,
          String? status,
          String? currentStage,
          bool? slaughterDone,
          bool? warehouseDone,
          bool? archived}) =>
      Shipment(
        id: id ?? this.id,
        title: title ?? this.title,
        shipmentCode:
            shipmentCode.present ? shipmentCode.value : this.shipmentCode,
        origin: origin ?? this.origin,
        destination: destination ?? this.destination,
        nextAction: nextAction ?? this.nextAction,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        paymentDue: paymentDue.present ? paymentDue.value : this.paymentDue,
        purchaseCost: purchaseCost ?? this.purchaseCost,
        salePrice: salePrice ?? this.salePrice,
        weight: weight ?? this.weight,
        status: status ?? this.status,
        currentStage: currentStage ?? this.currentStage,
        slaughterDone: slaughterDone ?? this.slaughterDone,
        warehouseDone: warehouseDone ?? this.warehouseDone,
        archived: archived ?? this.archived,
      );
  Shipment copyWithCompanion(ShipmentsCompanion data) {
    return Shipment(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      shipmentCode: data.shipmentCode.present
          ? data.shipmentCode.value
          : this.shipmentCode,
      origin: data.origin.present ? data.origin.value : this.origin,
      destination:
          data.destination.present ? data.destination.value : this.destination,
      nextAction:
          data.nextAction.present ? data.nextAction.value : this.nextAction,
      paymentStatus: data.paymentStatus.present
          ? data.paymentStatus.value
          : this.paymentStatus,
      paymentDue:
          data.paymentDue.present ? data.paymentDue.value : this.paymentDue,
      purchaseCost: data.purchaseCost.present
          ? data.purchaseCost.value
          : this.purchaseCost,
      salePrice: data.salePrice.present ? data.salePrice.value : this.salePrice,
      weight: data.weight.present ? data.weight.value : this.weight,
      status: data.status.present ? data.status.value : this.status,
      currentStage: data.currentStage.present
          ? data.currentStage.value
          : this.currentStage,
      slaughterDone: data.slaughterDone.present
          ? data.slaughterDone.value
          : this.slaughterDone,
      warehouseDone: data.warehouseDone.present
          ? data.warehouseDone.value
          : this.warehouseDone,
      archived: data.archived.present ? data.archived.value : this.archived,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Shipment(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('shipmentCode: $shipmentCode, ')
          ..write('origin: $origin, ')
          ..write('destination: $destination, ')
          ..write('nextAction: $nextAction, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('paymentDue: $paymentDue, ')
          ..write('purchaseCost: $purchaseCost, ')
          ..write('salePrice: $salePrice, ')
          ..write('weight: $weight, ')
          ..write('status: $status, ')
          ..write('currentStage: $currentStage, ')
          ..write('slaughterDone: $slaughterDone, ')
          ..write('warehouseDone: $warehouseDone, ')
          ..write('archived: $archived')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      shipmentCode,
      origin,
      destination,
      nextAction,
      paymentStatus,
      paymentDue,
      purchaseCost,
      salePrice,
      weight,
      status,
      currentStage,
      slaughterDone,
      warehouseDone,
      archived);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shipment &&
          other.id == this.id &&
          other.title == this.title &&
          other.shipmentCode == this.shipmentCode &&
          other.origin == this.origin &&
          other.destination == this.destination &&
          other.nextAction == this.nextAction &&
          other.paymentStatus == this.paymentStatus &&
          other.paymentDue == this.paymentDue &&
          other.purchaseCost == this.purchaseCost &&
          other.salePrice == this.salePrice &&
          other.weight == this.weight &&
          other.status == this.status &&
          other.currentStage == this.currentStage &&
          other.slaughterDone == this.slaughterDone &&
          other.warehouseDone == this.warehouseDone &&
          other.archived == this.archived);
}

class ShipmentsCompanion extends UpdateCompanion<Shipment> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> shipmentCode;
  final Value<String> origin;
  final Value<String> destination;
  final Value<String> nextAction;
  final Value<String> paymentStatus;
  final Value<DateTime?> paymentDue;
  final Value<double> purchaseCost;
  final Value<double> salePrice;
  final Value<double> weight;
  final Value<String> status;
  final Value<String> currentStage;
  final Value<bool> slaughterDone;
  final Value<bool> warehouseDone;
  final Value<bool> archived;
  const ShipmentsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.shipmentCode = const Value.absent(),
    this.origin = const Value.absent(),
    this.destination = const Value.absent(),
    this.nextAction = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.paymentDue = const Value.absent(),
    this.purchaseCost = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.weight = const Value.absent(),
    this.status = const Value.absent(),
    this.currentStage = const Value.absent(),
    this.slaughterDone = const Value.absent(),
    this.warehouseDone = const Value.absent(),
    this.archived = const Value.absent(),
  });
  ShipmentsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.shipmentCode = const Value.absent(),
    this.origin = const Value.absent(),
    this.destination = const Value.absent(),
    this.nextAction = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.paymentDue = const Value.absent(),
    this.purchaseCost = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.weight = const Value.absent(),
    this.status = const Value.absent(),
    this.currentStage = const Value.absent(),
    this.slaughterDone = const Value.absent(),
    this.warehouseDone = const Value.absent(),
    this.archived = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Shipment> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? shipmentCode,
    Expression<String>? origin,
    Expression<String>? destination,
    Expression<String>? nextAction,
    Expression<String>? paymentStatus,
    Expression<DateTime>? paymentDue,
    Expression<double>? purchaseCost,
    Expression<double>? salePrice,
    Expression<double>? weight,
    Expression<String>? status,
    Expression<String>? currentStage,
    Expression<bool>? slaughterDone,
    Expression<bool>? warehouseDone,
    Expression<bool>? archived,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (shipmentCode != null) 'shipment_code': shipmentCode,
      if (origin != null) 'origin': origin,
      if (destination != null) 'destination': destination,
      if (nextAction != null) 'next_action': nextAction,
      if (paymentStatus != null) 'payment_status': paymentStatus,
      if (paymentDue != null) 'payment_due': paymentDue,
      if (purchaseCost != null) 'purchase_cost': purchaseCost,
      if (salePrice != null) 'sale_price': salePrice,
      if (weight != null) 'weight': weight,
      if (status != null) 'status': status,
      if (currentStage != null) 'current_stage': currentStage,
      if (slaughterDone != null) 'slaughter_done': slaughterDone,
      if (warehouseDone != null) 'warehouse_done': warehouseDone,
      if (archived != null) 'archived': archived,
    });
  }

  ShipmentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? shipmentCode,
      Value<String>? origin,
      Value<String>? destination,
      Value<String>? nextAction,
      Value<String>? paymentStatus,
      Value<DateTime?>? paymentDue,
      Value<double>? purchaseCost,
      Value<double>? salePrice,
      Value<double>? weight,
      Value<String>? status,
      Value<String>? currentStage,
      Value<bool>? slaughterDone,
      Value<bool>? warehouseDone,
      Value<bool>? archived}) {
    return ShipmentsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      shipmentCode: shipmentCode ?? this.shipmentCode,
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      nextAction: nextAction ?? this.nextAction,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paymentDue: paymentDue ?? this.paymentDue,
      purchaseCost: purchaseCost ?? this.purchaseCost,
      salePrice: salePrice ?? this.salePrice,
      weight: weight ?? this.weight,
      status: status ?? this.status,
      currentStage: currentStage ?? this.currentStage,
      slaughterDone: slaughterDone ?? this.slaughterDone,
      warehouseDone: warehouseDone ?? this.warehouseDone,
      archived: archived ?? this.archived,
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
    if (shipmentCode.present) {
      map['shipment_code'] = Variable<String>(shipmentCode.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (destination.present) {
      map['destination'] = Variable<String>(destination.value);
    }
    if (nextAction.present) {
      map['next_action'] = Variable<String>(nextAction.value);
    }
    if (paymentStatus.present) {
      map['payment_status'] = Variable<String>(paymentStatus.value);
    }
    if (paymentDue.present) {
      map['payment_due'] = Variable<DateTime>(paymentDue.value);
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
    if (slaughterDone.present) {
      map['slaughter_done'] = Variable<bool>(slaughterDone.value);
    }
    if (warehouseDone.present) {
      map['warehouse_done'] = Variable<bool>(warehouseDone.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShipmentsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('shipmentCode: $shipmentCode, ')
          ..write('origin: $origin, ')
          ..write('destination: $destination, ')
          ..write('nextAction: $nextAction, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('paymentDue: $paymentDue, ')
          ..write('purchaseCost: $purchaseCost, ')
          ..write('salePrice: $salePrice, ')
          ..write('weight: $weight, ')
          ..write('status: $status, ')
          ..write('currentStage: $currentStage, ')
          ..write('slaughterDone: $slaughterDone, ')
          ..write('warehouseDone: $warehouseDone, ')
          ..write('archived: $archived')
          ..write(')'))
        .toString();
  }
}

class $ShipmentActivitiesTable extends ShipmentActivities
    with TableInfo<$ShipmentActivitiesTable, ShipmentActivity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShipmentActivitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _shipmentIdMeta =
      const VerificationMeta('shipmentId');
  @override
  late final GeneratedColumn<int> shipmentId = GeneratedColumn<int>(
      'shipment_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _activityMeta =
      const VerificationMeta('activity');
  @override
  late final GeneratedColumn<String> activity = GeneratedColumn<String>(
      'activity', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, shipmentId, activity, role, notes, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shipment_activities';
  @override
  VerificationContext validateIntegrity(Insertable<ShipmentActivity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shipment_id')) {
      context.handle(
          _shipmentIdMeta,
          shipmentId.isAcceptableOrUnknown(
              data['shipment_id']!, _shipmentIdMeta));
    } else if (isInserting) {
      context.missing(_shipmentIdMeta);
    }
    if (data.containsKey('activity')) {
      context.handle(_activityMeta,
          activity.isAcceptableOrUnknown(data['activity']!, _activityMeta));
    } else if (isInserting) {
      context.missing(_activityMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShipmentActivity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShipmentActivity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      shipmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}shipment_id'])!,
      activity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}activity'])!,
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ShipmentActivitiesTable createAlias(String alias) {
    return $ShipmentActivitiesTable(attachedDatabase, alias);
  }
}

class ShipmentActivity extends DataClass
    implements Insertable<ShipmentActivity> {
  final int id;
  final int shipmentId;
  final String activity;
  final String role;
  final String? notes;
  final DateTime createdAt;
  const ShipmentActivity(
      {required this.id,
      required this.shipmentId,
      required this.activity,
      required this.role,
      this.notes,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['shipment_id'] = Variable<int>(shipmentId);
    map['activity'] = Variable<String>(activity);
    map['role'] = Variable<String>(role);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ShipmentActivitiesCompanion toCompanion(bool nullToAbsent) {
    return ShipmentActivitiesCompanion(
      id: Value(id),
      shipmentId: Value(shipmentId),
      activity: Value(activity),
      role: Value(role),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory ShipmentActivity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShipmentActivity(
      id: serializer.fromJson<int>(json['id']),
      shipmentId: serializer.fromJson<int>(json['shipmentId']),
      activity: serializer.fromJson<String>(json['activity']),
      role: serializer.fromJson<String>(json['role']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'shipmentId': serializer.toJson<int>(shipmentId),
      'activity': serializer.toJson<String>(activity),
      'role': serializer.toJson<String>(role),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ShipmentActivity copyWith(
          {int? id,
          int? shipmentId,
          String? activity,
          String? role,
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt}) =>
      ShipmentActivity(
        id: id ?? this.id,
        shipmentId: shipmentId ?? this.shipmentId,
        activity: activity ?? this.activity,
        role: role ?? this.role,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
      );
  ShipmentActivity copyWithCompanion(ShipmentActivitiesCompanion data) {
    return ShipmentActivity(
      id: data.id.present ? data.id.value : this.id,
      shipmentId:
          data.shipmentId.present ? data.shipmentId.value : this.shipmentId,
      activity: data.activity.present ? data.activity.value : this.activity,
      role: data.role.present ? data.role.value : this.role,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShipmentActivity(')
          ..write('id: $id, ')
          ..write('shipmentId: $shipmentId, ')
          ..write('activity: $activity, ')
          ..write('role: $role, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, shipmentId, activity, role, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShipmentActivity &&
          other.id == this.id &&
          other.shipmentId == this.shipmentId &&
          other.activity == this.activity &&
          other.role == this.role &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class ShipmentActivitiesCompanion extends UpdateCompanion<ShipmentActivity> {
  final Value<int> id;
  final Value<int> shipmentId;
  final Value<String> activity;
  final Value<String> role;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const ShipmentActivitiesCompanion({
    this.id = const Value.absent(),
    this.shipmentId = const Value.absent(),
    this.activity = const Value.absent(),
    this.role = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ShipmentActivitiesCompanion.insert({
    this.id = const Value.absent(),
    required int shipmentId,
    required String activity,
    required String role,
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : shipmentId = Value(shipmentId),
        activity = Value(activity),
        role = Value(role);
  static Insertable<ShipmentActivity> custom({
    Expression<int>? id,
    Expression<int>? shipmentId,
    Expression<String>? activity,
    Expression<String>? role,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shipmentId != null) 'shipment_id': shipmentId,
      if (activity != null) 'activity': activity,
      if (role != null) 'role': role,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ShipmentActivitiesCompanion copyWith(
      {Value<int>? id,
      Value<int>? shipmentId,
      Value<String>? activity,
      Value<String>? role,
      Value<String?>? notes,
      Value<DateTime>? createdAt}) {
    return ShipmentActivitiesCompanion(
      id: id ?? this.id,
      shipmentId: shipmentId ?? this.shipmentId,
      activity: activity ?? this.activity,
      role: role ?? this.role,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shipmentId.present) {
      map['shipment_id'] = Variable<int>(shipmentId.value);
    }
    if (activity.present) {
      map['activity'] = Variable<String>(activity.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShipmentActivitiesCompanion(')
          ..write('id: $id, ')
          ..write('shipmentId: $shipmentId, ')
          ..write('activity: $activity, ')
          ..write('role: $role, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ShipmentsTable shipments = $ShipmentsTable(this);
  late final $ShipmentActivitiesTable shipmentActivities =
      $ShipmentActivitiesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [shipments, shipmentActivities];
}

typedef $$ShipmentsTableCreateCompanionBuilder = ShipmentsCompanion Function({
  Value<int> id,
  required String title,
  Value<String?> shipmentCode,
  Value<String> origin,
  Value<String> destination,
  Value<String> nextAction,
  Value<String> paymentStatus,
  Value<DateTime?> paymentDue,
  Value<double> purchaseCost,
  Value<double> salePrice,
  Value<double> weight,
  Value<String> status,
  Value<String> currentStage,
  Value<bool> slaughterDone,
  Value<bool> warehouseDone,
  Value<bool> archived,
});
typedef $$ShipmentsTableUpdateCompanionBuilder = ShipmentsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String?> shipmentCode,
  Value<String> origin,
  Value<String> destination,
  Value<String> nextAction,
  Value<String> paymentStatus,
  Value<DateTime?> paymentDue,
  Value<double> purchaseCost,
  Value<double> salePrice,
  Value<double> weight,
  Value<String> status,
  Value<String> currentStage,
  Value<bool> slaughterDone,
  Value<bool> warehouseDone,
  Value<bool> archived,
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

  ColumnFilters<String> get shipmentCode => $composableBuilder(
      column: $table.shipmentCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get origin => $composableBuilder(
      column: $table.origin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nextAction => $composableBuilder(
      column: $table.nextAction, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get paymentDue => $composableBuilder(
      column: $table.paymentDue, builder: (column) => ColumnFilters(column));

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

  ColumnFilters<bool> get slaughterDone => $composableBuilder(
      column: $table.slaughterDone, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get warehouseDone => $composableBuilder(
      column: $table.warehouseDone, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<String> get shipmentCode => $composableBuilder(
      column: $table.shipmentCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get origin => $composableBuilder(
      column: $table.origin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nextAction => $composableBuilder(
      column: $table.nextAction, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get paymentDue => $composableBuilder(
      column: $table.paymentDue, builder: (column) => ColumnOrderings(column));

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

  ColumnOrderings<bool> get slaughterDone => $composableBuilder(
      column: $table.slaughterDone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get warehouseDone => $composableBuilder(
      column: $table.warehouseDone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<String> get shipmentCode => $composableBuilder(
      column: $table.shipmentCode, builder: (column) => column);

  GeneratedColumn<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => column);

  GeneratedColumn<String> get nextAction => $composableBuilder(
      column: $table.nextAction, builder: (column) => column);

  GeneratedColumn<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentDue => $composableBuilder(
      column: $table.paymentDue, builder: (column) => column);

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

  GeneratedColumn<bool> get slaughterDone => $composableBuilder(
      column: $table.slaughterDone, builder: (column) => column);

  GeneratedColumn<bool> get warehouseDone => $composableBuilder(
      column: $table.warehouseDone, builder: (column) => column);

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);
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
            Value<String?> shipmentCode = const Value.absent(),
            Value<String> origin = const Value.absent(),
            Value<String> destination = const Value.absent(),
            Value<String> nextAction = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
            Value<DateTime?> paymentDue = const Value.absent(),
            Value<double> purchaseCost = const Value.absent(),
            Value<double> salePrice = const Value.absent(),
            Value<double> weight = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> currentStage = const Value.absent(),
            Value<bool> slaughterDone = const Value.absent(),
            Value<bool> warehouseDone = const Value.absent(),
            Value<bool> archived = const Value.absent(),
          }) =>
              ShipmentsCompanion(
            id: id,
            title: title,
            shipmentCode: shipmentCode,
            origin: origin,
            destination: destination,
            nextAction: nextAction,
            paymentStatus: paymentStatus,
            paymentDue: paymentDue,
            purchaseCost: purchaseCost,
            salePrice: salePrice,
            weight: weight,
            status: status,
            currentStage: currentStage,
            slaughterDone: slaughterDone,
            warehouseDone: warehouseDone,
            archived: archived,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String?> shipmentCode = const Value.absent(),
            Value<String> origin = const Value.absent(),
            Value<String> destination = const Value.absent(),
            Value<String> nextAction = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
            Value<DateTime?> paymentDue = const Value.absent(),
            Value<double> purchaseCost = const Value.absent(),
            Value<double> salePrice = const Value.absent(),
            Value<double> weight = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> currentStage = const Value.absent(),
            Value<bool> slaughterDone = const Value.absent(),
            Value<bool> warehouseDone = const Value.absent(),
            Value<bool> archived = const Value.absent(),
          }) =>
              ShipmentsCompanion.insert(
            id: id,
            title: title,
            shipmentCode: shipmentCode,
            origin: origin,
            destination: destination,
            nextAction: nextAction,
            paymentStatus: paymentStatus,
            paymentDue: paymentDue,
            purchaseCost: purchaseCost,
            salePrice: salePrice,
            weight: weight,
            status: status,
            currentStage: currentStage,
            slaughterDone: slaughterDone,
            warehouseDone: warehouseDone,
            archived: archived,
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
typedef $$ShipmentActivitiesTableCreateCompanionBuilder
    = ShipmentActivitiesCompanion Function({
  Value<int> id,
  required int shipmentId,
  required String activity,
  required String role,
  Value<String?> notes,
  Value<DateTime> createdAt,
});
typedef $$ShipmentActivitiesTableUpdateCompanionBuilder
    = ShipmentActivitiesCompanion Function({
  Value<int> id,
  Value<int> shipmentId,
  Value<String> activity,
  Value<String> role,
  Value<String?> notes,
  Value<DateTime> createdAt,
});

class $$ShipmentActivitiesTableFilterComposer
    extends Composer<_$AppDatabase, $ShipmentActivitiesTable> {
  $$ShipmentActivitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get shipmentId => $composableBuilder(
      column: $table.shipmentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get activity => $composableBuilder(
      column: $table.activity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$ShipmentActivitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $ShipmentActivitiesTable> {
  $$ShipmentActivitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get shipmentId => $composableBuilder(
      column: $table.shipmentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get activity => $composableBuilder(
      column: $table.activity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$ShipmentActivitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShipmentActivitiesTable> {
  $$ShipmentActivitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get shipmentId => $composableBuilder(
      column: $table.shipmentId, builder: (column) => column);

  GeneratedColumn<String> get activity =>
      $composableBuilder(column: $table.activity, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ShipmentActivitiesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ShipmentActivitiesTable,
    ShipmentActivity,
    $$ShipmentActivitiesTableFilterComposer,
    $$ShipmentActivitiesTableOrderingComposer,
    $$ShipmentActivitiesTableAnnotationComposer,
    $$ShipmentActivitiesTableCreateCompanionBuilder,
    $$ShipmentActivitiesTableUpdateCompanionBuilder,
    (
      ShipmentActivity,
      BaseReferences<_$AppDatabase, $ShipmentActivitiesTable, ShipmentActivity>
    ),
    ShipmentActivity,
    PrefetchHooks Function()> {
  $$ShipmentActivitiesTableTableManager(
      _$AppDatabase db, $ShipmentActivitiesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShipmentActivitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShipmentActivitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShipmentActivitiesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> shipmentId = const Value.absent(),
            Value<String> activity = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ShipmentActivitiesCompanion(
            id: id,
            shipmentId: shipmentId,
            activity: activity,
            role: role,
            notes: notes,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int shipmentId,
            required String activity,
            required String role,
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ShipmentActivitiesCompanion.insert(
            id: id,
            shipmentId: shipmentId,
            activity: activity,
            role: role,
            notes: notes,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ShipmentActivitiesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ShipmentActivitiesTable,
    ShipmentActivity,
    $$ShipmentActivitiesTableFilterComposer,
    $$ShipmentActivitiesTableOrderingComposer,
    $$ShipmentActivitiesTableAnnotationComposer,
    $$ShipmentActivitiesTableCreateCompanionBuilder,
    $$ShipmentActivitiesTableUpdateCompanionBuilder,
    (
      ShipmentActivity,
      BaseReferences<_$AppDatabase, $ShipmentActivitiesTable, ShipmentActivity>
    ),
    ShipmentActivity,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ShipmentsTableTableManager get shipments =>
      $$ShipmentsTableTableManager(_db, _db.shipments);
  $$ShipmentActivitiesTableTableManager get shipmentActivities =>
      $$ShipmentActivitiesTableTableManager(_db, _db.shipmentActivities);
}
