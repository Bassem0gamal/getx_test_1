import 'package:flutter/material.dart';

TextStyle kHeadLine1TextStyle(
    {Color color = Colors.grey, FontWeight fontWeight = FontWeight.bold}) {
  return TextStyle(color: color, fontWeight: fontWeight, fontSize: 28);
}

TextStyle kHeadLine2TextStyle(
    {Color color = Colors.grey, FontWeight fontWeight = FontWeight.bold}) {
  return TextStyle(color: color, fontWeight: fontWeight, fontSize: 24);
}

TextStyle kTitleTextStyle(
    {Color color = Colors.grey, FontWeight fontWeight = FontWeight.bold}) {
  return TextStyle(color: color, fontWeight: fontWeight, fontSize: 20);
}

TextStyle kBodyTextStyle(
    {Color color = Colors.grey, FontWeight fontWeight = FontWeight.normal}) {
  return TextStyle(color: color, fontWeight: fontWeight, fontSize: 16);
}

TextStyle kSmallTextStyle(
    {Color color = Colors.grey, FontWeight fontWeight = FontWeight.normal}) {
  return TextStyle(color: color, fontWeight: fontWeight, fontSize: 14);
}
