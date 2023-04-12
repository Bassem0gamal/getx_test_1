import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test_1/data_source/local_task_data_source.dart';
import 'package:getx_test_1/data_source/task_data_source.dart';
import 'package:getx_test_1/task/edit_screen/edit_task.dart';
import 'package:intl/intl.dart';
import '../task_models/task_model.dart';

class EditTaskController extends GetxController {
  final TaskDataSource _dataSource = LocalTaskDataSource();
  int taskId = Get.arguments;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController taskController = TextEditingController();
  final String date = DateFormat.yMEd().format(DateTime.now());

  void initialize() async {
    TaskModel? task = await _dataSource.getTaskById(taskId);
    if (task == null) {
      Get.back();
      Get.snackbar('Error', 'There was something unexpected',
          colorText: Colors.red, snackPosition: SnackPosition.BOTTOM);
    } else {
      titleController.text = task.title;
      taskController.text = task.note;
    }
    super.onInit();
  }

  void editTasks() {
    if (EditTask.formKey.currentState!.validate()) {
      _dataSource.editTask(
          title: titleController.text,
          task: taskController.text,
          date: date,
          id: taskId);

      Get.back(result: true);
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    taskController.dispose();

    super.dispose();
  }

  String? titleValidator(String? titleValue) {
    return titleValue!.isEmpty ? "Can't be empty" : null;
  }

  String? noteValidator(String? noteValue) {
    return noteValue!.isEmpty ? "Can't be empty" : null;
  }
}
