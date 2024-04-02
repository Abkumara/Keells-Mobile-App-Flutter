//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class AccountTile extends StatelessWidget {
  const AccountTile(
      {super.key,
      required this.title,
      required this.leadIcon,
      required this.onPressed});
  final String title;
  final IconData leadIcon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize * 0.013),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(leadIcon),
                const SizedBox(
                  width: 5,
                ),
                Text(title),
              ],
            ),
            const Icon(Icons.navigate_next),
          ],
        ),
      ),
    );
  }
}
