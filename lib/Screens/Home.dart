import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              pinned: true,
              // floating: true,
              expandedHeight: 200.0,
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
                      child: IconButton(
                        icon: Icon(
                          Icons.add_rounded,
                          color: Color(0xFF00D8E7),
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.sort,
                          color: Color(0xFF00D8E7),
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: EdgeInsets.only(top: 60.0),
                  width: double.infinity,
                  height: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: TextField(
                                style: TextStyle(color: Color(0xFF00D8E7)),
                                cursorColor: Color(0xFF00D8E7),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Color(0xFF00D8E7), width: 2.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Color(0xFF00D8E7), width: 2.0),
                                  ),
                                ),
                              ),
                            ),
                            // Expanded(
                            //   flex: 1,
                            //   child: IconButton(
                            //     icon: Icon(
                            //       Icons.search,
                            //       color: Color(0xFF00D8E7),
                            //       size: 30.0,
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ],
                    ),
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
      ),
    );
  }
}
