import 'package:flutter/material.dart';
import 'package:getx_test_1/text_style.dart';

class TaskInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const TaskInputField({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: kTitleTextStyle(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFormField(
              autofocus: false,
              textAlign: TextAlign.start,
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: hint,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
