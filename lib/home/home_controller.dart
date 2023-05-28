import 'package:get/get.dart';

import '../data_source/task_data_source.dart';
import '../task/models/task_model.dart';

class HomeController extends GetxController {
  final TaskDataSource _dataSource;

  HomeController(this._dataSource);

  final RxList<TaskModel> tasks = RxList();

  void loadTasks() {
    tasks.value = _dataSource.getTasks();
  }
}
