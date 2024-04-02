import 'package:flutter/material.dart';

import 'package:keellsapp/widegets/colors.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
    required this.buttonName,
    required this.onSubmit,
  });
  final String buttonName;

  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    double screenSizeheight = MediaQuery.of(context).size.height;
    return MaterialButton(
      padding: EdgeInsets.symmetric(
        horizontal: screenSizeheight * 0.018,
      ),
      onPressed: onSubmit,
      color: Colors.grey.withOpacity(0.1),
      minWidth: double.infinity,
      height: screenSizeheight * 0.062,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(width: 0, color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.logout_sharp,
            color: keellsColor,
          ),
          Expanded(
            child: Text(
              buttonName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: keellsColor,
                fontSize: screenSizeheight * 0.022,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
