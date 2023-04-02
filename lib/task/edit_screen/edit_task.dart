import 'package:flutter/material.dart';
import 'package:getx_test_1/icons.dart';
import 'package:getx_test_1/task/edit_screen/edit_task_controller.dart';
import 'package:getx_test_1/task/models/task_input_field_model.dart';
import 'package:getx_test_1/text_style.dart';
import 'package:get/get.dart';

class EditTask extends StatefulWidget {
  const EditTask({Key? key}) : super(key: key);

  static String id = '/edit_task';
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  EditTaskController editTaskController = EditTaskController();

  @override
  void initState() {
    editTaskController.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task Task'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: EditTask.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Edit Task',
                    style: kHeadLine1TextStyle(color: Colors.black),
                  ),
                  TaskInputField(
                    title: 'Title',
                    hint: null,
                    controller: editTaskController.titleController,
                    validator: editTaskController.titleValidator, maxLines: 1,
                  ),
                  TaskInputField(
                    title: 'Note',
                    hint: null,
                    controller: editTaskController.noteController,
                    validator: editTaskController.noteValidator, maxLines: 5,
                  ),
                  TaskInputField(
                    title: 'Date',
                    hint: null,
                    controller: editTaskController.dateController,
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
                            editTaskController.editTasks();
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue),
                          child: const Text('Edit Task'),
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
