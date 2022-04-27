import 'dart:io';
import 'package:moor/ffi.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'stock_database.g.dart';

class Stock extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get product => integer()();
  TextColumn get name => text()();
  TextColumn get ctnqty => text()();
  TextColumn get ctnrate => text()();
  TextColumn get ctntotal => text()();
  TextColumn get pcsqty => text()();
  TextColumn get pcsrate => text()();
  TextColumn get pcstotal => text()();
  TextColumn get grandtotal => text()();
  IntColumn get supplier => integer()();
  IntColumn get unit => integer()();
  TextColumn get unitname => text()();
}

LazyDatabase _openConnectionStock() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'teatime_stock_db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Stock])
class Stockdatabase extends _$Stockdatabase {
// we tell the database where to store the data with this constructor
  Stockdatabase() : super(_openConnectionStock());
  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.

  @override
  int get schemaVersion => 2;

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  Future<int> addStock(StockCompanion entry) {
    return into(stock).insert(entry);
  }

  Future<List<StockData>> getStock() {
    return (select(stock)).get();
  }

  Future deleteStockItem(int id) {
    return (delete(stock)..where((e) => e.id.equals(id))).go();
  }
   
  Future updateStock(
    id,
    ctnqty,
    ctnrate,
    ctntotal,
    pcsqty,
    pcsrate,
    pcstotal,
    grandtotal,
  ) {
    print(ctnqty.runtimeType);
    print(pcsqty.runtimeType);
    print(grandtotal.runtimeType);
    return (update(stock)..where((t) => t.id.equals(id))).write(
      StockCompanion(
        ctnqty: Value(ctnqty),
        ctnrate: Value(ctnrate),
        ctntotal: Value(ctntotal),
        pcsqty: Value(pcsqty),
        pcsrate: Value(pcsrate),
        pcstotal: Value(pcstotal),
        grandtotal: Value(grandtotal),
      ),

      //ParticularsCompanion(unit: Value(unit)),
    );
  }

  Future deleteAll() {
    return (delete(stock)).go();
  }
}
