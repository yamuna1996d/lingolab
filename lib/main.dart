import 'package:flutter/material.dart';
import 'package:lingolab/screens/login.dart';
void main() {
  runApp(LingoLab());
}

class LingoLab extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
        body: LogIn(),

       
        )
    );
  }
}