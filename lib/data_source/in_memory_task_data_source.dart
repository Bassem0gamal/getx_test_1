import 'package:getx_test_1/data_source/task_data_source.dart';
import 'package:getx_test_1/task/models/task_model.dart';
import 'package:intl/intl.dart';

class InMemoryTaskDataSource implements TaskDataSource {
  static final InMemoryTaskDataSource instance =
      InMemoryTaskDataSource._private();


  InMemoryTaskDataSource._private();

  final Map<int, TaskModel> _map = {
    1: TaskModel(
        id: 1,
        title: 'Title',
        note: 'Note 1',
        time: DateFormat.yMMMMd().format(DateTime.now())),
    2: TaskModel(
        id: 2,
        title: 'Title',
        note: 'Note 2',
        time: DateFormat.yMMMMd().format(DateTime.now())),
    3: TaskModel(
        id: 3,
        title: 'Title',
        note: 'Note 3',
        time: DateFormat.yMMMMd().format(DateTime.now())),
    4: TaskModel(
        id: 4,
        title: 'Title',
        note: 'Note 4',
        time: DateFormat.yMMMMd().format(DateTime.now())),
    5: TaskModel(
        id: 5,
        title: 'Title',
        note: 'Note 5',
        time: DateFormat.yMMMMd().format(DateTime.now())),
    6: TaskModel(
        id: 6,
        title: 'Title',
        note: 'Note 6',
        time: DateFormat.yMMMMd().format(DateTime.now())),
    7: TaskModel(
        id: 7,
        title: 'Title',
        note: 'Note 7',
        time: DateFormat.yMMMMd().format(DateTime.now())),
  };

  @override
  void addTask(
      {required String title, required String note, required String date}) {
    int id = _map.length;
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
}
