import 'package:flutter/material.dart';
import 'package:getx_test_1/task/add_screen/add_task_controller.dart';
import 'package:getx_test_1/text_style.dart';
import '../task_models/task_input_field_model.dart';

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
                    controller: addTaskController.titleController,
                    validator: addTaskController.titleValidator,
                    maxLines: 1,
                  ),
                  TaskInputField(
                    title: 'Note',
                    hint: 'Enter note here',
                    controller: addTaskController.taskController,
                    validator: addTaskController.noteValidator,
                    maxLines: 7,
                  ),
                  const SizedBox(height: 8.0),
                  Text(addTaskController.date),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: const [
                            SizedBox(width: 100),
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
