import 'package:getx_test_1/data_source/task_data_source.dart';
import 'package:getx_test_1/sqldb.dart';
import '../task/task_models/task_model.dart';

class LocalTaskDataSource implements TaskDataSource {
  final SqlDatabase _sqlDatabase = SqlDatabase();

  @override
  Future<List<TaskModel>> getTasks() async {
    List<TaskModel> result = [];
    List<Map> response = await _sqlDatabase.readData("SELECT * FROM tasks");
    for (var item in response) {
      TaskModel taskModel = TaskModel(
          id: item["id"],
          title: item["title"],
          note: item["task"],
          time: item["date"]);
      result.add(taskModel);
    }
    return result;
  }

  @override
  Future<TaskModel?> getTaskById(int id) async {
    List<Map> response = await _sqlDatabase.readData('''
        SELECT * FROM tasks 
        WHERE id = "$id"
        ''');
    if (response.isEmpty) {
      return null;
    } else {
      Map map = response.first;
      return TaskModel(
          id: map["id"],
          title: map["title"],
          note: map["task"],
          time: map["date"]);
    }
  }

  @override
  Future<void> addTask(
      {required String title,
      required String task,
      required String date}) async {
    int response = await _sqlDatabase.insertData('''
      INSERT INTO tasks ("title" , "task" , "date")
      VALUES (
      "$title" ,
      "$task" ,
      "$date"
            )
      ''');
    if (response != 0) {
      // print('Task added success');
    } else {
      // print('Failed to add new task');
    }
  }

  @override
  Future<void> editTask(
      {required int id,
      required String title,
      required String task,
      required String? date}) async {
    int? response = await _sqlDatabase.updateData('''
      UPDATE tasks SET
      title = "$title" ,
      task = "$task" ,
      date = "$date"
      WHERE id = "$id"
      ''');
    if (response != 0) {
      // print('Edit success');
    } else {
      // print('Failed to edit the note!');
    }
  }

  @override
  Future<void> deleteAll() async {
    _sqlDatabase.deleteAllData("DELETE FROM tasks");
  }

  @override
  Future<void> deleteTask(int id) async {
    await _sqlDatabase.deleteData("DELETE FROM tasks WHERE id = '$id'");
  }
}
