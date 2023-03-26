import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test_1/sqldb.dart';
import 'package:getx_test_1/task/models/task_model.dart';

class TaskController extends GetxController {
  SqlDatabase sqlDatabase = SqlDatabase();

  final RxList<TaskModel> taskModel = RxList<TaskModel>();
  final TextEditingController title = TextEditingController();
  final TextEditingController task = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController time = TextEditingController();
  final TextEditingController repeat = TextEditingController();

  final TextEditingController newTitle = TextEditingController();
  final TextEditingController newTask = TextEditingController();
  final TextEditingController newDate = TextEditingController();
  final TextEditingController newTime = TextEditingController();
  final TextEditingController newRepeat = TextEditingController();

  datePicker(BuildContext context) async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2024));
    return pickerDate;
  }

  Future<void> addTask(
      {required String? title,
      required String? task,
      required String? date,
      required String? time,
      required String? repeat,
      String? color}) async {
    int response = await sqlDatabase.insertData('''
      INSERT INTO tasks ("title" , "task" , "date" , "time" , "repeat" , "color")
      VALUES (
      "$title" ,
      "$task" ,
      "$date" ,
      "$time" ,
      "$repeat" ,
      "$color" ,
           )
    ''');
    if (response == 0) {
      print('failed to add task');
    }
  }

  Future<void> editTask({
    required String title,
    required String task,
    required String date,
    required String time,
    required String color,
    required int id,
  }) async {
    int? response = await sqlDatabase.updateData('''
    UPDATE tasks SET
    title = "$title" ,
    task = "$task" ,
    date = "$date" ,
    time = "$time" ,
    color = "$color"
    WHERE id = "$id"
     ''');
    if (response == 0) {
      print('failed to edit the task');
    }
  }
}
