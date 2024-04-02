import 'package:flutter/material.dart';

import 'package:keellsapp/widegets/colors.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
    required this.onSubmit,
    required this.totalValue,
  });

  final void Function() onSubmit;
  final String totalValue;

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: MaterialButton(
        onPressed: onSubmit,
        color: keellsColor,
        minWidth: double.infinity,
        height: screenSize * 0.067,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 0, color: keellsColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Checkout',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenSize * 0.027,
              ),
            ),
            Text(
              'Rs $totalValue',
              style: const TextStyle(
                  color: Colors.white,
                  backgroundColor: Color.fromARGB(255, 51, 111, 53),
                  fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
