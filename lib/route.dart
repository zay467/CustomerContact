import 'package:customer_contact/Screens/Home.dart';
import 'package:customer_contact/Screens/Detail.dart';
import 'package:flutter/material.dart';
import './Screens/Animation.dart';
import 'Screens/Error.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print(args);
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => MyAnimation());
      case "/home":
        return MaterialPageRoute(builder: (context) => Home());
      case "/detail":
        return MaterialPageRoute(
          builder: (context) => Detail(
            data: args,
          ),
        );

      default:
        return MaterialPageRoute(builder: (context) => MyError());
    }
  }
}
