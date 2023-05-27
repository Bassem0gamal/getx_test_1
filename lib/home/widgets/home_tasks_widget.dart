import 'package:flutter/material.dart';
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
  const TaskItem({
    super.key,
    required this.taskModel,
    required this.onEditPressed,
  });

  final TaskModel taskModel;
  final Function() onEditPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: SizedBox(
              child: Padding(
                padding:
                    const EdgeInsets.only( left: 8.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          taskModel.title,
                          style: const TextStyle(
                              color: Colors.blue, fontSize: 20),
                        ),
                        Expanded(
                          child: Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () => onEditPressed(),
                                icon: const Icon(
                                  Icons.edit_note,
                                  size: 24,
                                  color: Colors.blue,
                                ),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      taskModel.note,
                      style: const TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        taskModel.time,
                        style: const TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
