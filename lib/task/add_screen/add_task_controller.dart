import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test_1/data_source/task_data_source.dart';
import 'package:getx_test_1/task/add_screen/add_task.dart';
import 'package:getx_test_1/data_source/in_memory_task_data_source.dart';

import '../models/task_model.dart';

class AddTaskController extends GetxController {
  final TaskDataSource _dataSource = InMemoryTaskDataSource.instance;

  // final RxList<TaskModel> tasks = RxList();

  final TextEditingController title = TextEditingController();
  final TextEditingController note = TextEditingController();
  final TextEditingController date = TextEditingController();

  void addTasks() {
    if (AddTask.formKey.currentState!.validate()) {
      _dataSource.addTask(
        title: title.text,
        note: note.text,
        date: date.text,
      );
      Get.back(result: true);
    }
  }

  @override
  void onClose() {
    title.dispose();
    note.dispose();
    date.dispose();

    super.dispose();
  }

  String? titleValidator(String? titleValue) {
    return titleValue!.isEmpty ? "Can't be empty" : null;
  }

  String? noteValidator(String? noteValue) {
    return noteValue!.isEmpty ? "Can't be empty" : null;
  }
}
