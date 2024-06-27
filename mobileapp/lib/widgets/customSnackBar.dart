import 'package:flutter/material.dart';

class CustomSnackBarWidget {
  static void show(BuildContext context, String text, Widget icon,
      {Color backgroundColor = Colors.green,
      int durationInMilliseconds = 2500}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: backgroundColor,
      content: Row(
        children: [
          icon,
          const SizedBox(width: 5),
          Text(text),
        ],
      ),
      duration: Duration(milliseconds: durationInMilliseconds),
    ));
  }
}
