import 'package:ezy_scan/signup.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF014133),//0xFF014133
        scaffoldBackgroundColor: Color(0xFF5f6f2e),
        //0xFF5f6f2e
      ),

      home: Scaffold(
        body: signup(),
      ),
    );
  }
}


