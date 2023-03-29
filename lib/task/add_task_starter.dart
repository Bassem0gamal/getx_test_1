import 'package:flutter/material.dart';
import 'package:getx_test_1/task/add_task_controller.dart';
import 'package:getx_test_1/icons.dart';
import 'package:getx_test_1/task/models/task_input_field_model.dart';
import 'package:getx_test_1/text_style.dart';
import 'package:intl/intl.dart';

class AddTaskStarter extends StatefulWidget {
  const AddTaskStarter({Key? key}) : super(key: key);

  static String id = '/add_task_starter';
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<AddTaskStarter> createState() => _AddTaskStarterState();
}

class _AddTaskStarterState extends State<AddTaskStarter> {
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
              key: AddTaskStarter.formKey,
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
                    controller: addTaskController.newTitle,
                    validator: addTaskController.titleValidator,
                  ),
                  TaskInputField(
                    title: 'Note',
                    hint: 'Enter note here',
                    controller: addTaskController.newNote,
                    validator: addTaskController.noteValidator,
                  ),
                  TaskInputField(
                      title: 'Date',
                      hint: DateFormat.yMEd().format(DateTime.now()),
                      controller: addTaskController.newDate,
                      validator: null),
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
