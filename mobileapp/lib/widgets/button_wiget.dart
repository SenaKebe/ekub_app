import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double borderRadius;
  final List<Color> gradientColors;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;

  const CustomButtonWidget({
    required this.text,
    required this.onPressed,
    this.borderRadius = 25.0,
    this.gradientColors = const [Color(0xff53E88B), Color(0xff15BE77)],
    this.textStyle = const TextStyle(color: Colors.white),
    this.padding = const EdgeInsets.symmetric(horizontal: 75, vertical: 15),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(colors: gradientColors),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(padding),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
