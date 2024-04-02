import 'package:flutter/material.dart';

import 'package:keellsapp/Screens/orderAccepted.dart';
import 'package:keellsapp/widegets/colors.dart';
import 'package:keellsapp/widegets/keells_button.dart';

// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class LoginScreen5 extends StatefulWidget {
  const LoginScreen5({super.key});

  @override
  State<LoginScreen5> createState() => _LoginScreen5State();
}

class _LoginScreen5State extends State<LoginScreen5> {
  final _formKey = GlobalKey<FormState>();
  var _isSending = false;
  var _enteredAddress = '';
  var _enteredCity = '';
  var _enteredPostalCode = '';
  var _enteredReciption = '';

  void _saveItem() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    try {
      setState(() {
        _isSending = true;
      });
      // await _firestore.collection('delivery_details').add({
      //   'address': _enteredAddress,
      //   'city': _enteredCity,
      //   'postalCode': _enteredPostalCode,
      //   'reception': _enteredReciption,
      // });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OrderAccepted(),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Add Delivery Details'),
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
                      Row(
                        children: [
                          const Text(
                            'Address',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.star_rate_sharp,
                            color: keellsColor,
                          )
                        ],
                      ),
                      TextFormField(
                        maxLength: 50,
                        decoration: InputDecoration(
                          label: const Text('Number,Street Name'),
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
                          _enteredAddress = value!;
                        },
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'City',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.star_rate_sharp,
                            color: keellsColor,
                          )
                        ],
                      ),
                      TextFormField(
                        maxLength: 50,
                        decoration: InputDecoration(
                          label: const Text('City'),
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
                          _enteredCity = value!;
                        },
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Postal Code',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.star_rate_sharp,
                            color: keellsColor,
                          )
                        ],
                      ),
                      TextFormField(
                        maxLength: 50,
                        decoration: InputDecoration(
                          label: const Text('Postal Code'),
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
                          _enteredPostalCode = value!;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  KeellsButton(
                      buttonName: 'Confirm',
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
