import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test_1/task/add_task_starter.dart';
import 'package:getx_test_1/task/stoped_for_now/edit_task_screen.dart';

import 'home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: HomeScreen.id, page: () => const HomeScreen()),
        GetPage(name: AddTaskStarter.id, page: () => const AddTaskStarter()),
        GetPage(name: EditTaskScreen.id, page: () => const EditTaskScreen()),
      ],
    );
  }
}
