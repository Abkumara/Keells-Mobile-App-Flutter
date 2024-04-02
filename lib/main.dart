import 'package:flutter/material.dart';

import 'package:keellsapp/Provider/cartProvider.dart';
import 'package:keellsapp/Screens/login.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenSizeheight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => ItemCart(),
      child: MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            // ignore: deprecated_member_use
            bodyText1: TextStyle(fontSize: screenSizeheight * 0.02),
            // ignore: deprecated_member_use
            bodyText2: TextStyle(fontSize: screenSizeheight * 0.02),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
      ),
    );
  }
}
