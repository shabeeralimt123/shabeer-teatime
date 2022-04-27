// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class StockData extends DataClass implements Insertable<StockData> {
  final int id;
  final int product;
  final String name;
  final String ctnqty;
  final String ctnrate;
  final String ctntotal;
  final String pcsqty;
  final String pcsrate;
  final String pcstotal;
  final String grandtotal;
  final int supplier;
  final int unit;
  final String unitname;
  StockData(
      {@required this.id,
      @required this.product,
      @required this.name,
      @required this.ctnqty,
      @required this.ctnrate,
      @required this.ctntotal,
      @required this.pcsqty,
      @required this.pcsrate,
      @required this.pcstotal,
      @required this.grandtotal,
      @required this.supplier,
      @required this.unit,
      @required this.unitname});
  factory StockData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return StockData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      product:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}product']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      ctnqty:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}ctnqty']),
      ctnrate:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}ctnrate']),
      ctntotal: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}ctntotal']),
      pcsqty:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}pcsqty']),
      pcsrate:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}pcsrate']),
      pcstotal: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pcstotal']),
      grandtotal: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}grandtotal']),
      supplier:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}supplier']),
      unit: intType.mapFromDatabaseResponse(data['${effectivePrefix}unit']),
      unitname: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}unitname']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || product != null) {
      map['product'] = Variable<int>(product);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || ctnqty != null) {
      map['ctnqty'] = Variable<String>(ctnqty);
    }
    if (!nullToAbsent || ctnrate != null) {
      map['ctnrate'] = Variable<String>(ctnrate);
    }
    if (!nullToAbsent || ctntotal != null) {
      map['ctntotal'] = Variable<String>(ctntotal);
    }
    if (!nullToAbsent || pcsqty != null) {
      map['pcsqty'] = Variable<String>(pcsqty);
    }
    if (!nullToAbsent || pcsrate != null) {
      map['pcsrate'] = Variable<String>(pcsrate);
    }
    if (!nullToAbsent || pcstotal != null) {
      map['pcstotal'] = Variable<String>(pcstotal);
    }
    if (!nullToAbsent || grandtotal != null) {
      map['grandtotal'] = Variable<String>(grandtotal);
    }
    if (!nullToAbsent || supplier != null) {
      map['supplier'] = Variable<int>(supplier);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<int>(unit);
    }
    if (!nullToAbsent || unitname != null) {
      map['unitname'] = Variable<String>(unitname);
    }
    return map;
  }

  StockCompanion toCompanion(bool nullToAbsent) {
    return StockCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      product: product == null && nullToAbsent
          ? const Value.absent()
          : Value(product),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      ctnqty:
          ctnqty == null && nullToAbsent ? const Value.absent() : Value(ctnqty),
      ctnrate: ctnrate == null && nullToAbsent
          ? const Value.absent()
          : Value(ctnrate),
      ctntotal: ctntotal == null && nullToAbsent
          ? const Value.absent()
          : Value(ctntotal),
      pcsqty:
          pcsqty == null && nullToAbsent ? const Value.absent() : Value(pcsqty),
      pcsrate: pcsrate == null && nullToAbsent
          ? const Value.absent()
          : Value(pcsrate),
      pcstotal: pcstotal == null && nullToAbsent
          ? const Value.absent()
          : Value(pcstotal),
      grandtotal: grandtotal == null && nullToAbsent
          ? const Value.absent()
          : Value(grandtotal),
      supplier: supplier == null && nullToAbsent
          ? const Value.absent()
          : Value(supplier),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      unitname: unitname == null && nullToAbsent
          ? const Value.absent()
          : Value(unitname),
    );
  }

  factory StockData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return StockData(
      id: serializer.fromJson<int>(json['id']),
      product: serializer.fromJson<int>(json['product']),
      name: serializer.fromJson<String>(json['name']),
      ctnqty: serializer.fromJson<String>(json['ctnqty']),
      ctnrate: serializer.fromJson<String>(json['ctnrate']),
      ctntotal: serializer.fromJson<String>(json['ctntotal']),
      pcsqty: serializer.fromJson<String>(json['pcsqty']),
      pcsrate: serializer.fromJson<String>(json['pcsrate']),
      pcstotal: serializer.fromJson<String>(json['pcstotal']),
      grandtotal: serializer.fromJson<String>(json['grandtotal']),
      supplier: serializer.fromJson<int>(json['supplier']),
      unit: serializer.fromJson<int>(json['unit']),
      unitname: serializer.fromJson<String>(json['unitname']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'product': serializer.toJson<int>(product),
      'name': serializer.toJson<String>(name),
      'ctnqty': serializer.toJson<String>(ctnqty),
      'ctnrate': serializer.toJson<String>(ctnrate),
      'ctntotal': serializer.toJson<String>(ctntotal),
      'pcsqty': serializer.toJson<String>(pcsqty),
      'pcsrate': serializer.toJson<String>(pcsrate),
      'pcstotal': serializer.toJson<String>(pcstotal),
      'grandtotal': serializer.toJson<String>(grandtotal),
      'supplier': serializer.toJson<int>(supplier),
      'unit': serializer.toJson<int>(unit),
      'unitname': serializer.toJson<String>(unitname),
    };
  }

  StockData copyWith(
          {int id,
          int product,
          String name,
          String ctnqty,
          String ctnrate,
          String ctntotal,
          String pcsqty,
          String pcsrate,
          String pcstotal,
          String grandtotal,
          int supplier,
          int unit,
          String unitname}) =>
      StockData(
        id: id ?? this.id,
        product: product ?? this.product,
        name: name ?? this.name,
        ctnqty: ctnqty ?? this.ctnqty,
        ctnrate: ctnrate ?? this.ctnrate,
        ctntotal: ctntotal ?? this.ctntotal,
        pcsqty: pcsqty ?? this.pcsqty,
        pcsrate: pcsrate ?? this.pcsrate,
        pcstotal: pcstotal ?? this.pcstotal,
        grandtotal: grandtotal ?? this.grandtotal,
        supplier: supplier ?? this.supplier,
        unit: unit ?? this.unit,
        unitname: unitname ?? this.unitname,
      );
  @override
  String toString() {
    return (StringBuffer('StockData(')
          ..write('id: $id, ')
          ..write('product: $product, ')
          ..write('name: $name, ')
          ..write('ctnqty: $ctnqty, ')
          ..write('ctnrate: $ctnrate, ')
          ..write('ctntotal: $ctntotal, ')
          ..write('pcsqty: $pcsqty, ')
          ..write('pcsrate: $pcsrate, ')
          ..write('pcstotal: $pcstotal, ')
          ..write('grandtotal: $grandtotal, ')
          ..write('supplier: $supplier, ')
          ..write('unit: $unit, ')
          ..write('unitname: $unitname')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          product.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(
                  ctnqty.hashCode,
                  $mrjc(
                      ctnrate.hashCode,
                      $mrjc(
                          ctntotal.hashCode,
                          $mrjc(
                              pcsqty.hashCode,
                              $mrjc(
                                  pcsrate.hashCode,
                                  $mrjc(
                                      pcstotal.hashCode,
                                      $mrjc(
                                          grandtotal.hashCode,
                                          $mrjc(
                                              supplier.hashCode,
                                              $mrjc(
                                                  unit.hashCode,
                                                  unitname
                                                      .hashCode)))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is StockData &&
          other.id == this.id &&
          other.product == this.product &&
          other.name == this.name &&
          other.ctnqty == this.ctnqty &&
          other.ctnrate == this.ctnrate &&
          other.ctntotal == this.ctntotal &&
          other.pcsqty == this.pcsqty &&
          other.pcsrate == this.pcsrate &&
          other.pcstotal == this.pcstotal &&
          other.grandtotal == this.grandtotal &&
          other.supplier == this.supplier &&
          other.unit == this.unit &&
          other.unitname == this.unitname);
}

class StockCompanion extends UpdateCompanion<StockData> {
  final Value<int> id;
  final Value<int> product;
  final Value<String> name;
  final Value<String> ctnqty;
  final Value<String> ctnrate;
  final Value<String> ctntotal;
  final Value<String> pcsqty;
  final Value<String> pcsrate;
  final Value<String> pcstotal;
  final Value<String> grandtotal;
  final Value<int> supplier;
  final Value<int> unit;
  final Value<String> unitname;
  const StockCompanion({
    this.id = const Value.absent(),
    this.product = const Value.absent(),
    this.name = const Value.absent(),
    this.ctnqty = const Value.absent(),
    this.ctnrate = const Value.absent(),
    this.ctntotal = const Value.absent(),
    this.pcsqty = const Value.absent(),
    this.pcsrate = const Value.absent(),
    this.pcstotal = const Value.absent(),
    this.grandtotal = const Value.absent(),
    this.supplier = const Value.absent(),
    this.unit = const Value.absent(),
    this.unitname = const Value.absent(),
  });
  StockCompanion.insert({
    this.id = const Value.absent(),
    @required int product,
    @required String name,
    @required String ctnqty,
    @required String ctnrate,
    @required String ctntotal,
    @required String pcsqty,
    @required String pcsrate,
    @required String pcstotal,
    @required String grandtotal,
    @required int supplier,
    @required int unit,
    @required String unitname,
  })  : product = Value(product),
        name = Value(name),
        ctnqty = Value(ctnqty),
        ctnrate = Value(ctnrate),
        ctntotal = Value(ctntotal),
        pcsqty = Value(pcsqty),
        pcsrate = Value(pcsrate),
        pcstotal = Value(pcstotal),
        grandtotal = Value(grandtotal),
        supplier = Value(supplier),
        unit = Value(unit),
        unitname = Value(unitname);
  static Insertable<StockData> custom({
    Expression<int> id,
    Expression<int> product,
    Expression<String> name,
    Expression<String> ctnqty,
    Expression<String> ctnrate,
    Expression<String> ctntotal,
    Expression<String> pcsqty,
    Expression<String> pcsrate,
    Expression<String> pcstotal,
    Expression<String> grandtotal,
    Expression<int> supplier,
    Expression<int> unit,
    Expression<String> unitname,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (product != null) 'product': product,
      if (name != null) 'name': name,
      if (ctnqty != null) 'ctnqty': ctnqty,
      if (ctnrate != null) 'ctnrate': ctnrate,
      if (ctntotal != null) 'ctntotal': ctntotal,
      if (pcsqty != null) 'pcsqty': pcsqty,
      if (pcsrate != null) 'pcsrate': pcsrate,
      if (pcstotal != null) 'pcstotal': pcstotal,
      if (grandtotal != null) 'grandtotal': grandtotal,
      if (supplier != null) 'supplier': supplier,
      if (unit != null) 'unit': unit,
      if (unitname != null) 'unitname': unitname,
    });
  }

  StockCompanion copyWith(
      {Value<int> id,
      Value<int> product,
      Value<String> name,
      Value<String> ctnqty,
      Value<String> ctnrate,
      Value<String> ctntotal,
      Value<String> pcsqty,
      Value<String> pcsrate,
      Value<String> pcstotal,
      Value<String> grandtotal,
      Value<int> supplier,
      Value<int> unit,
      Value<String> unitname}) {
    return StockCompanion(
      id: id ?? this.id,
      product: product ?? this.product,
      name: name ?? this.name,
      ctnqty: ctnqty ?? this.ctnqty,
      ctnrate: ctnrate ?? this.ctnrate,
      ctntotal: ctntotal ?? this.ctntotal,
      pcsqty: pcsqty ?? this.pcsqty,
      pcsrate: pcsrate ?? this.pcsrate,
      pcstotal: pcstotal ?? this.pcstotal,
      grandtotal: grandtotal ?? this.grandtotal,
      supplier: supplier ?? this.supplier,
      unit: unit ?? this.unit,
      unitname: unitname ?? this.unitname,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (product.present) {
      map['product'] = Variable<int>(product.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (ctnqty.present) {
      map['ctnqty'] = Variable<String>(ctnqty.value);
    }
    if (ctnrate.present) {
      map['ctnrate'] = Variable<String>(ctnrate.value);
    }
    if (ctntotal.present) {
      map['ctntotal'] = Variable<String>(ctntotal.value);
    }
    if (pcsqty.present) {
      map['pcsqty'] = Variable<String>(pcsqty.value);
    }
    if (pcsrate.present) {
      map['pcsrate'] = Variable<String>(pcsrate.value);
    }
    if (pcstotal.present) {
      map['pcstotal'] = Variable<String>(pcstotal.value);
    }
    if (grandtotal.present) {
      map['grandtotal'] = Variable<String>(grandtotal.value);
    }
    if (supplier.present) {
      map['supplier'] = Variable<int>(supplier.value);
    }
    if (unit.present) {
      map['unit'] = Variable<int>(unit.value);
    }
    if (unitname.present) {
      map['unitname'] = Variable<String>(unitname.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockCompanion(')
          ..write('id: $id, ')
          ..write('product: $product, ')
          ..write('name: $name, ')
          ..write('ctnqty: $ctnqty, ')
          ..write('ctnrate: $ctnrate, ')
          ..write('ctntotal: $ctntotal, ')
          ..write('pcsqty: $pcsqty, ')
          ..write('pcsrate: $pcsrate, ')
          ..write('pcstotal: $pcstotal, ')
          ..write('grandtotal: $grandtotal, ')
          ..write('supplier: $supplier, ')
          ..write('unit: $unit, ')
          ..write('unitname: $unitname')
          ..write(')'))
        .toString();
  }
}

class $StockTable extends Stock with TableInfo<$StockTable, StockData> {
  final GeneratedDatabase _db;
  final String _alias;
  $StockTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _productMeta = const VerificationMeta('product');
  GeneratedIntColumn _product;
  @override
  GeneratedIntColumn get product => _product ??= _constructProduct();
  GeneratedIntColumn _constructProduct() {
    return GeneratedIntColumn(
      'product',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ctnqtyMeta = const VerificationMeta('ctnqty');
  GeneratedTextColumn _ctnqty;
  @override
  GeneratedTextColumn get ctnqty => _ctnqty ??= _constructCtnqty();
  GeneratedTextColumn _constructCtnqty() {
    return GeneratedTextColumn(
      'ctnqty',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ctnrateMeta = const VerificationMeta('ctnrate');
  GeneratedTextColumn _ctnrate;
  @override
  GeneratedTextColumn get ctnrate => _ctnrate ??= _constructCtnrate();
  GeneratedTextColumn _constructCtnrate() {
    return GeneratedTextColumn(
      'ctnrate',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ctntotalMeta = const VerificationMeta('ctntotal');
  GeneratedTextColumn _ctntotal;
  @override
  GeneratedTextColumn get ctntotal => _ctntotal ??= _constructCtntotal();
  GeneratedTextColumn _constructCtntotal() {
    return GeneratedTextColumn(
      'ctntotal',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pcsqtyMeta = const VerificationMeta('pcsqty');
  GeneratedTextColumn _pcsqty;
  @override
  GeneratedTextColumn get pcsqty => _pcsqty ??= _constructPcsqty();
  GeneratedTextColumn _constructPcsqty() {
    return GeneratedTextColumn(
      'pcsqty',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pcsrateMeta = const VerificationMeta('pcsrate');
  GeneratedTextColumn _pcsrate;
  @override
  GeneratedTextColumn get pcsrate => _pcsrate ??= _constructPcsrate();
  GeneratedTextColumn _constructPcsrate() {
    return GeneratedTextColumn(
      'pcsrate',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pcstotalMeta = const VerificationMeta('pcstotal');
  GeneratedTextColumn _pcstotal;
  @override
  GeneratedTextColumn get pcstotal => _pcstotal ??= _constructPcstotal();
  GeneratedTextColumn _constructPcstotal() {
    return GeneratedTextColumn(
      'pcstotal',
      $tableName,
      false,
    );
  }

  final VerificationMeta _grandtotalMeta = const VerificationMeta('grandtotal');
  GeneratedTextColumn _grandtotal;
  @override
  GeneratedTextColumn get grandtotal => _grandtotal ??= _constructGrandtotal();
  GeneratedTextColumn _constructGrandtotal() {
    return GeneratedTextColumn(
      'grandtotal',
      $tableName,
      false,
    );
  }

  final VerificationMeta _supplierMeta = const VerificationMeta('supplier');
  GeneratedIntColumn _supplier;
  @override
  GeneratedIntColumn get supplier => _supplier ??= _constructSupplier();
  GeneratedIntColumn _constructSupplier() {
    return GeneratedIntColumn(
      'supplier',
      $tableName,
      false,
    );
  }

  final VerificationMeta _unitMeta = const VerificationMeta('unit');
  GeneratedIntColumn _unit;
  @override
  GeneratedIntColumn get unit => _unit ??= _constructUnit();
  GeneratedIntColumn _constructUnit() {
    return GeneratedIntColumn(
      'unit',
      $tableName,
      false,
    );
  }

  final VerificationMeta _unitnameMeta = const VerificationMeta('unitname');
  GeneratedTextColumn _unitname;
  @override
  GeneratedTextColumn get unitname => _unitname ??= _constructUnitname();
  GeneratedTextColumn _constructUnitname() {
    return GeneratedTextColumn(
      'unitname',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        product,
        name,
        ctnqty,
        ctnrate,
        ctntotal,
        pcsqty,
        pcsrate,
        pcstotal,
        grandtotal,
        supplier,
        unit,
        unitname
      ];
  @override
  $StockTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'stock';
  @override
  final String actualTableName = 'stock';
  @override
  VerificationContext validateIntegrity(Insertable<StockData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('product')) {
      context.handle(_productMeta,
          product.isAcceptableOrUnknown(data['product'], _productMeta));
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('ctnqty')) {
      context.handle(_ctnqtyMeta,
          ctnqty.isAcceptableOrUnknown(data['ctnqty'], _ctnqtyMeta));
    } else if (isInserting) {
      context.missing(_ctnqtyMeta);
    }
    if (data.containsKey('ctnrate')) {
      context.handle(_ctnrateMeta,
          ctnrate.isAcceptableOrUnknown(data['ctnrate'], _ctnrateMeta));
    } else if (isInserting) {
      context.missing(_ctnrateMeta);
    }
    if (data.containsKey('ctntotal')) {
      context.handle(_ctntotalMeta,
          ctntotal.isAcceptableOrUnknown(data['ctntotal'], _ctntotalMeta));
    } else if (isInserting) {
      context.missing(_ctntotalMeta);
    }
    if (data.containsKey('pcsqty')) {
      context.handle(_pcsqtyMeta,
          pcsqty.isAcceptableOrUnknown(data['pcsqty'], _pcsqtyMeta));
    } else if (isInserting) {
      context.missing(_pcsqtyMeta);
    }
    if (data.containsKey('pcsrate')) {
      context.handle(_pcsrateMeta,
          pcsrate.isAcceptableOrUnknown(data['pcsrate'], _pcsrateMeta));
    } else if (isInserting) {
      context.missing(_pcsrateMeta);
    }
    if (data.containsKey('pcstotal')) {
      context.handle(_pcstotalMeta,
          pcstotal.isAcceptableOrUnknown(data['pcstotal'], _pcstotalMeta));
    } else if (isInserting) {
      context.missing(_pcstotalMeta);
    }
    if (data.containsKey('grandtotal')) {
      context.handle(
          _grandtotalMeta,
          grandtotal.isAcceptableOrUnknown(
              data['grandtotal'], _grandtotalMeta));
    } else if (isInserting) {
      context.missing(_grandtotalMeta);
    }
    if (data.containsKey('supplier')) {
      context.handle(_supplierMeta,
          supplier.isAcceptableOrUnknown(data['supplier'], _supplierMeta));
    } else if (isInserting) {
      context.missing(_supplierMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit'], _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('unitname')) {
      context.handle(_unitnameMeta,
          unitname.isAcceptableOrUnknown(data['unitname'], _unitnameMeta));
    } else if (isInserting) {
      context.missing(_unitnameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return StockData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $StockTable createAlias(String alias) {
    return $StockTable(_db, alias);
  }
}

abstract class _$Stockdatabase extends GeneratedDatabase {
  _$Stockdatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $StockTable _stock;
  $StockTable get stock => _stock ??= $StockTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [stock];
}
