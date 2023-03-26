import 'package:getx_test_1/data_source/task_data_source.dart';
import 'package:getx_test_1/task/models/task_model.dart';

class LocalTaskDataSource implements TaskDataSource {
  @override
  void addTask(
      {required String title, required String note, required String date}) {}

  @override
  void deleteAll() {}

  @override
  void deleteTask(int id) {}

  @override
  void editTask(
      {required int id,
      required String title,
      required String note,
      required String date}) {}

  @override
  List<TaskModel> getTasks() {
    throw UnimplementedError();
  }
}
