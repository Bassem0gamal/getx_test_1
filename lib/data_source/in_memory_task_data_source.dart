import 'package:getx_test_1/data_source/task_data_source.dart';
import 'package:getx_test_1/task/models/task_model.dart';

class InMemoryTaskDataSource implements TaskDataSource {
  static final InMemoryTaskDataSource instance =
      InMemoryTaskDataSource._private();

  InMemoryTaskDataSource._private();

  final Map<int, TaskModel> _map = {


  };

  @override
  void addTask(
      {required String title, required String note, required String date}) async{
    int id = _map.length + 1;
    TaskModel taskModel = TaskModel(
      id: id,
      title: title,
      note: note,
      time: date,
    );
    _map[id] = taskModel;
  }

  @override
  void deleteAll() {
    _map.clear();
  }

  @override
  void deleteTask(int id) {
    _map.remove(id);
  }

  @override
  void editTask(
      {required int id,
      required String title,
      required String note,
      required String date}) {
    TaskModel taskModel = TaskModel(
      id: id,
      title: title,
      note: note,
      time: date,
    );
    _map[id] = taskModel;
  }

  @override
  List<TaskModel> getTasks() {
    return _map.values.toList();
  }

  @override
  TaskModel? getTaskById(int id) {
    return _map[id];
  }
}
