import '../task/task_models/task_model.dart';

abstract class TaskDataSource {
  List<TaskModel> getTasks();

  TaskModel? getTaskById(int id);

  void addTask({
    required String title,
    required String note,
    required String date,
  });

  void editTask({
    required int id,
    required String title,
    required String note,
    required String date,
  });

  void deleteTask(int id);

  void deleteAll();
}
