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
  static const VerificationMeta _slaughterhouseMeta =
      const VerificationMeta('slaughterhouse');
  @override
  late final GeneratedColumn<String> slaughterhouse = GeneratedColumn<String>(
      'slaughterhouse', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _freightForwarderMeta =
      const VerificationMeta('freightForwarder');
  @override
  late final GeneratedColumn<String> freightForwarder = GeneratedColumn<String>(
      'freight_forwarder', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _airlineMeta =
      const VerificationMeta('airline');
  @override
  late final GeneratedColumn<String> airline = GeneratedColumn<String>(
      'airline', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _destinationWarehouseMeta =
      const VerificationMeta('destinationWarehouse');
  @override
  late final GeneratedColumn<String> destinationWarehouse =
      GeneratedColumn<String>('destination_warehouse', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _supplierMeta =
      const VerificationMeta('supplier');
  @override
  late final GeneratedColumn<String> supplier = GeneratedColumn<String>(
      'supplier', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _buyerMeta = const VerificationMeta('buyer');
  @override
  late final GeneratedColumn<String> buyer = GeneratedColumn<String>(
      'buyer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _animalTypeMeta =
      const VerificationMeta('animalType');
  @override
  late final GeneratedColumn<String> animalType = GeneratedColumn<String>(
      'animal_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _purchaseWeightMeta =
      const VerificationMeta('purchaseWeight');
  @override
  late final GeneratedColumn<double> purchaseWeight = GeneratedColumn<double>(
      'purchase_weight', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _carcassWeightMeta =
      const VerificationMeta('carcassWeight');
  @override
  late final GeneratedColumn<double> carcassWeight = GeneratedColumn<double>(
      'carcass_weight', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _netSaleWeightMeta =
      const VerificationMeta('netSaleWeight');
  @override
  late final GeneratedColumn<double> netSaleWeight = GeneratedColumn<double>(
      'net_sale_weight', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
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
  static const VerificationMeta _paymentReceivedDateMeta =
      const VerificationMeta('paymentReceivedDate');
  @override
  late final GeneratedColumn<DateTime> paymentReceivedDate =
      GeneratedColumn<DateTime>('payment_received_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _outstandingBalanceMeta =
      const VerificationMeta('outstandingBalance');
  @override
  late final GeneratedColumn<double> outstandingBalance =
      GeneratedColumn<double>('outstanding_balance', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(0));
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
  static const VerificationMeta _awbNumberMeta =
      const VerificationMeta('awbNumber');
  @override
  late final GeneratedColumn<String> awbNumber = GeneratedColumn<String>(
      'awb_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _flightNumberMeta =
      const VerificationMeta('flightNumber');
  @override
  late final GeneratedColumn<String> flightNumber = GeneratedColumn<String>(
      'flight_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _departureDateMeta =
      const VerificationMeta('departureDate');
  @override
  late final GeneratedColumn<DateTime> departureDate =
      GeneratedColumn<DateTime>('departure_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _arrivalDateMeta =
      const VerificationMeta('arrivalDate');
  @override
  late final GeneratedColumn<DateTime> arrivalDate = GeneratedColumn<DateTime>(
      'arrival_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
  static const VerificationMeta _slaughterhouseCostMeta =
      const VerificationMeta('slaughterhouseCost');
  @override
  late final GeneratedColumn<double> slaughterhouseCost =
      GeneratedColumn<double>('slaughterhouse_cost', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _coldStorageCostMeta =
      const VerificationMeta('coldStorageCost');
  @override
  late final GeneratedColumn<double> coldStorageCost = GeneratedColumn<double>(
      'cold_storage_cost', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _freightCostMeta =
      const VerificationMeta('freightCost');
  @override
  late final GeneratedColumn<double> freightCost = GeneratedColumn<double>(
      'freight_cost', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _airportHandlingCostMeta =
      const VerificationMeta('airportHandlingCost');
  @override
  late final GeneratedColumn<double> airportHandlingCost =
      GeneratedColumn<double>('airport_handling_cost', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _firestoreIdMeta =
      const VerificationMeta('firestoreId');
  @override
  late final GeneratedColumn<String> firestoreId = GeneratedColumn<String>(
      'firestore_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
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
        slaughterhouse,
        freightForwarder,
        airline,
        destinationWarehouse,
        supplier,
        buyer,
        animalType,
        quantity,
        purchaseWeight,
        carcassWeight,
        netSaleWeight,
        nextAction,
        paymentStatus,
        paymentDue,
        paymentReceivedDate,
        outstandingBalance,
        purchaseCost,
        salePrice,
        weight,
        awbNumber,
        flightNumber,
        departureDate,
        arrivalDate,
        notes,
        status,
        currentStage,
        slaughterDone,
        warehouseDone,
        slaughterhouseCost,
        coldStorageCost,
        freightCost,
        airportHandlingCost,
        firestoreId,
        synced,
        updatedAt,
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
    if (data.containsKey('slaughterhouse')) {
      context.handle(
          _slaughterhouseMeta,
          slaughterhouse.isAcceptableOrUnknown(
              data['slaughterhouse']!, _slaughterhouseMeta));
    }
    if (data.containsKey('freight_forwarder')) {
      context.handle(
          _freightForwarderMeta,
          freightForwarder.isAcceptableOrUnknown(
              data['freight_forwarder']!, _freightForwarderMeta));
    }
    if (data.containsKey('airline')) {
      context.handle(_airlineMeta,
          airline.isAcceptableOrUnknown(data['airline']!, _airlineMeta));
    }
    if (data.containsKey('destination_warehouse')) {
      context.handle(
          _destinationWarehouseMeta,
          destinationWarehouse.isAcceptableOrUnknown(
              data['destination_warehouse']!, _destinationWarehouseMeta));
    }
    if (data.containsKey('supplier')) {
      context.handle(_supplierMeta,
          supplier.isAcceptableOrUnknown(data['supplier']!, _supplierMeta));
    }
    if (data.containsKey('buyer')) {
      context.handle(
          _buyerMeta, buyer.isAcceptableOrUnknown(data['buyer']!, _buyerMeta));
    }
    if (data.containsKey('animal_type')) {
      context.handle(
          _animalTypeMeta,
          animalType.isAcceptableOrUnknown(
              data['animal_type']!, _animalTypeMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('purchase_weight')) {
      context.handle(
          _purchaseWeightMeta,
          purchaseWeight.isAcceptableOrUnknown(
              data['purchase_weight']!, _purchaseWeightMeta));
    }
    if (data.containsKey('carcass_weight')) {
      context.handle(
          _carcassWeightMeta,
          carcassWeight.isAcceptableOrUnknown(
              data['carcass_weight']!, _carcassWeightMeta));
    }
    if (data.containsKey('net_sale_weight')) {
      context.handle(
          _netSaleWeightMeta,
          netSaleWeight.isAcceptableOrUnknown(
              data['net_sale_weight']!, _netSaleWeightMeta));
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
    if (data.containsKey('payment_received_date')) {
      context.handle(
          _paymentReceivedDateMeta,
          paymentReceivedDate.isAcceptableOrUnknown(
              data['payment_received_date']!, _paymentReceivedDateMeta));
    }
    if (data.containsKey('outstanding_balance')) {
      context.handle(
          _outstandingBalanceMeta,
          outstandingBalance.isAcceptableOrUnknown(
              data['outstanding_balance']!, _outstandingBalanceMeta));
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
    if (data.containsKey('awb_number')) {
      context.handle(_awbNumberMeta,
          awbNumber.isAcceptableOrUnknown(data['awb_number']!, _awbNumberMeta));
    }
    if (data.containsKey('flight_number')) {
      context.handle(
          _flightNumberMeta,
          flightNumber.isAcceptableOrUnknown(
              data['flight_number']!, _flightNumberMeta));
    }
    if (data.containsKey('departure_date')) {
      context.handle(
          _departureDateMeta,
          departureDate.isAcceptableOrUnknown(
              data['departure_date']!, _departureDateMeta));
    }
    if (data.containsKey('arrival_date')) {
      context.handle(
          _arrivalDateMeta,
          arrivalDate.isAcceptableOrUnknown(
              data['arrival_date']!, _arrivalDateMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
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
    if (data.containsKey('slaughterhouse_cost')) {
      context.handle(
          _slaughterhouseCostMeta,
          slaughterhouseCost.isAcceptableOrUnknown(
              data['slaughterhouse_cost']!, _slaughterhouseCostMeta));
    }
    if (data.containsKey('cold_storage_cost')) {
      context.handle(
          _coldStorageCostMeta,
          coldStorageCost.isAcceptableOrUnknown(
              data['cold_storage_cost']!, _coldStorageCostMeta));
    }
    if (data.containsKey('freight_cost')) {
      context.handle(
          _freightCostMeta,
          freightCost.isAcceptableOrUnknown(
              data['freight_cost']!, _freightCostMeta));
    }
    if (data.containsKey('airport_handling_cost')) {
      context.handle(
          _airportHandlingCostMeta,
          airportHandlingCost.isAcceptableOrUnknown(
              data['airport_handling_cost']!, _airportHandlingCostMeta));
    }
    if (data.containsKey('firestore_id')) {
      context.handle(
          _firestoreIdMeta,
          firestoreId.isAcceptableOrUnknown(
              data['firestore_id']!, _firestoreIdMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
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
      slaughterhouse: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}slaughterhouse']),
      freightForwarder: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}freight_forwarder']),
      airline: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}airline']),
      destinationWarehouse: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}destination_warehouse']),
      supplier: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}supplier']),
      buyer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}buyer']),
      animalType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}animal_type']),
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      purchaseWeight: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}purchase_weight'])!,
      carcassWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}carcass_weight'])!,
      netSaleWeight: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}net_sale_weight'])!,
      nextAction: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}next_action'])!,
      paymentStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_status'])!,
      paymentDue: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}payment_due']),
      paymentReceivedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}payment_received_date']),
      outstandingBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}outstanding_balance'])!,
      purchaseCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}purchase_cost'])!,
      salePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sale_price'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      awbNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}awb_number']),
      flightNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}flight_number']),
      departureDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}departure_date']),
      arrivalDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}arrival_date']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      currentStage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}current_stage'])!,
      slaughterDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}slaughter_done'])!,
      warehouseDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}warehouse_done'])!,
      slaughterhouseCost: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}slaughterhouse_cost']),
      coldStorageCost: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}cold_storage_cost']),
      freightCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}freight_cost']),
      airportHandlingCost: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}airport_handling_cost']),
      firestoreId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}firestore_id']),
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
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
  /// ================= PRIMARY =================
  final int id;

  /// ================= BASIC =================
  final String title;
  final String? shipmentCode;

  /// ================= ROUTE =================
  final String origin;
  final String destination;

  /// ================= OPERATIONS =================
  final String? slaughterhouse;
  final String? freightForwarder;
  final String? airline;
  final String? destinationWarehouse;

  /// ================= PURCHASE =================
  final String? supplier;
  final String? buyer;
  final String? animalType;
  final double quantity;
  final double purchaseWeight;

  /// ================= WEIGHTS =================
  final double carcassWeight;
  final double netSaleWeight;

  /// ================= ACTIONS =================
  final String nextAction;

  /// ================= PAYMENT =================
  final String paymentStatus;
  final DateTime? paymentDue;
  final DateTime? paymentReceivedDate;
  final double outstandingBalance;

  /// ================= FINANCE =================
  final double purchaseCost;
  final double salePrice;
  final double weight;

  /// ================= FLIGHT =================
  final String? awbNumber;
  final String? flightNumber;
  final DateTime? departureDate;
  final DateTime? arrivalDate;

  /// ================= NOTES =================
  final String? notes;

  /// ================= STATUS FLOW =================
  final String status;
  final String currentStage;

  /// ================= FLAGS =================
  final bool slaughterDone;
  final bool warehouseDone;
  final double? slaughterhouseCost;
  final double? coldStorageCost;
  final double? freightCost;
  final double? airportHandlingCost;

  /// ================= FIRESTORE =================
  final String? firestoreId;
  final bool synced;
  final DateTime updatedAt;

  /// ================= ARCHIVE =================
  final bool archived;
  const Shipment(
      {required this.id,
      required this.title,
      this.shipmentCode,
      required this.origin,
      required this.destination,
      this.slaughterhouse,
      this.freightForwarder,
      this.airline,
      this.destinationWarehouse,
      this.supplier,
      this.buyer,
      this.animalType,
      required this.quantity,
      required this.purchaseWeight,
      required this.carcassWeight,
      required this.netSaleWeight,
      required this.nextAction,
      required this.paymentStatus,
      this.paymentDue,
      this.paymentReceivedDate,
      required this.outstandingBalance,
      required this.purchaseCost,
      required this.salePrice,
      required this.weight,
      this.awbNumber,
      this.flightNumber,
      this.departureDate,
      this.arrivalDate,
      this.notes,
      required this.status,
      required this.currentStage,
      required this.slaughterDone,
      required this.warehouseDone,
      this.slaughterhouseCost,
      this.coldStorageCost,
      this.freightCost,
      this.airportHandlingCost,
      this.firestoreId,
      required this.synced,
      required this.updatedAt,
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
    if (!nullToAbsent || slaughterhouse != null) {
      map['slaughterhouse'] = Variable<String>(slaughterhouse);
    }
    if (!nullToAbsent || freightForwarder != null) {
      map['freight_forwarder'] = Variable<String>(freightForwarder);
    }
    if (!nullToAbsent || airline != null) {
      map['airline'] = Variable<String>(airline);
    }
    if (!nullToAbsent || destinationWarehouse != null) {
      map['destination_warehouse'] = Variable<String>(destinationWarehouse);
    }
    if (!nullToAbsent || supplier != null) {
      map['supplier'] = Variable<String>(supplier);
    }
    if (!nullToAbsent || buyer != null) {
      map['buyer'] = Variable<String>(buyer);
    }
    if (!nullToAbsent || animalType != null) {
      map['animal_type'] = Variable<String>(animalType);
    }
    map['quantity'] = Variable<double>(quantity);
    map['purchase_weight'] = Variable<double>(purchaseWeight);
    map['carcass_weight'] = Variable<double>(carcassWeight);
    map['net_sale_weight'] = Variable<double>(netSaleWeight);
    map['next_action'] = Variable<String>(nextAction);
    map['payment_status'] = Variable<String>(paymentStatus);
    if (!nullToAbsent || paymentDue != null) {
      map['payment_due'] = Variable<DateTime>(paymentDue);
    }
    if (!nullToAbsent || paymentReceivedDate != null) {
      map['payment_received_date'] = Variable<DateTime>(paymentReceivedDate);
    }
    map['outstanding_balance'] = Variable<double>(outstandingBalance);
    map['purchase_cost'] = Variable<double>(purchaseCost);
    map['sale_price'] = Variable<double>(salePrice);
    map['weight'] = Variable<double>(weight);
    if (!nullToAbsent || awbNumber != null) {
      map['awb_number'] = Variable<String>(awbNumber);
    }
    if (!nullToAbsent || flightNumber != null) {
      map['flight_number'] = Variable<String>(flightNumber);
    }
    if (!nullToAbsent || departureDate != null) {
      map['departure_date'] = Variable<DateTime>(departureDate);
    }
    if (!nullToAbsent || arrivalDate != null) {
      map['arrival_date'] = Variable<DateTime>(arrivalDate);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['status'] = Variable<String>(status);
    map['current_stage'] = Variable<String>(currentStage);
    map['slaughter_done'] = Variable<bool>(slaughterDone);
    map['warehouse_done'] = Variable<bool>(warehouseDone);
    if (!nullToAbsent || slaughterhouseCost != null) {
      map['slaughterhouse_cost'] = Variable<double>(slaughterhouseCost);
    }
    if (!nullToAbsent || coldStorageCost != null) {
      map['cold_storage_cost'] = Variable<double>(coldStorageCost);
    }
    if (!nullToAbsent || freightCost != null) {
      map['freight_cost'] = Variable<double>(freightCost);
    }
    if (!nullToAbsent || airportHandlingCost != null) {
      map['airport_handling_cost'] = Variable<double>(airportHandlingCost);
    }
    if (!nullToAbsent || firestoreId != null) {
      map['firestore_id'] = Variable<String>(firestoreId);
    }
    map['synced'] = Variable<bool>(synced);
    map['updated_at'] = Variable<DateTime>(updatedAt);
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
      slaughterhouse: slaughterhouse == null && nullToAbsent
          ? const Value.absent()
          : Value(slaughterhouse),
      freightForwarder: freightForwarder == null && nullToAbsent
          ? const Value.absent()
          : Value(freightForwarder),
      airline: airline == null && nullToAbsent
          ? const Value.absent()
          : Value(airline),
      destinationWarehouse: destinationWarehouse == null && nullToAbsent
          ? const Value.absent()
          : Value(destinationWarehouse),
      supplier: supplier == null && nullToAbsent
          ? const Value.absent()
          : Value(supplier),
      buyer:
          buyer == null && nullToAbsent ? const Value.absent() : Value(buyer),
      animalType: animalType == null && nullToAbsent
          ? const Value.absent()
          : Value(animalType),
      quantity: Value(quantity),
      purchaseWeight: Value(purchaseWeight),
      carcassWeight: Value(carcassWeight),
      netSaleWeight: Value(netSaleWeight),
      nextAction: Value(nextAction),
      paymentStatus: Value(paymentStatus),
      paymentDue: paymentDue == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentDue),
      paymentReceivedDate: paymentReceivedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentReceivedDate),
      outstandingBalance: Value(outstandingBalance),
      purchaseCost: Value(purchaseCost),
      salePrice: Value(salePrice),
      weight: Value(weight),
      awbNumber: awbNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(awbNumber),
      flightNumber: flightNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(flightNumber),
      departureDate: departureDate == null && nullToAbsent
          ? const Value.absent()
          : Value(departureDate),
      arrivalDate: arrivalDate == null && nullToAbsent
          ? const Value.absent()
          : Value(arrivalDate),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      status: Value(status),
      currentStage: Value(currentStage),
      slaughterDone: Value(slaughterDone),
      warehouseDone: Value(warehouseDone),
      slaughterhouseCost: slaughterhouseCost == null && nullToAbsent
          ? const Value.absent()
          : Value(slaughterhouseCost),
      coldStorageCost: coldStorageCost == null && nullToAbsent
          ? const Value.absent()
          : Value(coldStorageCost),
      freightCost: freightCost == null && nullToAbsent
          ? const Value.absent()
          : Value(freightCost),
      airportHandlingCost: airportHandlingCost == null && nullToAbsent
          ? const Value.absent()
          : Value(airportHandlingCost),
      firestoreId: firestoreId == null && nullToAbsent
          ? const Value.absent()
          : Value(firestoreId),
      synced: Value(synced),
      updatedAt: Value(updatedAt),
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
      slaughterhouse: serializer.fromJson<String?>(json['slaughterhouse']),
      freightForwarder: serializer.fromJson<String?>(json['freightForwarder']),
      airline: serializer.fromJson<String?>(json['airline']),
      destinationWarehouse:
          serializer.fromJson<String?>(json['destinationWarehouse']),
      supplier: serializer.fromJson<String?>(json['supplier']),
      buyer: serializer.fromJson<String?>(json['buyer']),
      animalType: serializer.fromJson<String?>(json['animalType']),
      quantity: serializer.fromJson<double>(json['quantity']),
      purchaseWeight: serializer.fromJson<double>(json['purchaseWeight']),
      carcassWeight: serializer.fromJson<double>(json['carcassWeight']),
      netSaleWeight: serializer.fromJson<double>(json['netSaleWeight']),
      nextAction: serializer.fromJson<String>(json['nextAction']),
      paymentStatus: serializer.fromJson<String>(json['paymentStatus']),
      paymentDue: serializer.fromJson<DateTime?>(json['paymentDue']),
      paymentReceivedDate:
          serializer.fromJson<DateTime?>(json['paymentReceivedDate']),
      outstandingBalance:
          serializer.fromJson<double>(json['outstandingBalance']),
      purchaseCost: serializer.fromJson<double>(json['purchaseCost']),
      salePrice: serializer.fromJson<double>(json['salePrice']),
      weight: serializer.fromJson<double>(json['weight']),
      awbNumber: serializer.fromJson<String?>(json['awbNumber']),
      flightNumber: serializer.fromJson<String?>(json['flightNumber']),
      departureDate: serializer.fromJson<DateTime?>(json['departureDate']),
      arrivalDate: serializer.fromJson<DateTime?>(json['arrivalDate']),
      notes: serializer.fromJson<String?>(json['notes']),
      status: serializer.fromJson<String>(json['status']),
      currentStage: serializer.fromJson<String>(json['currentStage']),
      slaughterDone: serializer.fromJson<bool>(json['slaughterDone']),
      warehouseDone: serializer.fromJson<bool>(json['warehouseDone']),
      slaughterhouseCost:
          serializer.fromJson<double?>(json['slaughterhouseCost']),
      coldStorageCost: serializer.fromJson<double?>(json['coldStorageCost']),
      freightCost: serializer.fromJson<double?>(json['freightCost']),
      airportHandlingCost:
          serializer.fromJson<double?>(json['airportHandlingCost']),
      firestoreId: serializer.fromJson<String?>(json['firestoreId']),
      synced: serializer.fromJson<bool>(json['synced']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
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
      'slaughterhouse': serializer.toJson<String?>(slaughterhouse),
      'freightForwarder': serializer.toJson<String?>(freightForwarder),
      'airline': serializer.toJson<String?>(airline),
      'destinationWarehouse': serializer.toJson<String?>(destinationWarehouse),
      'supplier': serializer.toJson<String?>(supplier),
      'buyer': serializer.toJson<String?>(buyer),
      'animalType': serializer.toJson<String?>(animalType),
      'quantity': serializer.toJson<double>(quantity),
      'purchaseWeight': serializer.toJson<double>(purchaseWeight),
      'carcassWeight': serializer.toJson<double>(carcassWeight),
      'netSaleWeight': serializer.toJson<double>(netSaleWeight),
      'nextAction': serializer.toJson<String>(nextAction),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
      'paymentDue': serializer.toJson<DateTime?>(paymentDue),
      'paymentReceivedDate': serializer.toJson<DateTime?>(paymentReceivedDate),
      'outstandingBalance': serializer.toJson<double>(outstandingBalance),
      'purchaseCost': serializer.toJson<double>(purchaseCost),
      'salePrice': serializer.toJson<double>(salePrice),
      'weight': serializer.toJson<double>(weight),
      'awbNumber': serializer.toJson<String?>(awbNumber),
      'flightNumber': serializer.toJson<String?>(flightNumber),
      'departureDate': serializer.toJson<DateTime?>(departureDate),
      'arrivalDate': serializer.toJson<DateTime?>(arrivalDate),
      'notes': serializer.toJson<String?>(notes),
      'status': serializer.toJson<String>(status),
      'currentStage': serializer.toJson<String>(currentStage),
      'slaughterDone': serializer.toJson<bool>(slaughterDone),
      'warehouseDone': serializer.toJson<bool>(warehouseDone),
      'slaughterhouseCost': serializer.toJson<double?>(slaughterhouseCost),
      'coldStorageCost': serializer.toJson<double?>(coldStorageCost),
      'freightCost': serializer.toJson<double?>(freightCost),
      'airportHandlingCost': serializer.toJson<double?>(airportHandlingCost),
      'firestoreId': serializer.toJson<String?>(firestoreId),
      'synced': serializer.toJson<bool>(synced),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'archived': serializer.toJson<bool>(archived),
    };
  }

  Shipment copyWith(
          {int? id,
          String? title,
          Value<String?> shipmentCode = const Value.absent(),
          String? origin,
          String? destination,
          Value<String?> slaughterhouse = const Value.absent(),
          Value<String?> freightForwarder = const Value.absent(),
          Value<String?> airline = const Value.absent(),
          Value<String?> destinationWarehouse = const Value.absent(),
          Value<String?> supplier = const Value.absent(),
          Value<String?> buyer = const Value.absent(),
          Value<String?> animalType = const Value.absent(),
          double? quantity,
          double? purchaseWeight,
          double? carcassWeight,
          double? netSaleWeight,
          String? nextAction,
          String? paymentStatus,
          Value<DateTime?> paymentDue = const Value.absent(),
          Value<DateTime?> paymentReceivedDate = const Value.absent(),
          double? outstandingBalance,
          double? purchaseCost,
          double? salePrice,
          double? weight,
          Value<String?> awbNumber = const Value.absent(),
          Value<String?> flightNumber = const Value.absent(),
          Value<DateTime?> departureDate = const Value.absent(),
          Value<DateTime?> arrivalDate = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          String? status,
          String? currentStage,
          bool? slaughterDone,
          bool? warehouseDone,
          Value<double?> slaughterhouseCost = const Value.absent(),
          Value<double?> coldStorageCost = const Value.absent(),
          Value<double?> freightCost = const Value.absent(),
          Value<double?> airportHandlingCost = const Value.absent(),
          Value<String?> firestoreId = const Value.absent(),
          bool? synced,
          DateTime? updatedAt,
          bool? archived}) =>
      Shipment(
        id: id ?? this.id,
        title: title ?? this.title,
        shipmentCode:
            shipmentCode.present ? shipmentCode.value : this.shipmentCode,
        origin: origin ?? this.origin,
        destination: destination ?? this.destination,
        slaughterhouse:
            slaughterhouse.present ? slaughterhouse.value : this.slaughterhouse,
        freightForwarder: freightForwarder.present
            ? freightForwarder.value
            : this.freightForwarder,
        airline: airline.present ? airline.value : this.airline,
        destinationWarehouse: destinationWarehouse.present
            ? destinationWarehouse.value
            : this.destinationWarehouse,
        supplier: supplier.present ? supplier.value : this.supplier,
        buyer: buyer.present ? buyer.value : this.buyer,
        animalType: animalType.present ? animalType.value : this.animalType,
        quantity: quantity ?? this.quantity,
        purchaseWeight: purchaseWeight ?? this.purchaseWeight,
        carcassWeight: carcassWeight ?? this.carcassWeight,
        netSaleWeight: netSaleWeight ?? this.netSaleWeight,
        nextAction: nextAction ?? this.nextAction,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        paymentDue: paymentDue.present ? paymentDue.value : this.paymentDue,
        paymentReceivedDate: paymentReceivedDate.present
            ? paymentReceivedDate.value
            : this.paymentReceivedDate,
        outstandingBalance: outstandingBalance ?? this.outstandingBalance,
        purchaseCost: purchaseCost ?? this.purchaseCost,
        salePrice: salePrice ?? this.salePrice,
        weight: weight ?? this.weight,
        awbNumber: awbNumber.present ? awbNumber.value : this.awbNumber,
        flightNumber:
            flightNumber.present ? flightNumber.value : this.flightNumber,
        departureDate:
            departureDate.present ? departureDate.value : this.departureDate,
        arrivalDate: arrivalDate.present ? arrivalDate.value : this.arrivalDate,
        notes: notes.present ? notes.value : this.notes,
        status: status ?? this.status,
        currentStage: currentStage ?? this.currentStage,
        slaughterDone: slaughterDone ?? this.slaughterDone,
        warehouseDone: warehouseDone ?? this.warehouseDone,
        slaughterhouseCost: slaughterhouseCost.present
            ? slaughterhouseCost.value
            : this.slaughterhouseCost,
        coldStorageCost: coldStorageCost.present
            ? coldStorageCost.value
            : this.coldStorageCost,
        freightCost: freightCost.present ? freightCost.value : this.freightCost,
        airportHandlingCost: airportHandlingCost.present
            ? airportHandlingCost.value
            : this.airportHandlingCost,
        firestoreId: firestoreId.present ? firestoreId.value : this.firestoreId,
        synced: synced ?? this.synced,
        updatedAt: updatedAt ?? this.updatedAt,
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
      slaughterhouse: data.slaughterhouse.present
          ? data.slaughterhouse.value
          : this.slaughterhouse,
      freightForwarder: data.freightForwarder.present
          ? data.freightForwarder.value
          : this.freightForwarder,
      airline: data.airline.present ? data.airline.value : this.airline,
      destinationWarehouse: data.destinationWarehouse.present
          ? data.destinationWarehouse.value
          : this.destinationWarehouse,
      supplier: data.supplier.present ? data.supplier.value : this.supplier,
      buyer: data.buyer.present ? data.buyer.value : this.buyer,
      animalType:
          data.animalType.present ? data.animalType.value : this.animalType,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      purchaseWeight: data.purchaseWeight.present
          ? data.purchaseWeight.value
          : this.purchaseWeight,
      carcassWeight: data.carcassWeight.present
          ? data.carcassWeight.value
          : this.carcassWeight,
      netSaleWeight: data.netSaleWeight.present
          ? data.netSaleWeight.value
          : this.netSaleWeight,
      nextAction:
          data.nextAction.present ? data.nextAction.value : this.nextAction,
      paymentStatus: data.paymentStatus.present
          ? data.paymentStatus.value
          : this.paymentStatus,
      paymentDue:
          data.paymentDue.present ? data.paymentDue.value : this.paymentDue,
      paymentReceivedDate: data.paymentReceivedDate.present
          ? data.paymentReceivedDate.value
          : this.paymentReceivedDate,
      outstandingBalance: data.outstandingBalance.present
          ? data.outstandingBalance.value
          : this.outstandingBalance,
      purchaseCost: data.purchaseCost.present
          ? data.purchaseCost.value
          : this.purchaseCost,
      salePrice: data.salePrice.present ? data.salePrice.value : this.salePrice,
      weight: data.weight.present ? data.weight.value : this.weight,
      awbNumber: data.awbNumber.present ? data.awbNumber.value : this.awbNumber,
      flightNumber: data.flightNumber.present
          ? data.flightNumber.value
          : this.flightNumber,
      departureDate: data.departureDate.present
          ? data.departureDate.value
          : this.departureDate,
      arrivalDate:
          data.arrivalDate.present ? data.arrivalDate.value : this.arrivalDate,
      notes: data.notes.present ? data.notes.value : this.notes,
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
      slaughterhouseCost: data.slaughterhouseCost.present
          ? data.slaughterhouseCost.value
          : this.slaughterhouseCost,
      coldStorageCost: data.coldStorageCost.present
          ? data.coldStorageCost.value
          : this.coldStorageCost,
      freightCost:
          data.freightCost.present ? data.freightCost.value : this.freightCost,
      airportHandlingCost: data.airportHandlingCost.present
          ? data.airportHandlingCost.value
          : this.airportHandlingCost,
      firestoreId:
          data.firestoreId.present ? data.firestoreId.value : this.firestoreId,
      synced: data.synced.present ? data.synced.value : this.synced,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
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
          ..write('slaughterhouse: $slaughterhouse, ')
          ..write('freightForwarder: $freightForwarder, ')
          ..write('airline: $airline, ')
          ..write('destinationWarehouse: $destinationWarehouse, ')
          ..write('supplier: $supplier, ')
          ..write('buyer: $buyer, ')
          ..write('animalType: $animalType, ')
          ..write('quantity: $quantity, ')
          ..write('purchaseWeight: $purchaseWeight, ')
          ..write('carcassWeight: $carcassWeight, ')
          ..write('netSaleWeight: $netSaleWeight, ')
          ..write('nextAction: $nextAction, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('paymentDue: $paymentDue, ')
          ..write('paymentReceivedDate: $paymentReceivedDate, ')
          ..write('outstandingBalance: $outstandingBalance, ')
          ..write('purchaseCost: $purchaseCost, ')
          ..write('salePrice: $salePrice, ')
          ..write('weight: $weight, ')
          ..write('awbNumber: $awbNumber, ')
          ..write('flightNumber: $flightNumber, ')
          ..write('departureDate: $departureDate, ')
          ..write('arrivalDate: $arrivalDate, ')
          ..write('notes: $notes, ')
          ..write('status: $status, ')
          ..write('currentStage: $currentStage, ')
          ..write('slaughterDone: $slaughterDone, ')
          ..write('warehouseDone: $warehouseDone, ')
          ..write('slaughterhouseCost: $slaughterhouseCost, ')
          ..write('coldStorageCost: $coldStorageCost, ')
          ..write('freightCost: $freightCost, ')
          ..write('airportHandlingCost: $airportHandlingCost, ')
          ..write('firestoreId: $firestoreId, ')
          ..write('synced: $synced, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('archived: $archived')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        title,
        shipmentCode,
        origin,
        destination,
        slaughterhouse,
        freightForwarder,
        airline,
        destinationWarehouse,
        supplier,
        buyer,
        animalType,
        quantity,
        purchaseWeight,
        carcassWeight,
        netSaleWeight,
        nextAction,
        paymentStatus,
        paymentDue,
        paymentReceivedDate,
        outstandingBalance,
        purchaseCost,
        salePrice,
        weight,
        awbNumber,
        flightNumber,
        departureDate,
        arrivalDate,
        notes,
        status,
        currentStage,
        slaughterDone,
        warehouseDone,
        slaughterhouseCost,
        coldStorageCost,
        freightCost,
        airportHandlingCost,
        firestoreId,
        synced,
        updatedAt,
        archived
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shipment &&
          other.id == this.id &&
          other.title == this.title &&
          other.shipmentCode == this.shipmentCode &&
          other.origin == this.origin &&
          other.destination == this.destination &&
          other.slaughterhouse == this.slaughterhouse &&
          other.freightForwarder == this.freightForwarder &&
          other.airline == this.airline &&
          other.destinationWarehouse == this.destinationWarehouse &&
          other.supplier == this.supplier &&
          other.buyer == this.buyer &&
          other.animalType == this.animalType &&
          other.quantity == this.quantity &&
          other.purchaseWeight == this.purchaseWeight &&
          other.carcassWeight == this.carcassWeight &&
          other.netSaleWeight == this.netSaleWeight &&
          other.nextAction == this.nextAction &&
          other.paymentStatus == this.paymentStatus &&
          other.paymentDue == this.paymentDue &&
          other.paymentReceivedDate == this.paymentReceivedDate &&
          other.outstandingBalance == this.outstandingBalance &&
          other.purchaseCost == this.purchaseCost &&
          other.salePrice == this.salePrice &&
          other.weight == this.weight &&
          other.awbNumber == this.awbNumber &&
          other.flightNumber == this.flightNumber &&
          other.departureDate == this.departureDate &&
          other.arrivalDate == this.arrivalDate &&
          other.notes == this.notes &&
          other.status == this.status &&
          other.currentStage == this.currentStage &&
          other.slaughterDone == this.slaughterDone &&
          other.warehouseDone == this.warehouseDone &&
          other.slaughterhouseCost == this.slaughterhouseCost &&
          other.coldStorageCost == this.coldStorageCost &&
          other.freightCost == this.freightCost &&
          other.airportHandlingCost == this.airportHandlingCost &&
          other.firestoreId == this.firestoreId &&
          other.synced == this.synced &&
          other.updatedAt == this.updatedAt &&
          other.archived == this.archived);
}

class ShipmentsCompanion extends UpdateCompanion<Shipment> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> shipmentCode;
  final Value<String> origin;
  final Value<String> destination;
  final Value<String?> slaughterhouse;
  final Value<String?> freightForwarder;
  final Value<String?> airline;
  final Value<String?> destinationWarehouse;
  final Value<String?> supplier;
  final Value<String?> buyer;
  final Value<String?> animalType;
  final Value<double> quantity;
  final Value<double> purchaseWeight;
  final Value<double> carcassWeight;
  final Value<double> netSaleWeight;
  final Value<String> nextAction;
  final Value<String> paymentStatus;
  final Value<DateTime?> paymentDue;
  final Value<DateTime?> paymentReceivedDate;
  final Value<double> outstandingBalance;
  final Value<double> purchaseCost;
  final Value<double> salePrice;
  final Value<double> weight;
  final Value<String?> awbNumber;
  final Value<String?> flightNumber;
  final Value<DateTime?> departureDate;
  final Value<DateTime?> arrivalDate;
  final Value<String?> notes;
  final Value<String> status;
  final Value<String> currentStage;
  final Value<bool> slaughterDone;
  final Value<bool> warehouseDone;
  final Value<double?> slaughterhouseCost;
  final Value<double?> coldStorageCost;
  final Value<double?> freightCost;
  final Value<double?> airportHandlingCost;
  final Value<String?> firestoreId;
  final Value<bool> synced;
  final Value<DateTime> updatedAt;
  final Value<bool> archived;
  const ShipmentsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.shipmentCode = const Value.absent(),
    this.origin = const Value.absent(),
    this.destination = const Value.absent(),
    this.slaughterhouse = const Value.absent(),
    this.freightForwarder = const Value.absent(),
    this.airline = const Value.absent(),
    this.destinationWarehouse = const Value.absent(),
    this.supplier = const Value.absent(),
    this.buyer = const Value.absent(),
    this.animalType = const Value.absent(),
    this.quantity = const Value.absent(),
    this.purchaseWeight = const Value.absent(),
    this.carcassWeight = const Value.absent(),
    this.netSaleWeight = const Value.absent(),
    this.nextAction = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.paymentDue = const Value.absent(),
    this.paymentReceivedDate = const Value.absent(),
    this.outstandingBalance = const Value.absent(),
    this.purchaseCost = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.weight = const Value.absent(),
    this.awbNumber = const Value.absent(),
    this.flightNumber = const Value.absent(),
    this.departureDate = const Value.absent(),
    this.arrivalDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    this.currentStage = const Value.absent(),
    this.slaughterDone = const Value.absent(),
    this.warehouseDone = const Value.absent(),
    this.slaughterhouseCost = const Value.absent(),
    this.coldStorageCost = const Value.absent(),
    this.freightCost = const Value.absent(),
    this.airportHandlingCost = const Value.absent(),
    this.firestoreId = const Value.absent(),
    this.synced = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.archived = const Value.absent(),
  });
  ShipmentsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.shipmentCode = const Value.absent(),
    this.origin = const Value.absent(),
    this.destination = const Value.absent(),
    this.slaughterhouse = const Value.absent(),
    this.freightForwarder = const Value.absent(),
    this.airline = const Value.absent(),
    this.destinationWarehouse = const Value.absent(),
    this.supplier = const Value.absent(),
    this.buyer = const Value.absent(),
    this.animalType = const Value.absent(),
    this.quantity = const Value.absent(),
    this.purchaseWeight = const Value.absent(),
    this.carcassWeight = const Value.absent(),
    this.netSaleWeight = const Value.absent(),
    this.nextAction = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.paymentDue = const Value.absent(),
    this.paymentReceivedDate = const Value.absent(),
    this.outstandingBalance = const Value.absent(),
    this.purchaseCost = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.weight = const Value.absent(),
    this.awbNumber = const Value.absent(),
    this.flightNumber = const Value.absent(),
    this.departureDate = const Value.absent(),
    this.arrivalDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    this.currentStage = const Value.absent(),
    this.slaughterDone = const Value.absent(),
    this.warehouseDone = const Value.absent(),
    this.slaughterhouseCost = const Value.absent(),
    this.coldStorageCost = const Value.absent(),
    this.freightCost = const Value.absent(),
    this.airportHandlingCost = const Value.absent(),
    this.firestoreId = const Value.absent(),
    this.synced = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.archived = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Shipment> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? shipmentCode,
    Expression<String>? origin,
    Expression<String>? destination,
    Expression<String>? slaughterhouse,
    Expression<String>? freightForwarder,
    Expression<String>? airline,
    Expression<String>? destinationWarehouse,
    Expression<String>? supplier,
    Expression<String>? buyer,
    Expression<String>? animalType,
    Expression<double>? quantity,
    Expression<double>? purchaseWeight,
    Expression<double>? carcassWeight,
    Expression<double>? netSaleWeight,
    Expression<String>? nextAction,
    Expression<String>? paymentStatus,
    Expression<DateTime>? paymentDue,
    Expression<DateTime>? paymentReceivedDate,
    Expression<double>? outstandingBalance,
    Expression<double>? purchaseCost,
    Expression<double>? salePrice,
    Expression<double>? weight,
    Expression<String>? awbNumber,
    Expression<String>? flightNumber,
    Expression<DateTime>? departureDate,
    Expression<DateTime>? arrivalDate,
    Expression<String>? notes,
    Expression<String>? status,
    Expression<String>? currentStage,
    Expression<bool>? slaughterDone,
    Expression<bool>? warehouseDone,
    Expression<double>? slaughterhouseCost,
    Expression<double>? coldStorageCost,
    Expression<double>? freightCost,
    Expression<double>? airportHandlingCost,
    Expression<String>? firestoreId,
    Expression<bool>? synced,
    Expression<DateTime>? updatedAt,
    Expression<bool>? archived,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (shipmentCode != null) 'shipment_code': shipmentCode,
      if (origin != null) 'origin': origin,
      if (destination != null) 'destination': destination,
      if (slaughterhouse != null) 'slaughterhouse': slaughterhouse,
      if (freightForwarder != null) 'freight_forwarder': freightForwarder,
      if (airline != null) 'airline': airline,
      if (destinationWarehouse != null)
        'destination_warehouse': destinationWarehouse,
      if (supplier != null) 'supplier': supplier,
      if (buyer != null) 'buyer': buyer,
      if (animalType != null) 'animal_type': animalType,
      if (quantity != null) 'quantity': quantity,
      if (purchaseWeight != null) 'purchase_weight': purchaseWeight,
      if (carcassWeight != null) 'carcass_weight': carcassWeight,
      if (netSaleWeight != null) 'net_sale_weight': netSaleWeight,
      if (nextAction != null) 'next_action': nextAction,
      if (paymentStatus != null) 'payment_status': paymentStatus,
      if (paymentDue != null) 'payment_due': paymentDue,
      if (paymentReceivedDate != null)
        'payment_received_date': paymentReceivedDate,
      if (outstandingBalance != null) 'outstanding_balance': outstandingBalance,
      if (purchaseCost != null) 'purchase_cost': purchaseCost,
      if (salePrice != null) 'sale_price': salePrice,
      if (weight != null) 'weight': weight,
      if (awbNumber != null) 'awb_number': awbNumber,
      if (flightNumber != null) 'flight_number': flightNumber,
      if (departureDate != null) 'departure_date': departureDate,
      if (arrivalDate != null) 'arrival_date': arrivalDate,
      if (notes != null) 'notes': notes,
      if (status != null) 'status': status,
      if (currentStage != null) 'current_stage': currentStage,
      if (slaughterDone != null) 'slaughter_done': slaughterDone,
      if (warehouseDone != null) 'warehouse_done': warehouseDone,
      if (slaughterhouseCost != null) 'slaughterhouse_cost': slaughterhouseCost,
      if (coldStorageCost != null) 'cold_storage_cost': coldStorageCost,
      if (freightCost != null) 'freight_cost': freightCost,
      if (airportHandlingCost != null)
        'airport_handling_cost': airportHandlingCost,
      if (firestoreId != null) 'firestore_id': firestoreId,
      if (synced != null) 'synced': synced,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (archived != null) 'archived': archived,
    });
  }

  ShipmentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? shipmentCode,
      Value<String>? origin,
      Value<String>? destination,
      Value<String?>? slaughterhouse,
      Value<String?>? freightForwarder,
      Value<String?>? airline,
      Value<String?>? destinationWarehouse,
      Value<String?>? supplier,
      Value<String?>? buyer,
      Value<String?>? animalType,
      Value<double>? quantity,
      Value<double>? purchaseWeight,
      Value<double>? carcassWeight,
      Value<double>? netSaleWeight,
      Value<String>? nextAction,
      Value<String>? paymentStatus,
      Value<DateTime?>? paymentDue,
      Value<DateTime?>? paymentReceivedDate,
      Value<double>? outstandingBalance,
      Value<double>? purchaseCost,
      Value<double>? salePrice,
      Value<double>? weight,
      Value<String?>? awbNumber,
      Value<String?>? flightNumber,
      Value<DateTime?>? departureDate,
      Value<DateTime?>? arrivalDate,
      Value<String?>? notes,
      Value<String>? status,
      Value<String>? currentStage,
      Value<bool>? slaughterDone,
      Value<bool>? warehouseDone,
      Value<double?>? slaughterhouseCost,
      Value<double?>? coldStorageCost,
      Value<double?>? freightCost,
      Value<double?>? airportHandlingCost,
      Value<String?>? firestoreId,
      Value<bool>? synced,
      Value<DateTime>? updatedAt,
      Value<bool>? archived}) {
    return ShipmentsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      shipmentCode: shipmentCode ?? this.shipmentCode,
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      slaughterhouse: slaughterhouse ?? this.slaughterhouse,
      freightForwarder: freightForwarder ?? this.freightForwarder,
      airline: airline ?? this.airline,
      destinationWarehouse: destinationWarehouse ?? this.destinationWarehouse,
      supplier: supplier ?? this.supplier,
      buyer: buyer ?? this.buyer,
      animalType: animalType ?? this.animalType,
      quantity: quantity ?? this.quantity,
      purchaseWeight: purchaseWeight ?? this.purchaseWeight,
      carcassWeight: carcassWeight ?? this.carcassWeight,
      netSaleWeight: netSaleWeight ?? this.netSaleWeight,
      nextAction: nextAction ?? this.nextAction,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paymentDue: paymentDue ?? this.paymentDue,
      paymentReceivedDate: paymentReceivedDate ?? this.paymentReceivedDate,
      outstandingBalance: outstandingBalance ?? this.outstandingBalance,
      purchaseCost: purchaseCost ?? this.purchaseCost,
      salePrice: salePrice ?? this.salePrice,
      weight: weight ?? this.weight,
      awbNumber: awbNumber ?? this.awbNumber,
      flightNumber: flightNumber ?? this.flightNumber,
      departureDate: departureDate ?? this.departureDate,
      arrivalDate: arrivalDate ?? this.arrivalDate,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      currentStage: currentStage ?? this.currentStage,
      slaughterDone: slaughterDone ?? this.slaughterDone,
      warehouseDone: warehouseDone ?? this.warehouseDone,
      slaughterhouseCost: slaughterhouseCost ?? this.slaughterhouseCost,
      coldStorageCost: coldStorageCost ?? this.coldStorageCost,
      freightCost: freightCost ?? this.freightCost,
      airportHandlingCost: airportHandlingCost ?? this.airportHandlingCost,
      firestoreId: firestoreId ?? this.firestoreId,
      synced: synced ?? this.synced,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (slaughterhouse.present) {
      map['slaughterhouse'] = Variable<String>(slaughterhouse.value);
    }
    if (freightForwarder.present) {
      map['freight_forwarder'] = Variable<String>(freightForwarder.value);
    }
    if (airline.present) {
      map['airline'] = Variable<String>(airline.value);
    }
    if (destinationWarehouse.present) {
      map['destination_warehouse'] =
          Variable<String>(destinationWarehouse.value);
    }
    if (supplier.present) {
      map['supplier'] = Variable<String>(supplier.value);
    }
    if (buyer.present) {
      map['buyer'] = Variable<String>(buyer.value);
    }
    if (animalType.present) {
      map['animal_type'] = Variable<String>(animalType.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (purchaseWeight.present) {
      map['purchase_weight'] = Variable<double>(purchaseWeight.value);
    }
    if (carcassWeight.present) {
      map['carcass_weight'] = Variable<double>(carcassWeight.value);
    }
    if (netSaleWeight.present) {
      map['net_sale_weight'] = Variable<double>(netSaleWeight.value);
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
    if (paymentReceivedDate.present) {
      map['payment_received_date'] =
          Variable<DateTime>(paymentReceivedDate.value);
    }
    if (outstandingBalance.present) {
      map['outstanding_balance'] = Variable<double>(outstandingBalance.value);
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
    if (awbNumber.present) {
      map['awb_number'] = Variable<String>(awbNumber.value);
    }
    if (flightNumber.present) {
      map['flight_number'] = Variable<String>(flightNumber.value);
    }
    if (departureDate.present) {
      map['departure_date'] = Variable<DateTime>(departureDate.value);
    }
    if (arrivalDate.present) {
      map['arrival_date'] = Variable<DateTime>(arrivalDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
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
    if (slaughterhouseCost.present) {
      map['slaughterhouse_cost'] = Variable<double>(slaughterhouseCost.value);
    }
    if (coldStorageCost.present) {
      map['cold_storage_cost'] = Variable<double>(coldStorageCost.value);
    }
    if (freightCost.present) {
      map['freight_cost'] = Variable<double>(freightCost.value);
    }
    if (airportHandlingCost.present) {
      map['airport_handling_cost'] =
          Variable<double>(airportHandlingCost.value);
    }
    if (firestoreId.present) {
      map['firestore_id'] = Variable<String>(firestoreId.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
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
          ..write('slaughterhouse: $slaughterhouse, ')
          ..write('freightForwarder: $freightForwarder, ')
          ..write('airline: $airline, ')
          ..write('destinationWarehouse: $destinationWarehouse, ')
          ..write('supplier: $supplier, ')
          ..write('buyer: $buyer, ')
          ..write('animalType: $animalType, ')
          ..write('quantity: $quantity, ')
          ..write('purchaseWeight: $purchaseWeight, ')
          ..write('carcassWeight: $carcassWeight, ')
          ..write('netSaleWeight: $netSaleWeight, ')
          ..write('nextAction: $nextAction, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('paymentDue: $paymentDue, ')
          ..write('paymentReceivedDate: $paymentReceivedDate, ')
          ..write('outstandingBalance: $outstandingBalance, ')
          ..write('purchaseCost: $purchaseCost, ')
          ..write('salePrice: $salePrice, ')
          ..write('weight: $weight, ')
          ..write('awbNumber: $awbNumber, ')
          ..write('flightNumber: $flightNumber, ')
          ..write('departureDate: $departureDate, ')
          ..write('arrivalDate: $arrivalDate, ')
          ..write('notes: $notes, ')
          ..write('status: $status, ')
          ..write('currentStage: $currentStage, ')
          ..write('slaughterDone: $slaughterDone, ')
          ..write('warehouseDone: $warehouseDone, ')
          ..write('slaughterhouseCost: $slaughterhouseCost, ')
          ..write('coldStorageCost: $coldStorageCost, ')
          ..write('freightCost: $freightCost, ')
          ..write('airportHandlingCost: $airportHandlingCost, ')
          ..write('firestoreId: $firestoreId, ')
          ..write('synced: $synced, ')
          ..write('updatedAt: $updatedAt, ')
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
  Value<String?> slaughterhouse,
  Value<String?> freightForwarder,
  Value<String?> airline,
  Value<String?> destinationWarehouse,
  Value<String?> supplier,
  Value<String?> buyer,
  Value<String?> animalType,
  Value<double> quantity,
  Value<double> purchaseWeight,
  Value<double> carcassWeight,
  Value<double> netSaleWeight,
  Value<String> nextAction,
  Value<String> paymentStatus,
  Value<DateTime?> paymentDue,
  Value<DateTime?> paymentReceivedDate,
  Value<double> outstandingBalance,
  Value<double> purchaseCost,
  Value<double> salePrice,
  Value<double> weight,
  Value<String?> awbNumber,
  Value<String?> flightNumber,
  Value<DateTime?> departureDate,
  Value<DateTime?> arrivalDate,
  Value<String?> notes,
  Value<String> status,
  Value<String> currentStage,
  Value<bool> slaughterDone,
  Value<bool> warehouseDone,
  Value<double?> slaughterhouseCost,
  Value<double?> coldStorageCost,
  Value<double?> freightCost,
  Value<double?> airportHandlingCost,
  Value<String?> firestoreId,
  Value<bool> synced,
  Value<DateTime> updatedAt,
  Value<bool> archived,
});
typedef $$ShipmentsTableUpdateCompanionBuilder = ShipmentsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String?> shipmentCode,
  Value<String> origin,
  Value<String> destination,
  Value<String?> slaughterhouse,
  Value<String?> freightForwarder,
  Value<String?> airline,
  Value<String?> destinationWarehouse,
  Value<String?> supplier,
  Value<String?> buyer,
  Value<String?> animalType,
  Value<double> quantity,
  Value<double> purchaseWeight,
  Value<double> carcassWeight,
  Value<double> netSaleWeight,
  Value<String> nextAction,
  Value<String> paymentStatus,
  Value<DateTime?> paymentDue,
  Value<DateTime?> paymentReceivedDate,
  Value<double> outstandingBalance,
  Value<double> purchaseCost,
  Value<double> salePrice,
  Value<double> weight,
  Value<String?> awbNumber,
  Value<String?> flightNumber,
  Value<DateTime?> departureDate,
  Value<DateTime?> arrivalDate,
  Value<String?> notes,
  Value<String> status,
  Value<String> currentStage,
  Value<bool> slaughterDone,
  Value<bool> warehouseDone,
  Value<double?> slaughterhouseCost,
  Value<double?> coldStorageCost,
  Value<double?> freightCost,
  Value<double?> airportHandlingCost,
  Value<String?> firestoreId,
  Value<bool> synced,
  Value<DateTime> updatedAt,
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

  ColumnFilters<String> get slaughterhouse => $composableBuilder(
      column: $table.slaughterhouse,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get freightForwarder => $composableBuilder(
      column: $table.freightForwarder,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get airline => $composableBuilder(
      column: $table.airline, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get destinationWarehouse => $composableBuilder(
      column: $table.destinationWarehouse,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get supplier => $composableBuilder(
      column: $table.supplier, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get buyer => $composableBuilder(
      column: $table.buyer, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get animalType => $composableBuilder(
      column: $table.animalType, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get purchaseWeight => $composableBuilder(
      column: $table.purchaseWeight,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get carcassWeight => $composableBuilder(
      column: $table.carcassWeight, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get netSaleWeight => $composableBuilder(
      column: $table.netSaleWeight, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nextAction => $composableBuilder(
      column: $table.nextAction, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get paymentDue => $composableBuilder(
      column: $table.paymentDue, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get paymentReceivedDate => $composableBuilder(
      column: $table.paymentReceivedDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get outstandingBalance => $composableBuilder(
      column: $table.outstandingBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get purchaseCost => $composableBuilder(
      column: $table.purchaseCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get salePrice => $composableBuilder(
      column: $table.salePrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get awbNumber => $composableBuilder(
      column: $table.awbNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get flightNumber => $composableBuilder(
      column: $table.flightNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get departureDate => $composableBuilder(
      column: $table.departureDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get arrivalDate => $composableBuilder(
      column: $table.arrivalDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currentStage => $composableBuilder(
      column: $table.currentStage, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get slaughterDone => $composableBuilder(
      column: $table.slaughterDone, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get warehouseDone => $composableBuilder(
      column: $table.warehouseDone, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get slaughterhouseCost => $composableBuilder(
      column: $table.slaughterhouseCost,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get coldStorageCost => $composableBuilder(
      column: $table.coldStorageCost,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get freightCost => $composableBuilder(
      column: $table.freightCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get airportHandlingCost => $composableBuilder(
      column: $table.airportHandlingCost,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firestoreId => $composableBuilder(
      column: $table.firestoreId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<String> get slaughterhouse => $composableBuilder(
      column: $table.slaughterhouse,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get freightForwarder => $composableBuilder(
      column: $table.freightForwarder,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get airline => $composableBuilder(
      column: $table.airline, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get destinationWarehouse => $composableBuilder(
      column: $table.destinationWarehouse,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get supplier => $composableBuilder(
      column: $table.supplier, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get buyer => $composableBuilder(
      column: $table.buyer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get animalType => $composableBuilder(
      column: $table.animalType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get purchaseWeight => $composableBuilder(
      column: $table.purchaseWeight,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get carcassWeight => $composableBuilder(
      column: $table.carcassWeight,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get netSaleWeight => $composableBuilder(
      column: $table.netSaleWeight,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nextAction => $composableBuilder(
      column: $table.nextAction, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get paymentDue => $composableBuilder(
      column: $table.paymentDue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get paymentReceivedDate => $composableBuilder(
      column: $table.paymentReceivedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get outstandingBalance => $composableBuilder(
      column: $table.outstandingBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get purchaseCost => $composableBuilder(
      column: $table.purchaseCost,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get salePrice => $composableBuilder(
      column: $table.salePrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get awbNumber => $composableBuilder(
      column: $table.awbNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get flightNumber => $composableBuilder(
      column: $table.flightNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get departureDate => $composableBuilder(
      column: $table.departureDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get arrivalDate => $composableBuilder(
      column: $table.arrivalDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

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

  ColumnOrderings<double> get slaughterhouseCost => $composableBuilder(
      column: $table.slaughterhouseCost,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get coldStorageCost => $composableBuilder(
      column: $table.coldStorageCost,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get freightCost => $composableBuilder(
      column: $table.freightCost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get airportHandlingCost => $composableBuilder(
      column: $table.airportHandlingCost,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firestoreId => $composableBuilder(
      column: $table.firestoreId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<String> get slaughterhouse => $composableBuilder(
      column: $table.slaughterhouse, builder: (column) => column);

  GeneratedColumn<String> get freightForwarder => $composableBuilder(
      column: $table.freightForwarder, builder: (column) => column);

  GeneratedColumn<String> get airline =>
      $composableBuilder(column: $table.airline, builder: (column) => column);

  GeneratedColumn<String> get destinationWarehouse => $composableBuilder(
      column: $table.destinationWarehouse, builder: (column) => column);

  GeneratedColumn<String> get supplier =>
      $composableBuilder(column: $table.supplier, builder: (column) => column);

  GeneratedColumn<String> get buyer =>
      $composableBuilder(column: $table.buyer, builder: (column) => column);

  GeneratedColumn<String> get animalType => $composableBuilder(
      column: $table.animalType, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get purchaseWeight => $composableBuilder(
      column: $table.purchaseWeight, builder: (column) => column);

  GeneratedColumn<double> get carcassWeight => $composableBuilder(
      column: $table.carcassWeight, builder: (column) => column);

  GeneratedColumn<double> get netSaleWeight => $composableBuilder(
      column: $table.netSaleWeight, builder: (column) => column);

  GeneratedColumn<String> get nextAction => $composableBuilder(
      column: $table.nextAction, builder: (column) => column);

  GeneratedColumn<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentDue => $composableBuilder(
      column: $table.paymentDue, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentReceivedDate => $composableBuilder(
      column: $table.paymentReceivedDate, builder: (column) => column);

  GeneratedColumn<double> get outstandingBalance => $composableBuilder(
      column: $table.outstandingBalance, builder: (column) => column);

  GeneratedColumn<double> get purchaseCost => $composableBuilder(
      column: $table.purchaseCost, builder: (column) => column);

  GeneratedColumn<double> get salePrice =>
      $composableBuilder(column: $table.salePrice, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get awbNumber =>
      $composableBuilder(column: $table.awbNumber, builder: (column) => column);

  GeneratedColumn<String> get flightNumber => $composableBuilder(
      column: $table.flightNumber, builder: (column) => column);

  GeneratedColumn<DateTime> get departureDate => $composableBuilder(
      column: $table.departureDate, builder: (column) => column);

  GeneratedColumn<DateTime> get arrivalDate => $composableBuilder(
      column: $table.arrivalDate, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get currentStage => $composableBuilder(
      column: $table.currentStage, builder: (column) => column);

  GeneratedColumn<bool> get slaughterDone => $composableBuilder(
      column: $table.slaughterDone, builder: (column) => column);

  GeneratedColumn<bool> get warehouseDone => $composableBuilder(
      column: $table.warehouseDone, builder: (column) => column);

  GeneratedColumn<double> get slaughterhouseCost => $composableBuilder(
      column: $table.slaughterhouseCost, builder: (column) => column);

  GeneratedColumn<double> get coldStorageCost => $composableBuilder(
      column: $table.coldStorageCost, builder: (column) => column);

  GeneratedColumn<double> get freightCost => $composableBuilder(
      column: $table.freightCost, builder: (column) => column);

  GeneratedColumn<double> get airportHandlingCost => $composableBuilder(
      column: $table.airportHandlingCost, builder: (column) => column);

  GeneratedColumn<String> get firestoreId => $composableBuilder(
      column: $table.firestoreId, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

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
            Value<String?> slaughterhouse = const Value.absent(),
            Value<String?> freightForwarder = const Value.absent(),
            Value<String?> airline = const Value.absent(),
            Value<String?> destinationWarehouse = const Value.absent(),
            Value<String?> supplier = const Value.absent(),
            Value<String?> buyer = const Value.absent(),
            Value<String?> animalType = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> purchaseWeight = const Value.absent(),
            Value<double> carcassWeight = const Value.absent(),
            Value<double> netSaleWeight = const Value.absent(),
            Value<String> nextAction = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
            Value<DateTime?> paymentDue = const Value.absent(),
            Value<DateTime?> paymentReceivedDate = const Value.absent(),
            Value<double> outstandingBalance = const Value.absent(),
            Value<double> purchaseCost = const Value.absent(),
            Value<double> salePrice = const Value.absent(),
            Value<double> weight = const Value.absent(),
            Value<String?> awbNumber = const Value.absent(),
            Value<String?> flightNumber = const Value.absent(),
            Value<DateTime?> departureDate = const Value.absent(),
            Value<DateTime?> arrivalDate = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> currentStage = const Value.absent(),
            Value<bool> slaughterDone = const Value.absent(),
            Value<bool> warehouseDone = const Value.absent(),
            Value<double?> slaughterhouseCost = const Value.absent(),
            Value<double?> coldStorageCost = const Value.absent(),
            Value<double?> freightCost = const Value.absent(),
            Value<double?> airportHandlingCost = const Value.absent(),
            Value<String?> firestoreId = const Value.absent(),
            Value<bool> synced = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> archived = const Value.absent(),
          }) =>
              ShipmentsCompanion(
            id: id,
            title: title,
            shipmentCode: shipmentCode,
            origin: origin,
            destination: destination,
            slaughterhouse: slaughterhouse,
            freightForwarder: freightForwarder,
            airline: airline,
            destinationWarehouse: destinationWarehouse,
            supplier: supplier,
            buyer: buyer,
            animalType: animalType,
            quantity: quantity,
            purchaseWeight: purchaseWeight,
            carcassWeight: carcassWeight,
            netSaleWeight: netSaleWeight,
            nextAction: nextAction,
            paymentStatus: paymentStatus,
            paymentDue: paymentDue,
            paymentReceivedDate: paymentReceivedDate,
            outstandingBalance: outstandingBalance,
            purchaseCost: purchaseCost,
            salePrice: salePrice,
            weight: weight,
            awbNumber: awbNumber,
            flightNumber: flightNumber,
            departureDate: departureDate,
            arrivalDate: arrivalDate,
            notes: notes,
            status: status,
            currentStage: currentStage,
            slaughterDone: slaughterDone,
            warehouseDone: warehouseDone,
            slaughterhouseCost: slaughterhouseCost,
            coldStorageCost: coldStorageCost,
            freightCost: freightCost,
            airportHandlingCost: airportHandlingCost,
            firestoreId: firestoreId,
            synced: synced,
            updatedAt: updatedAt,
            archived: archived,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String?> shipmentCode = const Value.absent(),
            Value<String> origin = const Value.absent(),
            Value<String> destination = const Value.absent(),
            Value<String?> slaughterhouse = const Value.absent(),
            Value<String?> freightForwarder = const Value.absent(),
            Value<String?> airline = const Value.absent(),
            Value<String?> destinationWarehouse = const Value.absent(),
            Value<String?> supplier = const Value.absent(),
            Value<String?> buyer = const Value.absent(),
            Value<String?> animalType = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> purchaseWeight = const Value.absent(),
            Value<double> carcassWeight = const Value.absent(),
            Value<double> netSaleWeight = const Value.absent(),
            Value<String> nextAction = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
            Value<DateTime?> paymentDue = const Value.absent(),
            Value<DateTime?> paymentReceivedDate = const Value.absent(),
            Value<double> outstandingBalance = const Value.absent(),
            Value<double> purchaseCost = const Value.absent(),
            Value<double> salePrice = const Value.absent(),
            Value<double> weight = const Value.absent(),
            Value<String?> awbNumber = const Value.absent(),
            Value<String?> flightNumber = const Value.absent(),
            Value<DateTime?> departureDate = const Value.absent(),
            Value<DateTime?> arrivalDate = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> currentStage = const Value.absent(),
            Value<bool> slaughterDone = const Value.absent(),
            Value<bool> warehouseDone = const Value.absent(),
            Value<double?> slaughterhouseCost = const Value.absent(),
            Value<double?> coldStorageCost = const Value.absent(),
            Value<double?> freightCost = const Value.absent(),
            Value<double?> airportHandlingCost = const Value.absent(),
            Value<String?> firestoreId = const Value.absent(),
            Value<bool> synced = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> archived = const Value.absent(),
          }) =>
              ShipmentsCompanion.insert(
            id: id,
            title: title,
            shipmentCode: shipmentCode,
            origin: origin,
            destination: destination,
            slaughterhouse: slaughterhouse,
            freightForwarder: freightForwarder,
            airline: airline,
            destinationWarehouse: destinationWarehouse,
            supplier: supplier,
            buyer: buyer,
            animalType: animalType,
            quantity: quantity,
            purchaseWeight: purchaseWeight,
            carcassWeight: carcassWeight,
            netSaleWeight: netSaleWeight,
            nextAction: nextAction,
            paymentStatus: paymentStatus,
            paymentDue: paymentDue,
            paymentReceivedDate: paymentReceivedDate,
            outstandingBalance: outstandingBalance,
            purchaseCost: purchaseCost,
            salePrice: salePrice,
            weight: weight,
            awbNumber: awbNumber,
            flightNumber: flightNumber,
            departureDate: departureDate,
            arrivalDate: arrivalDate,
            notes: notes,
            status: status,
            currentStage: currentStage,
            slaughterDone: slaughterDone,
            warehouseDone: warehouseDone,
            slaughterhouseCost: slaughterhouseCost,
            coldStorageCost: coldStorageCost,
            freightCost: freightCost,
            airportHandlingCost: airportHandlingCost,
            firestoreId: firestoreId,
            synced: synced,
            updatedAt: updatedAt,
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
