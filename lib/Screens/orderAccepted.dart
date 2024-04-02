import 'package:flutter/material.dart';

import 'package:keellsapp/Screens/tabs_screen.dart';
import 'package:keellsapp/widegets/colors.dart';
import 'package:keellsapp/widegets/keells_button.dart';

class OrderAccepted extends StatelessWidget {
  const OrderAccepted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset('assets/orderAccepted.png'),
                  const SizedBox(
                    height: 45,
                  ),
                  const Text(
                    'Your Order has been Accepted',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'Your Item has been placed and is on\n it\'s way to being processed.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 90,
              ),
              KeellsButton(
                  buttonName: 'Back to Home',
                  buttonColor: keellsColor,
                  onSubmit: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TabsScreen(),
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
