import 'package:getx_test_1/data_source/task_data_source.dart';
import '../task/task_models/task_model.dart';

class InMemoryTaskDataSource implements TaskDataSource {
  static final InMemoryTaskDataSource instance =
      InMemoryTaskDataSource._private();

  InMemoryTaskDataSource._private();

  final Map<int, TaskModel> _map = {};

  @override
  Future<void> addTask(
      {required String title,
      required String task,
      required String date}) async {
    int id = _map.length + 1;
    TaskModel taskModel = TaskModel(
      id: id,
      title: title,
      note: task,
      time: date,
    );
    _map[id] = taskModel;
  }

  @override
  Future<void> deleteAll() async {
    _map.clear();
  }

  @override
  Future<void> deleteTask(int id) async {
    _map.remove(id);
  }

  @override
  Future<void> editTask(
      {required int id,
      required String title,
      required String task,
      required String date}) async {
    TaskModel taskModel = TaskModel(
      id: id,
      title: title,
      note: task,
      time: date,
    );
    _map[id] = taskModel;
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    return _map.values.toList();
  }

  @override
  Future<TaskModel?> getTaskById(int id) async {
    return _map[id];
  }
}
