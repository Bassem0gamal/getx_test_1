
import 'package:get/get.dart';
import 'package:getx_test_1/data_source/in_memory_task_data_source.dart';
import '../task/models/task_model.dart';

class HomeController extends GetxController {
  final InMemoryTaskDataSource _dataSource = InMemoryTaskDataSource();
  final RxList<TaskModel> tasks = RxList();

  void loadTasks() {
    tasks.value = _dataSource.getTasks();
  }


}

