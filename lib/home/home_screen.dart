import 'package:flutter/material.dart';
import 'package:getx_test_1/home/home_controller.dart';
import 'package:getx_test_1/home/widgets/home_calendar_widget.dart';
import 'package:getx_test_1/home/widgets/home_tasks_widget.dart';
import 'package:getx_test_1/task/add_task_screen.dart';
import 'package:getx_test_1/text_style.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

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
                    onPressed: () => Get.toNamed(AddTaskScreen.id),
                    child: const Text('+ New Task'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const SizedBox(
                child: HomeCalendarWidget(),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                child: noTask == 2
                    ? const NoTask()
                    : SizedBox(
                        height: 500,
                        child: Obx(
                          () => ListView.builder(
                            itemCount: homeController.tasks.length,
                            itemBuilder: (context, int i) {
                              return Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              homeController.tasks[i].title,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              homeController.tasks[i].note,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 5),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                homeController.tasks[i].time
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.grey[350],
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
