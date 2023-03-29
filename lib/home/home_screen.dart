import 'package:flutter/material.dart';
import 'package:getx_test_1/home/home_controller.dart';
import 'package:getx_test_1/home/widgets/home_calendar_widget.dart';
import 'package:getx_test_1/home/widgets/home_tasks_widget.dart';
import 'package:getx_test_1/text_style.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../task/add_task_starter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = HomeController();

  @override
  void initState() {
    homeController.loadTasks();
    super.initState();
  }

  Future<void> openAddTask() async {
    final  result =  await Get.toNamed(AddTaskStarter.id);
    if (result == true) {
      homeController.loadTasks();
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate;
    const noTask = 1;

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
                        DateFormat.yMMMMd().format(DateTime.now()),
                        style: kBodyTextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Today',
                        style: kHeadLine2TextStyle(),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => openAddTask(),
                    child: const Text('+ New Task'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const HomeCalendarWidget(),
              const SizedBox(height: 16.0),
              Expanded(
                child: Obx(
                  () {
                    return homeController.tasks.isEmpty
                        ? const NoTask()
                        : ListView.builder(
                            itemCount: homeController.tasks.length,
                            itemBuilder: (context, int i) {
                              return TaskItem(taskModel: homeController.tasks[i]);
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
