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
  @override
  List<GeneratedColumn> get $columns =>
      [id, origin, destination, temperature, status];
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
  const Shipment(
      {required this.id,
      required this.origin,
      required this.destination,
      required this.temperature,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['origin'] = Variable<String>(origin);
    map['destination'] = Variable<String>(destination);
    map['temperature'] = Variable<double>(temperature);
    map['status'] = Variable<String>(status);
    return map;
  }

  ShipmentsCompanion toCompanion(bool nullToAbsent) {
    return ShipmentsCompanion(
      id: Value(id),
      origin: Value(origin),
      destination: Value(destination),
      temperature: Value(temperature),
      status: Value(status),
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
    };
  }

  Shipment copyWith(
          {String? id,
          String? origin,
          String? destination,
          double? temperature,
          String? status}) =>
      Shipment(
        id: id ?? this.id,
        origin: origin ?? this.origin,
        destination: destination ?? this.destination,
        temperature: temperature ?? this.temperature,
        status: status ?? this.status,
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
    );
  }

  @override
  String toString() {
    return (StringBuffer('Shipment(')
          ..write('id: $id, ')
          ..write('origin: $origin, ')
          ..write('destination: $destination, ')
          ..write('temperature: $temperature, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, origin, destination, temperature, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shipment &&
          other.id == this.id &&
          other.origin == this.origin &&
          other.destination == this.destination &&
          other.temperature == this.temperature &&
          other.status == this.status);
}

class ShipmentsCompanion extends UpdateCompanion<Shipment> {
  final Value<String> id;
  final Value<String> origin;
  final Value<String> destination;
  final Value<double> temperature;
  final Value<String> status;
  final Value<int> rowid;
  const ShipmentsCompanion({
    this.id = const Value.absent(),
    this.origin = const Value.absent(),
    this.destination = const Value.absent(),
    this.temperature = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShipmentsCompanion.insert({
    required String id,
    required String origin,
    required String destination,
    required double temperature,
    required String status,
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
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (origin != null) 'origin': origin,
      if (destination != null) 'destination': destination,
      if (temperature != null) 'temperature': temperature,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShipmentsCompanion copyWith(
      {Value<String>? id,
      Value<String>? origin,
      Value<String>? destination,
      Value<double>? temperature,
      Value<String>? status,
      Value<int>? rowid}) {
    return ShipmentsCompanion(
      id: id ?? this.id,
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      temperature: temperature ?? this.temperature,
      status: status ?? this.status,
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
          ..write('rowid: $rowid')
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
  required String id,
  required String origin,
  required String destination,
  required double temperature,
  required String status,
  Value<int> rowid,
});
typedef $$ShipmentsTableUpdateCompanionBuilder = ShipmentsCompanion Function({
  Value<String> id,
  Value<String> origin,
  Value<String> destination,
  Value<double> temperature,
  Value<String> status,
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
            Value<int> rowid = const Value.absent(),
          }) =>
              ShipmentsCompanion(
            id: id,
            origin: origin,
            destination: destination,
            temperature: temperature,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String origin,
            required String destination,
            required double temperature,
            required String status,
            Value<int> rowid = const Value.absent(),
          }) =>
              ShipmentsCompanion.insert(
            id: id,
            origin: origin,
            destination: destination,
            temperature: temperature,
            status: status,
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ShipmentsTableTableManager get shipments =>
      $$ShipmentsTableTableManager(_db, _db.shipments);
}
