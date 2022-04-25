// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Particular extends DataClass implements Insertable<Particular> {
  final int id;
  final int product;
  final String qty;
  final String name;
  final int supplier;
  final int unit;
  final String unitname;
  Particular(
      {@required this.id,
      @required this.product,
      @required this.qty,
      @required this.name,
      @required this.supplier,
      @required this.unit,
      @required this.unitname});
  factory Particular.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Particular(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      product:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}product']),
      qty: stringType.mapFromDatabaseResponse(data['${effectivePrefix}qty']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
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
    if (!nullToAbsent || qty != null) {
      map['qty'] = Variable<String>(qty);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
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

  ParticularsCompanion toCompanion(bool nullToAbsent) {
    return ParticularsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      product: product == null && nullToAbsent
          ? const Value.absent()
          : Value(product),
      qty: qty == null && nullToAbsent ? const Value.absent() : Value(qty),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      supplier: supplier == null && nullToAbsent
          ? const Value.absent()
          : Value(supplier),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      unitname: unitname == null && nullToAbsent
          ? const Value.absent()
          : Value(unitname),
    );
  }

  factory Particular.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Particular(
      id: serializer.fromJson<int>(json['id']),
      product: serializer.fromJson<int>(json['product']),
      qty: serializer.fromJson<String>(json['qty']),
      name: serializer.fromJson<String>(json['name']),
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
      'qty': serializer.toJson<String>(qty),
      'name': serializer.toJson<String>(name),
      'supplier': serializer.toJson<int>(supplier),
      'unit': serializer.toJson<int>(unit),
      'unitname': serializer.toJson<String>(unitname),
    };
  }

  Particular copyWith(
          {int id,
          int product,
          String qty,
          String name,
          int supplier,
          int unit,
          String unitname}) =>
      Particular(
        id: id ?? this.id,
        product: product ?? this.product,
        qty: qty ?? this.qty,
        name: name ?? this.name,
        supplier: supplier ?? this.supplier,
        unit: unit ?? this.unit,
        unitname: unitname ?? this.unitname,
      );
  @override
  String toString() {
    return (StringBuffer('Particular(')
          ..write('id: $id, ')
          ..write('product: $product, ')
          ..write('qty: $qty, ')
          ..write('name: $name, ')
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
              qty.hashCode,
              $mrjc(
                  name.hashCode,
                  $mrjc(supplier.hashCode,
                      $mrjc(unit.hashCode, unitname.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Particular &&
          other.id == this.id &&
          other.product == this.product &&
          other.qty == this.qty &&
          other.name == this.name &&
          other.supplier == this.supplier &&
          other.unit == this.unit &&
          other.unitname == this.unitname);
}

class ParticularsCompanion extends UpdateCompanion<Particular> {
  final Value<int> id;
  final Value<int> product;
  final Value<String> qty;
  final Value<String> name;
  final Value<int> supplier;
  final Value<int> unit;
  final Value<String> unitname;
  const ParticularsCompanion({
    this.id = const Value.absent(),
    this.product = const Value.absent(),
    this.qty = const Value.absent(),
    this.name = const Value.absent(),
    this.supplier = const Value.absent(),
    this.unit = const Value.absent(),
    this.unitname = const Value.absent(),
  });
  ParticularsCompanion.insert({
    this.id = const Value.absent(),
    @required int product,
    @required String qty,
    @required String name,
    @required int supplier,
    @required int unit,
    @required String unitname,
  })  : product = Value(product),
        qty = Value(qty),
        name = Value(name),
        supplier = Value(supplier),
        unit = Value(unit),
        unitname = Value(unitname);
  static Insertable<Particular> custom({
    Expression<int> id,
    Expression<int> product,
    Expression<String> qty,
    Expression<String> name,
    Expression<int> supplier,
    Expression<int> unit,
    Expression<String> unitname,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (product != null) 'product': product,
      if (qty != null) 'qty': qty,
      if (name != null) 'name': name,
      if (supplier != null) 'supplier': supplier,
      if (unit != null) 'unit': unit,
      if (unitname != null) 'unitname': unitname,
    });
  }

  ParticularsCompanion copyWith(
      {Value<int> id,
      Value<int> product,
      Value<String> qty,
      Value<String> name,
      Value<int> supplier,
      Value<int> unit,
      Value<String> unitname}) {
    return ParticularsCompanion(
      id: id ?? this.id,
      product: product ?? this.product,
      qty: qty ?? this.qty,
      name: name ?? this.name,
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
    if (qty.present) {
      map['qty'] = Variable<String>(qty.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
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
    return (StringBuffer('ParticularsCompanion(')
          ..write('id: $id, ')
          ..write('product: $product, ')
          ..write('qty: $qty, ')
          ..write('name: $name, ')
          ..write('supplier: $supplier, ')
          ..write('unit: $unit, ')
          ..write('unitname: $unitname')
          ..write(')'))
        .toString();
  }
}

class $ParticularsTable extends Particulars
    with TableInfo<$ParticularsTable, Particular> {
  final GeneratedDatabase _db;
  final String _alias;
  $ParticularsTable(this._db, [this._alias]);
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

  final VerificationMeta _qtyMeta = const VerificationMeta('qty');
  GeneratedTextColumn _qty;
  @override
  GeneratedTextColumn get qty => _qty ??= _constructQty();
  GeneratedTextColumn _constructQty() {
    return GeneratedTextColumn(
      'qty',
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
  List<GeneratedColumn> get $columns =>
      [id, product, qty, name, supplier, unit, unitname];
  @override
  $ParticularsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'particulars';
  @override
  final String actualTableName = 'particulars';
  @override
  VerificationContext validateIntegrity(Insertable<Particular> instance,
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
    if (data.containsKey('qty')) {
      context.handle(
          _qtyMeta, qty.isAcceptableOrUnknown(data['qty'], _qtyMeta));
    } else if (isInserting) {
      context.missing(_qtyMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
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
  Particular map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Particular.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ParticularsTable createAlias(String alias) {
    return $ParticularsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ParticularsTable _particulars;
  $ParticularsTable get particulars => _particulars ??= $ParticularsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [particulars];
}
