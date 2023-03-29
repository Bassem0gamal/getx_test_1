import 'package:flutter/material.dart';
import 'package:getx_test_1/text_style.dart';

class TaskInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const TaskInputField({
    super.key,
    required this.title,
    required this.hint,
    required this.controller, required this.validator,
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
              validator: validator,
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
