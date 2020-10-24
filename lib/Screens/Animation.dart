import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'Home.dart';

class MyAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
        body: Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: 500,
          height: 500,
          child: Card(
    shadowColor: Colors.black,
    color: Colors.white,



    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                ColorizeAnimatedTextKit(
                  isRepeatingAnimation: true,
                  text: [
                    "Created By",
                  ],
                  pause: Duration(milliseconds: 200),
                  speed: Duration(milliseconds: 200),
                  textStyle: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Pacifico",
                      fontWeight: FontWeight.bold),
                  colors: [
                    Colors.red,
                    Colors.orange,
                    Colors.yellow,
                    Colors.green,
                    Colors.blue,
                    Colors.purple
                  ],
                ),
                TyperAnimatedTextKit(

                  isRepeatingAnimation: false,
                  text: ["Generation 2K"],
                  speed: Duration(milliseconds: 250),
                  alignment: Alignment.center,
                  textStyle: TextStyle(fontSize: 50.0, fontFamily: "Stat"),
                  onFinished: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
              ],
            ),


    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),

    ),
        ),
    ),
      )
    ));
  }
}
