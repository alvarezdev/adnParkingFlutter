// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_entry_database.dart';

// ignore_for_file: type=lint
class $TicketEntryCarEntityTable extends TicketEntryCarEntity
    with TableInfo<$TicketEntryCarEntityTable, TicketEntryCarEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TicketEntryCarEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entryTimeMeta =
      const VerificationMeta('entryTime');
  @override
  late final GeneratedColumn<DateTime> entryTime = GeneratedColumn<DateTime>(
      'entry_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, entryTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ticket_entry_car_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<TicketEntryCarEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entry_time')) {
      context.handle(_entryTimeMeta,
          entryTime.isAcceptableOrUnknown(data['entry_time']!, _entryTimeMeta));
    } else if (isInserting) {
      context.missing(_entryTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TicketEntryCarEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TicketEntryCarEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      entryTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}entry_time'])!,
    );
  }

  @override
  $TicketEntryCarEntityTable createAlias(String alias) {
    return $TicketEntryCarEntityTable(attachedDatabase, alias);
  }
}

class TicketEntryCarEntityData extends DataClass
    implements Insertable<TicketEntryCarEntityData> {
  final String id;
  final DateTime entryTime;
  const TicketEntryCarEntityData({required this.id, required this.entryTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['entry_time'] = Variable<DateTime>(entryTime);
    return map;
  }

  TicketEntryCarEntityCompanion toCompanion(bool nullToAbsent) {
    return TicketEntryCarEntityCompanion(
      id: Value(id),
      entryTime: Value(entryTime),
    );
  }

  factory TicketEntryCarEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TicketEntryCarEntityData(
      id: serializer.fromJson<String>(json['id']),
      entryTime: serializer.fromJson<DateTime>(json['entryTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'entryTime': serializer.toJson<DateTime>(entryTime),
    };
  }

  TicketEntryCarEntityData copyWith({String? id, DateTime? entryTime}) =>
      TicketEntryCarEntityData(
        id: id ?? this.id,
        entryTime: entryTime ?? this.entryTime,
      );
  TicketEntryCarEntityData copyWithCompanion(
      TicketEntryCarEntityCompanion data) {
    return TicketEntryCarEntityData(
      id: data.id.present ? data.id.value : this.id,
      entryTime: data.entryTime.present ? data.entryTime.value : this.entryTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TicketEntryCarEntityData(')
          ..write('id: $id, ')
          ..write('entryTime: $entryTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, entryTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TicketEntryCarEntityData &&
          other.id == this.id &&
          other.entryTime == this.entryTime);
}

class TicketEntryCarEntityCompanion
    extends UpdateCompanion<TicketEntryCarEntityData> {
  final Value<String> id;
  final Value<DateTime> entryTime;
  final Value<int> rowid;
  const TicketEntryCarEntityCompanion({
    this.id = const Value.absent(),
    this.entryTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TicketEntryCarEntityCompanion.insert({
    required String id,
    required DateTime entryTime,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        entryTime = Value(entryTime);
  static Insertable<TicketEntryCarEntityData> custom({
    Expression<String>? id,
    Expression<DateTime>? entryTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entryTime != null) 'entry_time': entryTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TicketEntryCarEntityCompanion copyWith(
      {Value<String>? id, Value<DateTime>? entryTime, Value<int>? rowid}) {
    return TicketEntryCarEntityCompanion(
      id: id ?? this.id,
      entryTime: entryTime ?? this.entryTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (entryTime.present) {
      map['entry_time'] = Variable<DateTime>(entryTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TicketEntryCarEntityCompanion(')
          ..write('id: $id, ')
          ..write('entryTime: $entryTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TicketEntryMotorcycleEntityTable extends TicketEntryMotorcycleEntity
    with
        TableInfo<$TicketEntryMotorcycleEntityTable,
            TicketEntryMotorcycleEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TicketEntryMotorcycleEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entryTimeMeta =
      const VerificationMeta('entryTime');
  @override
  late final GeneratedColumn<DateTime> entryTime = GeneratedColumn<DateTime>(
      'entry_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cylinderCapacityMeta =
      const VerificationMeta('cylinderCapacity');
  @override
  late final GeneratedColumn<double> cylinderCapacity = GeneratedColumn<double>(
      'cylinder_capacity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, entryTime, cylinderCapacity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ticket_entry_motorcycle_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<TicketEntryMotorcycleEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entry_time')) {
      context.handle(_entryTimeMeta,
          entryTime.isAcceptableOrUnknown(data['entry_time']!, _entryTimeMeta));
    } else if (isInserting) {
      context.missing(_entryTimeMeta);
    }
    if (data.containsKey('cylinder_capacity')) {
      context.handle(
          _cylinderCapacityMeta,
          cylinderCapacity.isAcceptableOrUnknown(
              data['cylinder_capacity']!, _cylinderCapacityMeta));
    } else if (isInserting) {
      context.missing(_cylinderCapacityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TicketEntryMotorcycleEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TicketEntryMotorcycleEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      entryTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}entry_time'])!,
      cylinderCapacity: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}cylinder_capacity'])!,
    );
  }

  @override
  $TicketEntryMotorcycleEntityTable createAlias(String alias) {
    return $TicketEntryMotorcycleEntityTable(attachedDatabase, alias);
  }
}

class TicketEntryMotorcycleEntityData extends DataClass
    implements Insertable<TicketEntryMotorcycleEntityData> {
  final String id;
  final DateTime entryTime;
  final double cylinderCapacity;
  const TicketEntryMotorcycleEntityData(
      {required this.id,
      required this.entryTime,
      required this.cylinderCapacity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['entry_time'] = Variable<DateTime>(entryTime);
    map['cylinder_capacity'] = Variable<double>(cylinderCapacity);
    return map;
  }

  TicketEntryMotorcycleEntityCompanion toCompanion(bool nullToAbsent) {
    return TicketEntryMotorcycleEntityCompanion(
      id: Value(id),
      entryTime: Value(entryTime),
      cylinderCapacity: Value(cylinderCapacity),
    );
  }

  factory TicketEntryMotorcycleEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TicketEntryMotorcycleEntityData(
      id: serializer.fromJson<String>(json['id']),
      entryTime: serializer.fromJson<DateTime>(json['entryTime']),
      cylinderCapacity: serializer.fromJson<double>(json['cylinderCapacity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'entryTime': serializer.toJson<DateTime>(entryTime),
      'cylinderCapacity': serializer.toJson<double>(cylinderCapacity),
    };
  }

  TicketEntryMotorcycleEntityData copyWith(
          {String? id, DateTime? entryTime, double? cylinderCapacity}) =>
      TicketEntryMotorcycleEntityData(
        id: id ?? this.id,
        entryTime: entryTime ?? this.entryTime,
        cylinderCapacity: cylinderCapacity ?? this.cylinderCapacity,
      );
  TicketEntryMotorcycleEntityData copyWithCompanion(
      TicketEntryMotorcycleEntityCompanion data) {
    return TicketEntryMotorcycleEntityData(
      id: data.id.present ? data.id.value : this.id,
      entryTime: data.entryTime.present ? data.entryTime.value : this.entryTime,
      cylinderCapacity: data.cylinderCapacity.present
          ? data.cylinderCapacity.value
          : this.cylinderCapacity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TicketEntryMotorcycleEntityData(')
          ..write('id: $id, ')
          ..write('entryTime: $entryTime, ')
          ..write('cylinderCapacity: $cylinderCapacity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, entryTime, cylinderCapacity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TicketEntryMotorcycleEntityData &&
          other.id == this.id &&
          other.entryTime == this.entryTime &&
          other.cylinderCapacity == this.cylinderCapacity);
}

class TicketEntryMotorcycleEntityCompanion
    extends UpdateCompanion<TicketEntryMotorcycleEntityData> {
  final Value<String> id;
  final Value<DateTime> entryTime;
  final Value<double> cylinderCapacity;
  final Value<int> rowid;
  const TicketEntryMotorcycleEntityCompanion({
    this.id = const Value.absent(),
    this.entryTime = const Value.absent(),
    this.cylinderCapacity = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TicketEntryMotorcycleEntityCompanion.insert({
    required String id,
    required DateTime entryTime,
    required double cylinderCapacity,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        entryTime = Value(entryTime),
        cylinderCapacity = Value(cylinderCapacity);
  static Insertable<TicketEntryMotorcycleEntityData> custom({
    Expression<String>? id,
    Expression<DateTime>? entryTime,
    Expression<double>? cylinderCapacity,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entryTime != null) 'entry_time': entryTime,
      if (cylinderCapacity != null) 'cylinder_capacity': cylinderCapacity,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TicketEntryMotorcycleEntityCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? entryTime,
      Value<double>? cylinderCapacity,
      Value<int>? rowid}) {
    return TicketEntryMotorcycleEntityCompanion(
      id: id ?? this.id,
      entryTime: entryTime ?? this.entryTime,
      cylinderCapacity: cylinderCapacity ?? this.cylinderCapacity,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (entryTime.present) {
      map['entry_time'] = Variable<DateTime>(entryTime.value);
    }
    if (cylinderCapacity.present) {
      map['cylinder_capacity'] = Variable<double>(cylinderCapacity.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TicketEntryMotorcycleEntityCompanion(')
          ..write('id: $id, ')
          ..write('entryTime: $entryTime, ')
          ..write('cylinderCapacity: $cylinderCapacity, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$TicketEntryDatabase extends GeneratedDatabase {
  _$TicketEntryDatabase(QueryExecutor e) : super(e);
  $TicketEntryDatabaseManager get managers => $TicketEntryDatabaseManager(this);
  late final $TicketEntryCarEntityTable ticketEntryCarEntity =
      $TicketEntryCarEntityTable(this);
  late final $TicketEntryMotorcycleEntityTable ticketEntryMotorcycleEntity =
      $TicketEntryMotorcycleEntityTable(this);
  late final TicketEntryCarDao ticketEntryCarDao =
      TicketEntryCarDao(this as TicketEntryDatabase);
  late final TicketEntryMotorcycleDao ticketEntryMotorcycleDao =
      TicketEntryMotorcycleDao(this as TicketEntryDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [ticketEntryCarEntity, ticketEntryMotorcycleEntity];
}

typedef $$TicketEntryCarEntityTableCreateCompanionBuilder
    = TicketEntryCarEntityCompanion Function({
  required String id,
  required DateTime entryTime,
  Value<int> rowid,
});
typedef $$TicketEntryCarEntityTableUpdateCompanionBuilder
    = TicketEntryCarEntityCompanion Function({
  Value<String> id,
  Value<DateTime> entryTime,
  Value<int> rowid,
});

class $$TicketEntryCarEntityTableFilterComposer
    extends Composer<_$TicketEntryDatabase, $TicketEntryCarEntityTable> {
  $$TicketEntryCarEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get entryTime => $composableBuilder(
      column: $table.entryTime, builder: (column) => ColumnFilters(column));
}

class $$TicketEntryCarEntityTableOrderingComposer
    extends Composer<_$TicketEntryDatabase, $TicketEntryCarEntityTable> {
  $$TicketEntryCarEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get entryTime => $composableBuilder(
      column: $table.entryTime, builder: (column) => ColumnOrderings(column));
}

class $$TicketEntryCarEntityTableAnnotationComposer
    extends Composer<_$TicketEntryDatabase, $TicketEntryCarEntityTable> {
  $$TicketEntryCarEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get entryTime =>
      $composableBuilder(column: $table.entryTime, builder: (column) => column);
}

class $$TicketEntryCarEntityTableTableManager extends RootTableManager<
    _$TicketEntryDatabase,
    $TicketEntryCarEntityTable,
    TicketEntryCarEntityData,
    $$TicketEntryCarEntityTableFilterComposer,
    $$TicketEntryCarEntityTableOrderingComposer,
    $$TicketEntryCarEntityTableAnnotationComposer,
    $$TicketEntryCarEntityTableCreateCompanionBuilder,
    $$TicketEntryCarEntityTableUpdateCompanionBuilder,
    (
      TicketEntryCarEntityData,
      BaseReferences<_$TicketEntryDatabase, $TicketEntryCarEntityTable,
          TicketEntryCarEntityData>
    ),
    TicketEntryCarEntityData,
    PrefetchHooks Function()> {
  $$TicketEntryCarEntityTableTableManager(
      _$TicketEntryDatabase db, $TicketEntryCarEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TicketEntryCarEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TicketEntryCarEntityTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TicketEntryCarEntityTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> entryTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TicketEntryCarEntityCompanion(
            id: id,
            entryTime: entryTime,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime entryTime,
            Value<int> rowid = const Value.absent(),
          }) =>
              TicketEntryCarEntityCompanion.insert(
            id: id,
            entryTime: entryTime,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TicketEntryCarEntityTableProcessedTableManager
    = ProcessedTableManager<
        _$TicketEntryDatabase,
        $TicketEntryCarEntityTable,
        TicketEntryCarEntityData,
        $$TicketEntryCarEntityTableFilterComposer,
        $$TicketEntryCarEntityTableOrderingComposer,
        $$TicketEntryCarEntityTableAnnotationComposer,
        $$TicketEntryCarEntityTableCreateCompanionBuilder,
        $$TicketEntryCarEntityTableUpdateCompanionBuilder,
        (
          TicketEntryCarEntityData,
          BaseReferences<_$TicketEntryDatabase, $TicketEntryCarEntityTable,
              TicketEntryCarEntityData>
        ),
        TicketEntryCarEntityData,
        PrefetchHooks Function()>;
typedef $$TicketEntryMotorcycleEntityTableCreateCompanionBuilder
    = TicketEntryMotorcycleEntityCompanion Function({
  required String id,
  required DateTime entryTime,
  required double cylinderCapacity,
  Value<int> rowid,
});
typedef $$TicketEntryMotorcycleEntityTableUpdateCompanionBuilder
    = TicketEntryMotorcycleEntityCompanion Function({
  Value<String> id,
  Value<DateTime> entryTime,
  Value<double> cylinderCapacity,
  Value<int> rowid,
});

class $$TicketEntryMotorcycleEntityTableFilterComposer
    extends Composer<_$TicketEntryDatabase, $TicketEntryMotorcycleEntityTable> {
  $$TicketEntryMotorcycleEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get entryTime => $composableBuilder(
      column: $table.entryTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cylinderCapacity => $composableBuilder(
      column: $table.cylinderCapacity,
      builder: (column) => ColumnFilters(column));
}

class $$TicketEntryMotorcycleEntityTableOrderingComposer
    extends Composer<_$TicketEntryDatabase, $TicketEntryMotorcycleEntityTable> {
  $$TicketEntryMotorcycleEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get entryTime => $composableBuilder(
      column: $table.entryTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cylinderCapacity => $composableBuilder(
      column: $table.cylinderCapacity,
      builder: (column) => ColumnOrderings(column));
}

class $$TicketEntryMotorcycleEntityTableAnnotationComposer
    extends Composer<_$TicketEntryDatabase, $TicketEntryMotorcycleEntityTable> {
  $$TicketEntryMotorcycleEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get entryTime =>
      $composableBuilder(column: $table.entryTime, builder: (column) => column);

  GeneratedColumn<double> get cylinderCapacity => $composableBuilder(
      column: $table.cylinderCapacity, builder: (column) => column);
}

class $$TicketEntryMotorcycleEntityTableTableManager extends RootTableManager<
    _$TicketEntryDatabase,
    $TicketEntryMotorcycleEntityTable,
    TicketEntryMotorcycleEntityData,
    $$TicketEntryMotorcycleEntityTableFilterComposer,
    $$TicketEntryMotorcycleEntityTableOrderingComposer,
    $$TicketEntryMotorcycleEntityTableAnnotationComposer,
    $$TicketEntryMotorcycleEntityTableCreateCompanionBuilder,
    $$TicketEntryMotorcycleEntityTableUpdateCompanionBuilder,
    (
      TicketEntryMotorcycleEntityData,
      BaseReferences<_$TicketEntryDatabase, $TicketEntryMotorcycleEntityTable,
          TicketEntryMotorcycleEntityData>
    ),
    TicketEntryMotorcycleEntityData,
    PrefetchHooks Function()> {
  $$TicketEntryMotorcycleEntityTableTableManager(
      _$TicketEntryDatabase db, $TicketEntryMotorcycleEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TicketEntryMotorcycleEntityTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$TicketEntryMotorcycleEntityTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TicketEntryMotorcycleEntityTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> entryTime = const Value.absent(),
            Value<double> cylinderCapacity = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TicketEntryMotorcycleEntityCompanion(
            id: id,
            entryTime: entryTime,
            cylinderCapacity: cylinderCapacity,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime entryTime,
            required double cylinderCapacity,
            Value<int> rowid = const Value.absent(),
          }) =>
              TicketEntryMotorcycleEntityCompanion.insert(
            id: id,
            entryTime: entryTime,
            cylinderCapacity: cylinderCapacity,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TicketEntryMotorcycleEntityTableProcessedTableManager
    = ProcessedTableManager<
        _$TicketEntryDatabase,
        $TicketEntryMotorcycleEntityTable,
        TicketEntryMotorcycleEntityData,
        $$TicketEntryMotorcycleEntityTableFilterComposer,
        $$TicketEntryMotorcycleEntityTableOrderingComposer,
        $$TicketEntryMotorcycleEntityTableAnnotationComposer,
        $$TicketEntryMotorcycleEntityTableCreateCompanionBuilder,
        $$TicketEntryMotorcycleEntityTableUpdateCompanionBuilder,
        (
          TicketEntryMotorcycleEntityData,
          BaseReferences<
              _$TicketEntryDatabase,
              $TicketEntryMotorcycleEntityTable,
              TicketEntryMotorcycleEntityData>
        ),
        TicketEntryMotorcycleEntityData,
        PrefetchHooks Function()>;

class $TicketEntryDatabaseManager {
  final _$TicketEntryDatabase _db;
  $TicketEntryDatabaseManager(this._db);
  $$TicketEntryCarEntityTableTableManager get ticketEntryCarEntity =>
      $$TicketEntryCarEntityTableTableManager(_db, _db.ticketEntryCarEntity);
  $$TicketEntryMotorcycleEntityTableTableManager
      get ticketEntryMotorcycleEntity =>
          $$TicketEntryMotorcycleEntityTableTableManager(
              _db, _db.ticketEntryMotorcycleEntity);
}
