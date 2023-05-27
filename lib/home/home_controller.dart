import 'package:get/get.dart';
import 'package:getx_test_1/data_source/local_task_data_source.dart';
import '../data_source/task_data_source.dart';
import '../task/task_models/task_model.dart';

class HomeController extends GetxController {
  final TaskDataSource _dataSource = LocalTaskDataSource();
  final RxList<TaskModel> tasks = RxList();

  void loadTasks() async {
    tasks.value = await _dataSource.getTasks();
  }

  Future<void> deleteAllTasks() async {
    await _dataSource.deleteAll();
    tasks.clear();
  }

  Future<void> deleteTask(int id, int i) async {
    await _dataSource.deleteTask(id);
    tasks.removeAt(i);
  }
}
