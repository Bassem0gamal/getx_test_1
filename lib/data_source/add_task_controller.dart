import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test_1/data_source/add_task_starter.dart';
import 'package:getx_test_1/data_source/in_memory_task_data_source.dart';
import 'package:getx_test_1/data_source/task_data_source.dart';

import '../task/models/task_model.dart';

class AddTaskController extends GetxController {
  final TaskDataSource _dataSource = InMemoryTaskDataSource.instance;
  final RxList<TaskModel> tasks = RxList();
  bool submitted = false;

  final TextEditingController newTitle = TextEditingController();
  final TextEditingController newNote = TextEditingController();
  final TextEditingController newDate = TextEditingController();

  void addTasks() {
    if (AddTaskStarter.formKey.currentState!.validate()) {
      _dataSource.addTask(
          title: newTitle.text, note: newNote.text, date: newDate.text);
      Get.back();
    }
  }

  String? titleValidator(String? titleValue) {
    return titleValue!.isEmpty ? "Can't be empty" : null;
  }

  String? noteValidator(String? noteValue) {
    return noteValue!.isEmpty ? "Can't be empty" : null;
  }
}
