import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:keellsapp/Screens/loginScreen3.dart';
import 'package:keellsapp/Screens/tabs_screen.dart';
import 'package:keellsapp/widegets/colors.dart';
import 'package:keellsapp/widegets/keells_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenSize * 0.11,
              ),
              Image.asset(
                'assets/keellslogo.png',
                width: screenSize * 0.15,
                height: screenSize * 0.15,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: screenSize * 0.04,
              ),
              Text(
                "Let's you in",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: screenSize * 0.034,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: screenSize * 0.04,
              ),
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 30, vertical: screenSize * 0.023),
                        hintText: 'User name',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: keellsColor,
                              width: 1,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(35))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: keellsColor,
                              width: 1,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(35))),
                        border: const OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: screenSize * 0.01,
                  ),
                  TextField(
                    obscureText: _obsecureText,
                    autocorrect: false,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 30, vertical: screenSize * 0.023),
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obsecureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: keellsColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _obsecureText = !_obsecureText;
                            });
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: keellsColor,
                              width: 1,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(35))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: keellsColor,
                              width: 1,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(35))),
                        border: const OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: screenSize * 0.001,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenSize * 0.07),
              Column(
                children: [
                  Column(
                    children: [
                      KeellsButton(
                        onSubmit: () {},
                        buttonName: 'Let Me In',
                        buttonColor: keellsColor,
                      ),
                      SizedBox(
                        height: screenSize * 0.01,
                      ),
                      KeellsButton(
                        onSubmit: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TabsScreen(),
                            ),
                          );
                        },
                        buttonName: 'Continue As a Guest',
                        buttonColor: keellsColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an Account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen3(),
                              ));
                        },
                        child: const Text(
                          'Sign Up',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
