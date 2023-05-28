import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test_1/data_source/task_data_source.dart';
import 'package:getx_test_1/task/add_screen/add_task.dart';
import 'package:intl/intl.dart';


class AddTaskController extends GetxController {

  AddTaskController(this._dataSource);

  final TaskDataSource _dataSource;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  void addTasks() {
    if (AddTaskScreen.formKey.currentState!.validate()) {
      _dataSource.addTask(
        title: titleController.text,
        note: noteController.text,
        date:  DateFormat.yMEd().format(
          DateTime.now(),
        ),
      );

      Get.back(result: true);
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    noteController.dispose();

    super.dispose();
  }

  String? titleValidator(String? titleValue) {
    return titleValue!.isEmpty ? "Can't be empty" : null;
  }

  String? noteValidator(String? noteValue) {
    return noteValue!.isEmpty ? "Can't be empty" : null;
  }
}
