import 'package:flutter/material.dart';
import 'package:getx_test_1/home/home_controller.dart';
import 'package:getx_test_1/task/models/task_model.dart';

class NoTask extends StatelessWidget {
  const NoTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.library_books,
          size: 60,
          color: Colors.grey,
        ),
        Text("You don't have any tasks for today",
            style: TextStyle(fontSize: 18, color: Colors.grey)),
      ],
    );
  }
}

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskModel.title,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      taskModel.note,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                       taskModel.time,
                        style: TextStyle(color: Colors.grey[350], fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
