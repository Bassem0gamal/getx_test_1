import 'package:sqflite/sqflite.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class SqlDatabase {
  static Database? _dataBase;

  Future<Database?> get dataBase async {
    if (_dataBase == null) {
      _dataBase = await intialDataBase();
      return _dataBase;
    } else {
      return _dataBase;
    }
  }

  intialDataBase() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'tasks.database');
    Database myDataBase =
        await openDatabase(path, onCreate: _onCreate, version: 1);
    return myDataBase;
  }

  Future _onCreate(Database dataBase, int version) async {
    Batch batch = dataBase.batch();

    batch.execute('''
    CREATE TABLE "tasks" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "task" TEXT NOT NULL,
    "date" TEXT NOT NULL
    )
    ''');

    await batch.commit();
  }

  Future<List<Map>> readData(String sql) async {
    Database? myDataBase = await dataBase;
    List<Map> response = await myDataBase!.rawQuery(sql);
    return response;
  }

  Future<int> insertData(String sql) async {
    Database? myDataBase = await dataBase;
    int response = await myDataBase!.rawInsert(sql);
    return response;
  }

  Future<int> updateData(String sql) async {
    Database? myDataBase = await dataBase;
    int response = await myDataBase!.rawUpdate(sql);
    return response;
  }

  Future<int> deleteData(String sql) async {
    Database? myDataBase = await dataBase;
    int response = await myDataBase!.rawDelete(sql);
    return response;
  }

  Future<int> deleteAllData(String sql) async {
    Database? myDataBase = await dataBase;
    int response = await myDataBase!.rawDelete(sql);
    return response;
  }
}
