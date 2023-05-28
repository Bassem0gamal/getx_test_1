import 'package:flutter/material.dart';
import 'package:getx_test_1/locator.dart';
import 'package:getx_test_1/task/add_screen/add_task_controller.dart';
import 'package:getx_test_1/task/models/task_input_field_model.dart';
import 'package:getx_test_1/text_style.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  static String id = '/add_task';
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  AddTaskController addTaskController = locator<AddTaskController>();

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
              key: AddTaskScreen.formKey,
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
                    controller: addTaskController.titleController,
                    validator: addTaskController.titleValidator,
                    maxLines: 1,
                  ),
                  TaskInputField(
                    title: 'Note',
                    hint: 'Enter note here',
                    controller: addTaskController.noteController,
                    validator: addTaskController.noteValidator,
                    maxLines: 5,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    DateFormat.yMEd().format(
                      DateTime.now(),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
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
