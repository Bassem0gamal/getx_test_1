import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test_1/data_source/local_task_data_source.dart';
import 'package:getx_test_1/data_source/task_data_source.dart';
import 'package:getx_test_1/task/add_screen/add_task.dart';

import 'package:getx_test_1/data_source/in_memory_task_data_source.dart';

class AddTaskController extends GetxController {
  final TaskDataSource _dataSource = InMemoryTaskDataSource.instance;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  void addTasks() {
    if (AddTaskScreen.formKey.currentState!.validate()) {
      _dataSource.addTask(
        title: titleController.text,
        note: noteController.text,
        date: dateController.text,
      );
      update();
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
