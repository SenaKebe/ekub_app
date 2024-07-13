import 'package:flutter/material.dart';

class ButtonStyles {
  static final ButtonStyle blueRounded = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      Colors.green.shade900,
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
        side: BorderSide(
          color: Colors.green.shade400,
        ),
      ),
    ),
  );

  static final ButtonStyle imageRounded = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      Colors.green.shade600,
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
        side: BorderSide(
          color: Colors.green.shade200,
          width: 1,
        ),
      ),
    ),
  );
}
