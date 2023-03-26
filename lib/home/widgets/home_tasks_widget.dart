import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

class HomeTask extends StatelessWidget {
  const HomeTask(
      {super.key,
      required this.title,
      required this.task,
      required this.date,
      this.color,
      this.time,
      this.repeat});

  final String title;
  final String task;
  final String date;
  final String? time;
  final String? repeat;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: color,
      ),
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              task,
              style: const TextStyle(color: Colors.white),
            ),
            Align(
              alignment: FractionalOffset.bottomLeft,
              child: Text(
                date,
                style: TextStyle(color: Colors.grey.shade300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
