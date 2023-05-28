import 'package:flutter/material.dart';
import 'package:getx_test_1/home/home_controller.dart';
import 'package:getx_test_1/home/widgets/home_tasks_widget.dart';
import 'package:getx_test_1/task/edit_screen/edit_task.dart';
import 'package:getx_test_1/task/models/task_model.dart';
import 'package:getx_test_1/text_style.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../locator.dart';
import '../task/add_screen/add_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = locator<HomeController>();

  @override
  void initState() {
    homeController.loadTasks();
    super.initState();
  }

  Future<void> openAddTask() async {
    final addResult = await Get.toNamed(AddTaskScreen.id);
    if (addResult == true) {
      homeController.loadTasks();
    }
  }

  Future<void> openEditTask(int id) async {
    final editResult = await Get.toNamed(EditTaskScreen.id, arguments: id);
    if (editResult == true) {
      homeController.loadTasks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today',
                        style: kHeadLine2TextStyle(),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat.yMMMMd().format(DateTime.now()),
                        style: kBodyTextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => openAddTask(),
                    child: const Text('+ New Task'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: Obx(
                  () {
                    return homeController.tasks.isEmpty
                        ? const NoTask()
                        : ListView.builder(
                            itemCount: homeController.tasks.length,
                            itemBuilder: (context, int i) {
                              return Dismissible(
                                key: ValueKey<TaskModel>(
                                    homeController.tasks[i]),
                                background: Container(
                                  color: Colors.red,
                                  child: const Icon(Icons.delete,
                                      color: Colors.white),
                                ),
                                onDismissed: (direction) {
                                  setState(() {
                                    homeController.tasks.removeAt(i);
                                  });
                                },
                                child: TaskItem(
                                  taskModel: homeController.tasks[i],
                                  onEditPressed: () =>
                                      openEditTask(homeController.tasks[i].id),
                                ),
                              );
                            },
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
