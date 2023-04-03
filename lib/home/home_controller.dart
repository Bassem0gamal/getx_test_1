import 'package:get/get.dart';
import 'package:getx_test_1/data_source/in_memory_task_data_source.dart';
import '../data_source/task_data_source.dart';
import '../task/task_models/task_model.dart';

class HomeController extends GetxController {
  final TaskDataSource _dataSource = InMemoryTaskDataSource.instance;
  final RxList<TaskModel> tasks = RxList();

  void loadTasks() {
    tasks.value = _dataSource.getTasks();

  }
}
