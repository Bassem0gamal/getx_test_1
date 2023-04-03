import 'package:getx_test_1/data_source/task_data_source.dart';
import 'package:getx_test_1/sqldb.dart';
import '../task/task_models/task_model.dart';

class LocalTaskDataSource implements TaskDataSource {
  @override
  List<TaskModel> getTasks() {
    SqlDatabase sqlDatabase = SqlDatabase();

    Future<void> readData() async {
      List<Map> response = await sqlDatabase.readData("SELECT* FROM tasks");
      for (var item in response) {
        TaskModel taskModel = TaskModel(
            id: item["id"],
            title: item["title"],
            note: item["task"],
            time: item["date"]);
        getTasks().add(taskModel);
      }
    }
    readData();

    return getTasks();
  }

  @override
  TaskModel? getTaskById(int id) {
    // TODO: implement getTaskById
    throw UnimplementedError();
  }

  @override
  void addTask(
      {required String title, required String note, required String date}) {
    SqlDatabase sqlDatabase = SqlDatabase();

    Future<void> addData(
        {required String? title,
        required String? task,
        required String? date}) async {
      int response = await sqlDatabase.insertData('''
      INSERT INTO tasks ("title" , "task" , "date")
      VALUES (
      "$title" ,
      "$task" ,
      "$date"
            )
      ''');
      if (response != 0) {
        print('Task added success');
      } else {
        print('Failed to add new task');
      }
    }
  }

  @override
  void editTask(
      {required int id,
      required String title,
      required String note,
      required String? date}) {
    SqlDatabase sqlDatabase = SqlDatabase();
    Future<void> editData(
        {required int id,
        required String title,
        required String task,
        required String date}) async {
      int? response = await sqlDatabase.updateData('''
      UPDATE tasks SET
      title = "$title" ,
      task = "$task" ,
      date = "$date"
      WHERE id = "$id"
      ''');
      if (response != 0) {
        print('Edit success');
      } else {
        print('Failed to edit the note!');
      }
    }
  }

  @override
  void deleteAll() {
    SqlDatabase sqlDatabase = SqlDatabase();
    sqlDatabase.deleteDataBase();
  }

  @override
  void deleteTask(int id) {
    SqlDatabase sqlDatabase = SqlDatabase();
    sqlDatabase.deleteData("DELETE FROM tasks WHERE id = $id");
  }
}
