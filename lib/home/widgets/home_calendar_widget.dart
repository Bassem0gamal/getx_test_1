import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

import '../../text_style.dart';

class HomeCalendarWidget extends StatelessWidget {
  const HomeCalendarWidget({Key? key}) : super(key: key);

  static DateTime? selectedDate;


  @override
  Widget build(BuildContext context) {

    return DatePicker(
      DateTime.now(),
      height: 100,
      width: 80,
      initialSelectedDate: DateTime.now(),
      selectionColor: Colors.blue,
      selectedTextColor: Colors.white,
      daysCount: 30,
      dateTextStyle: kTitleTextStyle(),
      dayTextStyle: kBodyTextStyle(fontWeight: FontWeight.bold),
      monthTextStyle: kSmallTextStyle(fontWeight: FontWeight.bold),
      onDateChange: (date) {
        selectedDate = date;
      },
    );
  }
}
