import '../task/task_models/task_model.dart';

abstract class TaskDataSource {
  Future<List<TaskModel>> getTasks();

  Future<TaskModel?> getTaskById(int id);

  Future<void> addTask({
    required String title,
    required String task,
    required String date,
  });

  Future<void> editTask({
    required int id,
    required String title,
    required String task,
    required String date,
  });

  Future<void> deleteTask(int id);

  Future<void> deleteAll();
}
