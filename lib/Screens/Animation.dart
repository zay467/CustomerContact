import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


import 'Home.dart';



class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: TyperAnimatedTextKit(
                  isRepeatingAnimation: false,

                  text: ["Created By"],
                  speed: Duration(milliseconds: 200),

// pause: Duration(milliseconds: 200),
                  alignment: Alignment.center,
                  textStyle: TextStyle(fontSize: 40.0, fontFamily: "Horizon"),
                ),
              ),
              ColorizeAnimatedTextKit(
                isRepeatingAnimation: false,
                text: [
                  ""
                      "Generation",
                  "2K",
                  "G2K",
                ],
                pause: Duration(milliseconds: 1000),
                textStyle: TextStyle(fontSize: 50.0, fontFamily: "Horizon"),
                colors: [
                  Colors.purple,
                  Colors.blue,
                  Colors.yellow,
                  Colors.red,
                ],
                onFinished: ()
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute()));
                },
              ),
            ],
          ),
        ));
  }
}


