// import 'package:flutter/material.dart';
// import 'package:getx_test_1/icons.dart';
// import 'package:getx_test_1/task/models/task_input_field_model.dart';
// import 'package:getx_test_1/task/stopped_for_now/task_controller.dart';
// import 'package:getx_test_1/text_style.dart';
// import 'package:intl/intl.dart';
//
// class EditTaskScreen extends StatefulWidget {
//   const EditTaskScreen({Key? key}) : super(key: key);
//   static String id = '/edit_task_screen';
//
//   @override
//   State<EditTaskScreen> createState() => _EditTaskScreenState();
// }
//
// class _EditTaskScreenState extends State<EditTaskScreen> {
//   TaskController taskController = TaskController();
//
//   @override
//   void initState() {
//     taskController.newTitle.text = taskController.title.text;
//     taskController.newTask.text = taskController.task.text;
//     taskController.newDate.text = taskController.date.text;
//     taskController.newTime.text = taskController.time.text;
//     taskController.newRepeat.text = taskController.repeat.text;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Your Task'),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Add Task',
//                   style: kHeadLine1TextStyle(color: Colors.black),
//                 ),
//                 TaskInputField(
//                   title: 'Title',
//                   hint: 'Enter title here',
//                   controller: taskController.newTitle, validator: null,
//                 ),
//                 TaskInputField(
//                   title: 'My Task',
//                   hint: 'Enter note here',
//                   controller: taskController.newTask, validator: null,
//                 ),
//                 TaskInputField(
//                   title: 'Date',
//                   hint: DateFormat.yMEd().format(DateTime.now()),
//                   controller: taskController.newDate, validator: null,
//                 ),
//                 TaskInputField(
//                   title: 'Time',
//                   hint: '00:00',
//                   controller: taskController.newTime, validator: null,
//                 ),
//                 TaskInputField(
//                   title: 'Repeat',
//                   hint: 'None',
//                   controller: taskController.newRepeat, validator: null,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text('Color'),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 8),
//                             child: Row(
//                               children: [
//                                 blueCircleIcon(),
//                                 redCircleIcon(),
//                                 yellowCircleIcon(),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 60),
//                     Expanded(
//                       child: TextButton(
//                         onPressed: () => taskController.addTask(
//                             title: taskController.newTitle.text,
//                             task: taskController.newTask.text,
//                             date: taskController.newDate.text,
//                             time: taskController.newTime.text,
//                             repeat: taskController.newRepeat.text,
//                             color: null),
//                         style: TextButton.styleFrom(
//                             foregroundColor: Colors.white,
//                             backgroundColor: Colors.blue),
//                         child: const Text('Edit Task'),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
