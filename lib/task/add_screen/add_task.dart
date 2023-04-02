import 'package:flutter/material.dart';
import 'package:getx_test_1/task/add_screen/add_task_controller.dart';
import 'package:getx_test_1/icons.dart';
import 'package:getx_test_1/task/models/task_input_field_model.dart';
import 'package:getx_test_1/text_style.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  static String id = '/add_task';
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  AddTaskController addTaskController = AddTaskController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: AddTask.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Task',
                    style: kHeadLine1TextStyle(color: Colors.black),
                  ),
                  TaskInputField(
                    title: 'Title',
                    hint: 'Enter title here',
                    controller: addTaskController.title,
                    validator: addTaskController.titleValidator, maxLines: 1,
                  ),
                  TaskInputField(
                    title: 'Note',
                    hint: 'Enter note here',
                    controller: addTaskController.note,
                    validator: addTaskController.noteValidator, maxLines: 5,
                  ),
                  TaskInputField(
                    title: 'Date',
                    hint: DateFormat.yMEd().format(DateTime.now()),
                    controller: addTaskController.date,
                    validator: null, maxLines: 1,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Color'),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                children: [
                                  blueCircleIcon(),
                                  redCircleIcon(),
                                  yellowCircleIcon(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            addTaskController.addTasks();
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue),
                          child: const Text('Create Task'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
