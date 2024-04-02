import 'package:flutter/material.dart';

import 'package:keellsapp/widegets/colors.dart';

class KeellsButton extends StatelessWidget {
  const KeellsButton({
    super.key,
    required this.buttonName,
    required this.buttonColor,
    required this.onSubmit,
    this.textColor = Colors.white,
  });
  final String buttonName;
  final Color buttonColor;
  final void Function() onSubmit;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;
    return MaterialButton(
      onPressed: onSubmit,
      color: buttonColor,
      minWidth: double.infinity,
      height: screenSize * 0.067,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(width: 0, color: keellsColor),
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          color: textColor,
          fontSize: screenSize * 0.027,
        ),
      ),
    );
  }
}
