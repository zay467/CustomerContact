import 'dart:ui';

import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: ()
          {
            Navigator.of(context).pushReplacementNamed("/home");
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF00D8E7),
            size: 30.0,
          ),
        ),
      ),

      backgroundColor: Colors.white,
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/g2k.jpg'),
              ),
              TextField(
                cursorColor:Color(0xFF00D8E7) ,
                style: TextStyle(
                    fontFamily: "Stat",
                    fontSize: 25.0,
                    color: Color(0xFF00D8E7)),
                onChanged: (String str){
                  print(str);
                },
              ),
              Text(

                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.teal.shade100,
                  fontSize:20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                  height: 20.0,
                  width: 200.0,
                  child: Divider(
                    color: Colors.black,
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  child: TextField(
                     decoration: InputDecoration(
                       hintText: 'Your name',
                       labelText: 'Name',
                       labelStyle: TextStyle(
                         fontSize: 25,
                         color: Color(0xFF00D8E7)
                       )

                     ),
                    cursorColor:Color(0xFF00D8E7) ,

                    onChanged: (String str){
                      print(str);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Your email',
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF00D8E7)
                        )

                    ),
                    cursorColor:Color(0xFF00D8E7) ,

                    onChanged: (String str){
                      print(str);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: 'Your phone',
                        labelText: 'Phone',

                        labelStyle: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF00D8E7)
                        )

                    ),
                    cursorColor:Color(0xFF00D8E7) ,

                    onChanged: (String str){
                      print(str);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Roll call',
                        labelText: 'roll call',
                        labelStyle: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF00D8E7)
                        )

                    ),
                    cursorColor:Color(0xFF00D8E7) ,

                    onChanged: (String str){
                      print(str);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Your email',
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF00D8E7)
                        )

                    ),
                    cursorColor:Color(0xFF00D8E7) ,

                    onChanged: (String str){
                      print(str);
                    },
                  ),
                ),
              ),





            ],
          ),
        ),
      ),
    );
  }

}





