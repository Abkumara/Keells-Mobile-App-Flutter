// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:keells/Screens/tabs_screen.dart';

// class OtpScreen extends StatefulWidget {
//   const OtpScreen({super.key, required this.verificationId});
//   final String verificationId;

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   TextEditingController otpController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           TextField(
//             controller: otpController,
//             keyboardType: TextInputType.phone,
//             decoration: InputDecoration(hintText: 'otp'),
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 try {
//                   PhoneAuthCredential credential =
//                       await PhoneAuthProvider.credential(
//                     verificationId: widget.verificationId,
//                     smsCode: otpController.text.toString(),
//                   );
//                   FirebaseAuth.instance
//                       .signInWithCredential(credential)
//                       .then((value) => {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const TabsScreen(),
//                                 ))
//                           });
//                 } catch (ex) {
//                   log(ex.toString());
//                 }
//               },
//               child: Text('Otp verify'))
//         ],
//       ),
//     );
//   }
// }
