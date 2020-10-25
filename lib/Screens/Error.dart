import 'package:flutter/material.dart';

class MyError extends StatefulWidget {
  @override
  _MyErrorState createState() => _MyErrorState();
}

class _MyErrorState extends State<MyError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Error"),
      ),
    );
  }
}
