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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
      'origin', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _destinationMeta =
      const VerificationMeta('destination');
  @override
  late final GeneratedColumn<String> destination = GeneratedColumn<String>(
      'destination', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _temperatureMeta =
      const VerificationMeta('temperature');
  @override
  late final GeneratedColumn<double> temperature = GeneratedColumn<double>(
      'temperature', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
      [id, origin, destination, temperature, status, createdAt];
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
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('origin')) {
      context.handle(_originMeta,
          origin.isAcceptableOrUnknown(data['origin']!, _originMeta));
    } else if (isInserting) {
      context.missing(_originMeta);
    }
    if (data.containsKey('destination')) {
      context.handle(
          _destinationMeta,
          destination.isAcceptableOrUnknown(
              data['destination']!, _destinationMeta));
    } else if (isInserting) {
      context.missing(_destinationMeta);
    }
    if (data.containsKey('temperature')) {
      context.handle(
          _temperatureMeta,
          temperature.isAcceptableOrUnknown(
              data['temperature']!, _temperatureMeta));
    } else if (isInserting) {
      context.missing(_temperatureMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
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
  Shipment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Shipment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      origin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}origin'])!,
      destination: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}destination'])!,
      temperature: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}temperature'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ShipmentsTable createAlias(String alias) {
    return $ShipmentsTable(attachedDatabase, alias);
  }
}

class Shipment extends DataClass implements Insertable<Shipment> {
  final String id;
  final String origin;
  final String destination;
  final double temperature;
  final String status;
  final DateTime createdAt;
  const Shipment(
      {required this.id,
      required this.origin,
      required this.destination,
      required this.temperature,
      required this.status,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['origin'] = Variable<String>(origin);
    map['destination'] = Variable<String>(destination);
    map['temperature'] = Variable<double>(temperature);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ShipmentsCompanion toCompanion(bool nullToAbsent) {
    return ShipmentsCompanion(
      id: Value(id),
      origin: Value(origin),
      destination: Value(destination),
      temperature: Value(temperature),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory Shipment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Shipment(
      id: serializer.fromJson<String>(json['id']),
      origin: serializer.fromJson<String>(json['origin']),
      destination: serializer.fromJson<String>(json['destination']),
      temperature: serializer.fromJson<double>(json['temperature']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'origin': serializer.toJson<String>(origin),
      'destination': serializer.toJson<String>(destination),
      'temperature': serializer.toJson<double>(temperature),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Shipment copyWith(
          {String? id,
          String? origin,
          String? destination,
          double? temperature,
          String? status,
          DateTime? createdAt}) =>
      Shipment(
        id: id ?? this.id,
        origin: origin ?? this.origin,
        destination: destination ?? this.destination,
        temperature: temperature ?? this.temperature,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  Shipment copyWithCompanion(ShipmentsCompanion data) {
    return Shipment(
      id: data.id.present ? data.id.value : this.id,
      origin: data.origin.present ? data.origin.value : this.origin,
      destination:
          data.destination.present ? data.destination.value : this.destination,
      temperature:
          data.temperature.present ? data.temperature.value : this.temperature,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Shipment(')
          ..write('id: $id, ')
          ..write('origin: $origin, ')
          ..write('destination: $destination, ')
          ..write('temperature: $temperature, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, origin, destination, temperature, status, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shipment &&
          other.id == this.id &&
          other.origin == this.origin &&
          other.destination == this.destination &&
          other.temperature == this.temperature &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class ShipmentsCompanion extends UpdateCompanion<Shipment> {
  final Value<String> id;
  final Value<String> origin;
  final Value<String> destination;
  final Value<double> temperature;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ShipmentsCompanion({
    this.id = const Value.absent(),
    this.origin = const Value.absent(),
    this.destination = const Value.absent(),
    this.temperature = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShipmentsCompanion.insert({
    required String id,
    required String origin,
    required String destination,
    required double temperature,
    required String status,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        origin = Value(origin),
        destination = Value(destination),
        temperature = Value(temperature),
        status = Value(status);
  static Insertable<Shipment> custom({
    Expression<String>? id,
    Expression<String>? origin,
    Expression<String>? destination,
    Expression<double>? temperature,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (origin != null) 'origin': origin,
      if (destination != null) 'destination': destination,
      if (temperature != null) 'temperature': temperature,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShipmentsCompanion copyWith(
      {Value<String>? id,
      Value<String>? origin,
      Value<String>? destination,
      Value<double>? temperature,
      Value<String>? status,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return ShipmentsCompanion(
      id: id ?? this.id,
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      temperature: temperature ?? this.temperature,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (destination.present) {
      map['destination'] = Variable<String>(destination.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<double>(temperature.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShipmentsCompanion(')
          ..write('id: $id, ')
          ..write('origin: $origin, ')
          ..write('destination: $destination, ')
          ..write('temperature: $temperature, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventLogsTable extends EventLogs
    with TableInfo<$EventLogsTable, EventLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventLogsTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<String> shipmentId = GeneratedColumn<String>(
      'shipment_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _messageMeta =
      const VerificationMeta('message');
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
      'message', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, shipmentId, message, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_logs';
  @override
  VerificationContext validateIntegrity(Insertable<EventLog> instance,
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
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EventLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      shipmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shipment_id'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $EventLogsTable createAlias(String alias) {
    return $EventLogsTable(attachedDatabase, alias);
  }
}

class EventLog extends DataClass implements Insertable<EventLog> {
  final int id;
  final String shipmentId;
  final String message;
  final DateTime timestamp;
  const EventLog(
      {required this.id,
      required this.shipmentId,
      required this.message,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['shipment_id'] = Variable<String>(shipmentId);
    map['message'] = Variable<String>(message);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  EventLogsCompanion toCompanion(bool nullToAbsent) {
    return EventLogsCompanion(
      id: Value(id),
      shipmentId: Value(shipmentId),
      message: Value(message),
      timestamp: Value(timestamp),
    );
  }

  factory EventLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventLog(
      id: serializer.fromJson<int>(json['id']),
      shipmentId: serializer.fromJson<String>(json['shipmentId']),
      message: serializer.fromJson<String>(json['message']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'shipmentId': serializer.toJson<String>(shipmentId),
      'message': serializer.toJson<String>(message),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  EventLog copyWith(
          {int? id,
          String? shipmentId,
          String? message,
          DateTime? timestamp}) =>
      EventLog(
        id: id ?? this.id,
        shipmentId: shipmentId ?? this.shipmentId,
        message: message ?? this.message,
        timestamp: timestamp ?? this.timestamp,
      );
  EventLog copyWithCompanion(EventLogsCompanion data) {
    return EventLog(
      id: data.id.present ? data.id.value : this.id,
      shipmentId:
          data.shipmentId.present ? data.shipmentId.value : this.shipmentId,
      message: data.message.present ? data.message.value : this.message,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventLog(')
          ..write('id: $id, ')
          ..write('shipmentId: $shipmentId, ')
          ..write('message: $message, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, shipmentId, message, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventLog &&
          other.id == this.id &&
          other.shipmentId == this.shipmentId &&
          other.message == this.message &&
          other.timestamp == this.timestamp);
}

class EventLogsCompanion extends UpdateCompanion<EventLog> {
  final Value<int> id;
  final Value<String> shipmentId;
  final Value<String> message;
  final Value<DateTime> timestamp;
  const EventLogsCompanion({
    this.id = const Value.absent(),
    this.shipmentId = const Value.absent(),
    this.message = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  EventLogsCompanion.insert({
    this.id = const Value.absent(),
    required String shipmentId,
    required String message,
    this.timestamp = const Value.absent(),
  })  : shipmentId = Value(shipmentId),
        message = Value(message);
  static Insertable<EventLog> custom({
    Expression<int>? id,
    Expression<String>? shipmentId,
    Expression<String>? message,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shipmentId != null) 'shipment_id': shipmentId,
      if (message != null) 'message': message,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  EventLogsCompanion copyWith(
      {Value<int>? id,
      Value<String>? shipmentId,
      Value<String>? message,
      Value<DateTime>? timestamp}) {
    return EventLogsCompanion(
      id: id ?? this.id,
      shipmentId: shipmentId ?? this.shipmentId,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shipmentId.present) {
      map['shipment_id'] = Variable<String>(shipmentId.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventLogsCompanion(')
          ..write('id: $id, ')
          ..write('shipmentId: $shipmentId, ')
          ..write('message: $message, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $TemperatureLogsTable extends TemperatureLogs
    with TableInfo<$TemperatureLogsTable, TemperatureLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TemperatureLogsTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<String> shipmentId = GeneratedColumn<String>(
      'shipment_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
      'value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _recordedAtMeta =
      const VerificationMeta('recordedAt');
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
      'recorded_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, shipmentId, value, recordedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'temperature_logs';
  @override
  VerificationContext validateIntegrity(Insertable<TemperatureLog> instance,
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
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
          _recordedAtMeta,
          recordedAt.isAcceptableOrUnknown(
              data['recorded_at']!, _recordedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TemperatureLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TemperatureLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      shipmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shipment_id'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}value'])!,
      recordedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}recorded_at'])!,
    );
  }

  @override
  $TemperatureLogsTable createAlias(String alias) {
    return $TemperatureLogsTable(attachedDatabase, alias);
  }
}

class TemperatureLog extends DataClass implements Insertable<TemperatureLog> {
  final int id;
  final String shipmentId;
  final double value;
  final DateTime recordedAt;
  const TemperatureLog(
      {required this.id,
      required this.shipmentId,
      required this.value,
      required this.recordedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['shipment_id'] = Variable<String>(shipmentId);
    map['value'] = Variable<double>(value);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    return map;
  }

  TemperatureLogsCompanion toCompanion(bool nullToAbsent) {
    return TemperatureLogsCompanion(
      id: Value(id),
      shipmentId: Value(shipmentId),
      value: Value(value),
      recordedAt: Value(recordedAt),
    );
  }

  factory TemperatureLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TemperatureLog(
      id: serializer.fromJson<int>(json['id']),
      shipmentId: serializer.fromJson<String>(json['shipmentId']),
      value: serializer.fromJson<double>(json['value']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'shipmentId': serializer.toJson<String>(shipmentId),
      'value': serializer.toJson<double>(value),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
    };
  }

  TemperatureLog copyWith(
          {int? id, String? shipmentId, double? value, DateTime? recordedAt}) =>
      TemperatureLog(
        id: id ?? this.id,
        shipmentId: shipmentId ?? this.shipmentId,
        value: value ?? this.value,
        recordedAt: recordedAt ?? this.recordedAt,
      );
  TemperatureLog copyWithCompanion(TemperatureLogsCompanion data) {
    return TemperatureLog(
      id: data.id.present ? data.id.value : this.id,
      shipmentId:
          data.shipmentId.present ? data.shipmentId.value : this.shipmentId,
      value: data.value.present ? data.value.value : this.value,
      recordedAt:
          data.recordedAt.present ? data.recordedAt.value : this.recordedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TemperatureLog(')
          ..write('id: $id, ')
          ..write('shipmentId: $shipmentId, ')
          ..write('value: $value, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, shipmentId, value, recordedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TemperatureLog &&
          other.id == this.id &&
          other.shipmentId == this.shipmentId &&
          other.value == this.value &&
          other.recordedAt == this.recordedAt);
}

class TemperatureLogsCompanion extends UpdateCompanion<TemperatureLog> {
  final Value<int> id;
  final Value<String> shipmentId;
  final Value<double> value;
  final Value<DateTime> recordedAt;
  const TemperatureLogsCompanion({
    this.id = const Value.absent(),
    this.shipmentId = const Value.absent(),
    this.value = const Value.absent(),
    this.recordedAt = const Value.absent(),
  });
  TemperatureLogsCompanion.insert({
    this.id = const Value.absent(),
    required String shipmentId,
    required double value,
    this.recordedAt = const Value.absent(),
  })  : shipmentId = Value(shipmentId),
        value = Value(value);
  static Insertable<TemperatureLog> custom({
    Expression<int>? id,
    Expression<String>? shipmentId,
    Expression<double>? value,
    Expression<DateTime>? recordedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shipmentId != null) 'shipment_id': shipmentId,
      if (value != null) 'value': value,
      if (recordedAt != null) 'recorded_at': recordedAt,
    });
  }

  TemperatureLogsCompanion copyWith(
      {Value<int>? id,
      Value<String>? shipmentId,
      Value<double>? value,
      Value<DateTime>? recordedAt}) {
    return TemperatureLogsCompanion(
      id: id ?? this.id,
      shipmentId: shipmentId ?? this.shipmentId,
      value: value ?? this.value,
      recordedAt: recordedAt ?? this.recordedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shipmentId.present) {
      map['shipment_id'] = Variable<String>(shipmentId.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemperatureLogsCompanion(')
          ..write('id: $id, ')
          ..write('shipmentId: $shipmentId, ')
          ..write('value: $value, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ShipmentsTable shipments = $ShipmentsTable(this);
  late final $EventLogsTable eventLogs = $EventLogsTable(this);
  late final $TemperatureLogsTable temperatureLogs =
      $TemperatureLogsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [shipments, eventLogs, temperatureLogs];
}

typedef $$ShipmentsTableCreateCompanionBuilder = ShipmentsCompanion Function({
  required String id,
  required String origin,
  required String destination,
  required double temperature,
  required String status,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$ShipmentsTableUpdateCompanionBuilder = ShipmentsCompanion Function({
  Value<String> id,
  Value<String> origin,
  Value<String> destination,
  Value<double> temperature,
  Value<String> status,
  Value<DateTime> createdAt,
  Value<int> rowid,
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
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get origin => $composableBuilder(
      column: $table.origin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
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
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get origin => $composableBuilder(
      column: $table.origin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => column);

  GeneratedColumn<double> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
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
            Value<String> id = const Value.absent(),
            Value<String> origin = const Value.absent(),
            Value<String> destination = const Value.absent(),
            Value<double> temperature = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ShipmentsCompanion(
            id: id,
            origin: origin,
            destination: destination,
            temperature: temperature,
            status: status,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String origin,
            required String destination,
            required double temperature,
            required String status,
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ShipmentsCompanion.insert(
            id: id,
            origin: origin,
            destination: destination,
            temperature: temperature,
            status: status,
            createdAt: createdAt,
            rowid: rowid,
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
typedef $$EventLogsTableCreateCompanionBuilder = EventLogsCompanion Function({
  Value<int> id,
  required String shipmentId,
  required String message,
  Value<DateTime> timestamp,
});
typedef $$EventLogsTableUpdateCompanionBuilder = EventLogsCompanion Function({
  Value<int> id,
  Value<String> shipmentId,
  Value<String> message,
  Value<DateTime> timestamp,
});

class $$EventLogsTableFilterComposer
    extends Composer<_$AppDatabase, $EventLogsTable> {
  $$EventLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shipmentId => $composableBuilder(
      column: $table.shipmentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));
}

class $$EventLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $EventLogsTable> {
  $$EventLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shipmentId => $composableBuilder(
      column: $table.shipmentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));
}

class $$EventLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventLogsTable> {
  $$EventLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get shipmentId => $composableBuilder(
      column: $table.shipmentId, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);
}

class $$EventLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EventLogsTable,
    EventLog,
    $$EventLogsTableFilterComposer,
    $$EventLogsTableOrderingComposer,
    $$EventLogsTableAnnotationComposer,
    $$EventLogsTableCreateCompanionBuilder,
    $$EventLogsTableUpdateCompanionBuilder,
    (EventLog, BaseReferences<_$AppDatabase, $EventLogsTable, EventLog>),
    EventLog,
    PrefetchHooks Function()> {
  $$EventLogsTableTableManager(_$AppDatabase db, $EventLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> shipmentId = const Value.absent(),
            Value<String> message = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              EventLogsCompanion(
            id: id,
            shipmentId: shipmentId,
            message: message,
            timestamp: timestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String shipmentId,
            required String message,
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              EventLogsCompanion.insert(
            id: id,
            shipmentId: shipmentId,
            message: message,
            timestamp: timestamp,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EventLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $EventLogsTable,
    EventLog,
    $$EventLogsTableFilterComposer,
    $$EventLogsTableOrderingComposer,
    $$EventLogsTableAnnotationComposer,
    $$EventLogsTableCreateCompanionBuilder,
    $$EventLogsTableUpdateCompanionBuilder,
    (EventLog, BaseReferences<_$AppDatabase, $EventLogsTable, EventLog>),
    EventLog,
    PrefetchHooks Function()>;
typedef $$TemperatureLogsTableCreateCompanionBuilder = TemperatureLogsCompanion
    Function({
  Value<int> id,
  required String shipmentId,
  required double value,
  Value<DateTime> recordedAt,
});
typedef $$TemperatureLogsTableUpdateCompanionBuilder = TemperatureLogsCompanion
    Function({
  Value<int> id,
  Value<String> shipmentId,
  Value<double> value,
  Value<DateTime> recordedAt,
});

class $$TemperatureLogsTableFilterComposer
    extends Composer<_$AppDatabase, $TemperatureLogsTable> {
  $$TemperatureLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shipmentId => $composableBuilder(
      column: $table.shipmentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => ColumnFilters(column));
}

class $$TemperatureLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $TemperatureLogsTable> {
  $$TemperatureLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shipmentId => $composableBuilder(
      column: $table.shipmentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => ColumnOrderings(column));
}

class $$TemperatureLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TemperatureLogsTable> {
  $$TemperatureLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get shipmentId => $composableBuilder(
      column: $table.shipmentId, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
      column: $table.recordedAt, builder: (column) => column);
}

class $$TemperatureLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TemperatureLogsTable,
    TemperatureLog,
    $$TemperatureLogsTableFilterComposer,
    $$TemperatureLogsTableOrderingComposer,
    $$TemperatureLogsTableAnnotationComposer,
    $$TemperatureLogsTableCreateCompanionBuilder,
    $$TemperatureLogsTableUpdateCompanionBuilder,
    (
      TemperatureLog,
      BaseReferences<_$AppDatabase, $TemperatureLogsTable, TemperatureLog>
    ),
    TemperatureLog,
    PrefetchHooks Function()> {
  $$TemperatureLogsTableTableManager(
      _$AppDatabase db, $TemperatureLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TemperatureLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TemperatureLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TemperatureLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> shipmentId = const Value.absent(),
            Value<double> value = const Value.absent(),
            Value<DateTime> recordedAt = const Value.absent(),
          }) =>
              TemperatureLogsCompanion(
            id: id,
            shipmentId: shipmentId,
            value: value,
            recordedAt: recordedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String shipmentId,
            required double value,
            Value<DateTime> recordedAt = const Value.absent(),
          }) =>
              TemperatureLogsCompanion.insert(
            id: id,
            shipmentId: shipmentId,
            value: value,
            recordedAt: recordedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TemperatureLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TemperatureLogsTable,
    TemperatureLog,
    $$TemperatureLogsTableFilterComposer,
    $$TemperatureLogsTableOrderingComposer,
    $$TemperatureLogsTableAnnotationComposer,
    $$TemperatureLogsTableCreateCompanionBuilder,
    $$TemperatureLogsTableUpdateCompanionBuilder,
    (
      TemperatureLog,
      BaseReferences<_$AppDatabase, $TemperatureLogsTable, TemperatureLog>
    ),
    TemperatureLog,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ShipmentsTableTableManager get shipments =>
      $$ShipmentsTableTableManager(_db, _db.shipments);
  $$EventLogsTableTableManager get eventLogs =>
      $$EventLogsTableTableManager(_db, _db.eventLogs);
  $$TemperatureLogsTableTableManager get temperatureLogs =>
      $$TemperatureLogsTableTableManager(_db, _db.temperatureLogs);
}
