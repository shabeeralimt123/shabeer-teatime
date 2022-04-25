import 'dart:io';
import 'package:moor/ffi.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DataClassName("Particular")
class Particulars extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get product => integer()();
  TextColumn get qty => text()();
  TextColumn get name => text()();
  IntColumn get supplier => integer()();
  IntColumn get unit => integer()();
  TextColumn get unitname => text()();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'teatime_order_db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Particulars])
class MyDatabase extends _$MyDatabase {
// we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  Future<int> addParticular(ParticularsCompanion entry) {
    return into(particulars).insert(entry);
  }

  Future<List<Particular>> getParticulars() {
    return (select(particulars)).get();
  }

  Future deleteItem(int id) {
    return (delete(particulars)..where((e) => e.id.equals(id))).go();
  }

  Future updateParticular(id, qty,unitId,unitName) {
    print(qty.runtimeType);
    print(unitId.runtimeType);
    print(unitName.runtimeType);
    return (update(particulars)..where((t) => t.id.equals(id))).write(
      ParticularsCompanion(qty: Value(qty),unit: Value(unitId),unitname: Value(unitName)),

      //ParticularsCompanion(unit: Value(unit)),
    );
  }
 

  Future deleteAll() {
    return (delete(particulars)).go();
  }
}
