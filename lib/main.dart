import 'package:flutter/material.dart';
import 'package:lingolab/screens/forgotpassword.dart';
import 'package:lingolab/screens/login.dart';
import 'package:lingolab/screens/otp.dart';
import 'package:lingolab/screens/verifyphone.dart';
void main() {
  runApp(LingoLab());
}

class LingoLab extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/login":(context) => LogIn(),
        "/forgotpassword":(context) => ForgotPassword(),
        "/otp":(context) => VerifyPhone(),
        "/otps":(context)=>Otp(),
      },
    );
  }
}