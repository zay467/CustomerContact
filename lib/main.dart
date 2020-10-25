import 'package:flutter/material.dart';
import 'route.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
