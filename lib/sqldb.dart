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
    String path = join(dataBasePath, 'notes.database');
    Database myDataBase = await openDatabase(path, onCreate: onCreate);
    return myDataBase;
  }

  Future onCreate(Database dataBase, int version) async {
    Batch batch = dataBase.batch();

    batch.execute('''
    CREATE TABLE "tasks" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "task" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "time" TEXT NOT NULL,
    "repeat" TEXT NOT NULL,
    "color" TEXT NOT NULL
    )
    ''');

    await batch.commit();

    print('Create DATABASE and TABLE =====');
  }

  readData(String sql) async {
    Database? myDataBase = await dataBase;
    List<Map> response = await myDataBase!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? myDataBase = await dataBase;
    int response = await myDataBase!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? myDb = await dataBase;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? myDataBase = await dataBase;
    int response = await myDataBase!.rawDelete(sql);
    return response;
  }

  deleteDataBase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'notes.db');
    await deleteDatabase(path);
    //print('Database Deleted');
  }
}
