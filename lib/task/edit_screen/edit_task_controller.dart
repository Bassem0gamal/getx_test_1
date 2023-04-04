import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test_1/data_source/in_memory_task_data_source.dart';
import 'package:getx_test_1/data_source/task_data_source.dart';
import 'package:getx_test_1/task/edit_screen/edit_task.dart';
import '../task_models/task_model.dart';

class EditTaskController extends GetxController {
  final TaskDataSource _dataSource = InMemoryTaskDataSource.instance;
  int taskId = Get.arguments;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  void initialize() {
    TaskModel? task = _dataSource.getTaskById(taskId);
    if (task == null) {
      Get.back();
      Get.snackbar('Error', 'There was something unexpected',
          colorText: Colors.red, snackPosition: SnackPosition.BOTTOM);
    } else {
      titleController.text = task.title;
      noteController.text = task.note;
      dateController.text = task.time;
    }
    super.onInit();
  }

  void editTasks() {
    if (EditTask.formKey.currentState!.validate()) {
      _dataSource.editTask(
          title: titleController.text,
          note: noteController.text,
          date: dateController.text,
          id: taskId);

      Get.back(result: true);
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    noteController.dispose();
    dateController.dispose();

    super.dispose();
  }

  String? titleValidator(String? titleValue) {
    return titleValue!.isEmpty ? "Can't be empty" : null;
  }

  String? noteValidator(String? noteValue) {
    return noteValue!.isEmpty ? "Can't be empty" : null;
  }
}
