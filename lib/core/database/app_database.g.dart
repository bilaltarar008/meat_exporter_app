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
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('created'));
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
  static const VerificationMeta _currentStageMeta =
      const VerificationMeta('currentStage');
  @override
  late final GeneratedColumn<String> currentStage = GeneratedColumn<String>(
      'current_stage', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('owner'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, status, slaughterDone, warehouseDone, currentStage];
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
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
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
    if (data.containsKey('current_stage')) {
      context.handle(
          _currentStageMeta,
          currentStage.isAcceptableOrUnknown(
              data['current_stage']!, _currentStageMeta));
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
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      slaughterDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}slaughter_done'])!,
      warehouseDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}warehouse_done'])!,
      currentStage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}current_stage'])!,
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
  final String status;
  final bool slaughterDone;
  final bool warehouseDone;
  final String currentStage;
  const Shipment(
      {required this.id,
      required this.title,
      required this.status,
      required this.slaughterDone,
      required this.warehouseDone,
      required this.currentStage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['status'] = Variable<String>(status);
    map['slaughter_done'] = Variable<bool>(slaughterDone);
    map['warehouse_done'] = Variable<bool>(warehouseDone);
    map['current_stage'] = Variable<String>(currentStage);
    return map;
  }

  ShipmentsCompanion toCompanion(bool nullToAbsent) {
    return ShipmentsCompanion(
      id: Value(id),
      title: Value(title),
      status: Value(status),
      slaughterDone: Value(slaughterDone),
      warehouseDone: Value(warehouseDone),
      currentStage: Value(currentStage),
    );
  }

  factory Shipment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Shipment(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      status: serializer.fromJson<String>(json['status']),
      slaughterDone: serializer.fromJson<bool>(json['slaughterDone']),
      warehouseDone: serializer.fromJson<bool>(json['warehouseDone']),
      currentStage: serializer.fromJson<String>(json['currentStage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'status': serializer.toJson<String>(status),
      'slaughterDone': serializer.toJson<bool>(slaughterDone),
      'warehouseDone': serializer.toJson<bool>(warehouseDone),
      'currentStage': serializer.toJson<String>(currentStage),
    };
  }

  Shipment copyWith(
          {int? id,
          String? title,
          String? status,
          bool? slaughterDone,
          bool? warehouseDone,
          String? currentStage}) =>
      Shipment(
        id: id ?? this.id,
        title: title ?? this.title,
        status: status ?? this.status,
        slaughterDone: slaughterDone ?? this.slaughterDone,
        warehouseDone: warehouseDone ?? this.warehouseDone,
        currentStage: currentStage ?? this.currentStage,
      );
  Shipment copyWithCompanion(ShipmentsCompanion data) {
    return Shipment(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      status: data.status.present ? data.status.value : this.status,
      slaughterDone: data.slaughterDone.present
          ? data.slaughterDone.value
          : this.slaughterDone,
      warehouseDone: data.warehouseDone.present
          ? data.warehouseDone.value
          : this.warehouseDone,
      currentStage: data.currentStage.present
          ? data.currentStage.value
          : this.currentStage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Shipment(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('slaughterDone: $slaughterDone, ')
          ..write('warehouseDone: $warehouseDone, ')
          ..write('currentStage: $currentStage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, status, slaughterDone, warehouseDone, currentStage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shipment &&
          other.id == this.id &&
          other.title == this.title &&
          other.status == this.status &&
          other.slaughterDone == this.slaughterDone &&
          other.warehouseDone == this.warehouseDone &&
          other.currentStage == this.currentStage);
}

class ShipmentsCompanion extends UpdateCompanion<Shipment> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> status;
  final Value<bool> slaughterDone;
  final Value<bool> warehouseDone;
  final Value<String> currentStage;
  const ShipmentsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
    this.slaughterDone = const Value.absent(),
    this.warehouseDone = const Value.absent(),
    this.currentStage = const Value.absent(),
  });
  ShipmentsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.status = const Value.absent(),
    this.slaughterDone = const Value.absent(),
    this.warehouseDone = const Value.absent(),
    this.currentStage = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Shipment> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? status,
    Expression<bool>? slaughterDone,
    Expression<bool>? warehouseDone,
    Expression<String>? currentStage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (status != null) 'status': status,
      if (slaughterDone != null) 'slaughter_done': slaughterDone,
      if (warehouseDone != null) 'warehouse_done': warehouseDone,
      if (currentStage != null) 'current_stage': currentStage,
    });
  }

  ShipmentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? status,
      Value<bool>? slaughterDone,
      Value<bool>? warehouseDone,
      Value<String>? currentStage}) {
    return ShipmentsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
      slaughterDone: slaughterDone ?? this.slaughterDone,
      warehouseDone: warehouseDone ?? this.warehouseDone,
      currentStage: currentStage ?? this.currentStage,
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
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (slaughterDone.present) {
      map['slaughter_done'] = Variable<bool>(slaughterDone.value);
    }
    if (warehouseDone.present) {
      map['warehouse_done'] = Variable<bool>(warehouseDone.value);
    }
    if (currentStage.present) {
      map['current_stage'] = Variable<String>(currentStage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShipmentsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('slaughterDone: $slaughterDone, ')
          ..write('warehouseDone: $warehouseDone, ')
          ..write('currentStage: $currentStage')
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
  Value<String> status,
  Value<bool> slaughterDone,
  Value<bool> warehouseDone,
  Value<String> currentStage,
});
typedef $$ShipmentsTableUpdateCompanionBuilder = ShipmentsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> status,
  Value<bool> slaughterDone,
  Value<bool> warehouseDone,
  Value<String> currentStage,
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

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get slaughterDone => $composableBuilder(
      column: $table.slaughterDone, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get warehouseDone => $composableBuilder(
      column: $table.warehouseDone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currentStage => $composableBuilder(
      column: $table.currentStage, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get slaughterDone => $composableBuilder(
      column: $table.slaughterDone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get warehouseDone => $composableBuilder(
      column: $table.warehouseDone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currentStage => $composableBuilder(
      column: $table.currentStage,
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

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<bool> get slaughterDone => $composableBuilder(
      column: $table.slaughterDone, builder: (column) => column);

  GeneratedColumn<bool> get warehouseDone => $composableBuilder(
      column: $table.warehouseDone, builder: (column) => column);

  GeneratedColumn<String> get currentStage => $composableBuilder(
      column: $table.currentStage, builder: (column) => column);
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
            Value<String> status = const Value.absent(),
            Value<bool> slaughterDone = const Value.absent(),
            Value<bool> warehouseDone = const Value.absent(),
            Value<String> currentStage = const Value.absent(),
          }) =>
              ShipmentsCompanion(
            id: id,
            title: title,
            status: status,
            slaughterDone: slaughterDone,
            warehouseDone: warehouseDone,
            currentStage: currentStage,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String> status = const Value.absent(),
            Value<bool> slaughterDone = const Value.absent(),
            Value<bool> warehouseDone = const Value.absent(),
            Value<String> currentStage = const Value.absent(),
          }) =>
              ShipmentsCompanion.insert(
            id: id,
            title: title,
            status: status,
            slaughterDone: slaughterDone,
            warehouseDone: warehouseDone,
            currentStage: currentStage,
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
