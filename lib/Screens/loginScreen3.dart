import 'package:flutter/material.dart';

import 'package:keellsapp/Screens/login.dart';
import 'package:keellsapp/Screens/loginScreen4.dart';
import 'package:keellsapp/widegets/colors.dart';
import 'package:keellsapp/widegets/keells_button.dart';

class LoginScreen3 extends StatefulWidget {
  const LoginScreen3({super.key});

  @override
  State<LoginScreen3> createState() => _LoginScreen3State();
}

class _LoginScreen3State extends State<LoginScreen3> {
  final _formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;
    TextEditingController phoneController = TextEditingController();
    var _enteredPhoneNumber = '';
    var _isSending = false;
    void _saveItem() async {
      if (_formKey2.currentState!.validate()) {
        _formKey2.currentState!.save();
        setState(() {
          _isSending = true;
        });
      }
      if (!context.mounted) {
        return;
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Image.asset('assets/keellslogo.png'),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Welcome to Keells online',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 180,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter Your Mobile Number',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Form(
                    key: _formKey2,
                    child: TextFormField(
                      controller: phoneController,
                      maxLength: 9,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          prefixText: '+94 ',
                          prefixStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length != 9) {
                          return 'wrong number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredPhoneNumber = value!;
                      },
                    ),
                  ),
                  KeellsButton(
                      buttonName: 'Next',
                      buttonColor: keellsColor,
                      onSubmit: () {
                        if (!_isSending) {
                          _saveItem();
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen4(),
                              ));
                        }
                      }),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Or',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  MaterialButton(
                    onPressed: () {},
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
                        Image.asset('assets/google.png'),
                        Expanded(
                          child: Text(
                            'Continue With Google',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenSize * 0.022,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MaterialButton(
                    onPressed: () {},
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
                        Image.asset('assets/facebook.png'),
                        Expanded(
                          child: Text(
                            'Continue With Facebook',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenSize * 0.022,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an Account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    },
                    child: const Text(
                      'Sign in',
                    ),
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
