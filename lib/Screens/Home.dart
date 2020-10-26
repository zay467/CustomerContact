import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            floating: true,
            expandedHeight: 150.0,
            title: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    "Home",
                    style: TextStyle(
                        fontFamily: "Stat",
                        fontSize: 25.0,
                        color: Color(0xFF00D8E7)),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Icon(
                        Icons.add_rounded,
                        color: Color(0xFF00D8E7),
                        size: 30.0,
                      ),
                    )),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: EdgeInsets.only(top: 80.0),
                width: double.infinity,
                height: double.infinity,
                child: Text(
                  "Testing not a final design!!!!!!!!! Layout testing ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          // THIS IS JUST TESTING NOT A FINAL DESIGN!!!!!!!!!!!!!!!!!
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.red,
                  height: 150,
                  child: Text("Hellllllllllo"),
                ),
                Container(
                  color: Colors.red,
                  height: 150,
                  child: Text("Hellllllllllo"),
                ),
                Container(
                  color: Colors.red,
                  height: 150,
                  child: Text("Hellllllllllo"),
                ),
                Container(
                  color: Colors.red,
                  height: 150,
                  child: Text("Hellllllllllo"),
                ),
                Container(
                  color: Colors.red,
                  height: 150,
                  child: Text("Hellllllllllo"),
                ),
                Container(
                  color: Colors.red,
                  height: 150,
                  child: Text("Hellllllllllo"),
                ),
                Container(
                  color: Colors.red,
                  height: 150,
                  child: Text("Hellllllllllo"),
                ),
                Container(
                  color: Colors.red,
                  height: 150,
                  child: Text("Hellllllllllo"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
