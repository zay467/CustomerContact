import 'package:customer_contact/Screens/Home.dart';
import 'package:customer_contact/testdb.dart';
import 'package:flutter/material.dart';
import 'route.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
