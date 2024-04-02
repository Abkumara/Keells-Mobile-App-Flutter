import 'package:flutter/material.dart';

import 'package:keellsapp/Screens/loginScreen5.dart';
import 'package:keellsapp/widegets/colors.dart';
import 'package:keellsapp/widegets/keells_button.dart';

// final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class LoginScreen4 extends StatefulWidget {
  const LoginScreen4({super.key});

  @override
  State<LoginScreen4> createState() => _LoginScreen4State();
}

class _LoginScreen4State extends State<LoginScreen4> {
  final _formKey = GlobalKey<FormState>();
  var _isSending = false;
  var _enterdFirst = '';
  var _enteredLast = '';
  var _email = '';
  var _userName = '';
  var _password = '';

  void _saveItem() async {
    final isvalid = _formKey.currentState!.validate();
    if (!isvalid) {
      return;
    }
    _formKey.currentState!.save();

    try {
      setState(() {
        _isSending = true;
      });
      // final UserCredential userCredential = await _firebaseAuth
      //     .createUserWithEmailAndPassword(email: _email, password: _password);

      // await _firestore
      //     .collection('keells-app-project-default-rtdb.firebaseio.com')
      //     .doc(userCredential.user!.uid)
      //     .set({
      //   'firstName': _enterdFirst,
      //   'lastName': _enteredLast,
      //   'email': _email,
      //   'userName': _userName,
      // });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen5(),
          ));
    } catch (error) {
      print('Error : $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    } finally {
      setState(() {
        _isSending = false;
      });
    }

    print(_enterdFirst);
    print(_enteredLast);
    print(_email);
    print(_userName);
    print(_password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Profile Creation'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'First Name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      TextFormField(
                        maxLength: 50,
                        decoration: InputDecoration(
                          label: const Text('First Name'),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: keellsColor), // Normal border color
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: keellsColor), // Focus border color
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                            ),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .red), // Set red color for error border
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 1 ||
                              value.trim().length > 50) {
                            return 'Must be between 1 and 50 charaters.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enterdFirst = value!;
                        },
                        keyboardType: TextInputType.name,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Last Name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      TextFormField(
                        maxLength: 50,
                        decoration: InputDecoration(
                          label: const Text('Last Name'),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: keellsColor), // Normal border color
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: keellsColor), // Focus border color
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                            ),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .red), // Set red color for error border
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 1 ||
                              value.trim().length > 50) {
                            return 'Must be between 1 and 50 charaters.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredLast = value!;
                        },
                        keyboardType: TextInputType.name,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      TextFormField(
                        maxLength: 50,
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: keellsColor), // Normal border color
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: keellsColor), // Focus border color
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                            ),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .red), // Set red color for error border
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 1 ||
                              value.trim().length > 50 ||
                              value.trim().contains('@')) {
                            return 'Invalid Email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'User Name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      TextFormField(
                        maxLength: 50,
                        decoration: InputDecoration(
                          label: const Text('User Name'),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: keellsColor), // Normal border color
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: keellsColor), // Focus border color
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                            ),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .red), // Set red color for error border
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 1 ||
                              value.trim().length > 50) {
                            return 'Invalid Username';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _userName = value!;
                        },
                        keyboardType: TextInputType.name,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      TextFormField(
                        maxLength: 50,
                        decoration: InputDecoration(
                          label: const Text('password'),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: keellsColor), // Normal border color
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: keellsColor), // Focus border color
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                            ),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .red), // Set red color for error border
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 8 ||
                              value.trim().length > 50 ||
                              value.trim().contains('@')) {
                            return 'Not Strong password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  KeellsButton(
                      buttonName: 'Next',
                      buttonColor: keellsColor,
                      onSubmit: () {
                        if (!_isSending) _saveItem();
                      }),
                ],
              )),
        ),
      ),
    );
  }
}
