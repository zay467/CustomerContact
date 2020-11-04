import 'package:customer_contact/Utilities/Constants.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 24,
      backgroundColor: Colors.black,
      pinned: true,
      // floating: true,
      expandedHeight: 140.0,
      title: Row(
        children: [
          Expanded(
            flex: 6,
            child: Text(
              "Home",
              style: TextStyle(
                  fontFamily: "Stat", fontSize: 25.0, color: signature),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/detail", arguments: {});
                },
                icon: Icon(
                  Icons.add_rounded,
                  color: signature,
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
                  color: signature,
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
                      flex: 2,
                      child: TextField(
                        onChanged: (e) {
                          print(e);
                        },
                        style: TextStyle(
                          color: signature,
                        ),
                        cursorColor: signature,
                        decoration: InputDecoration(
                          hintText: "Search...",
                          hintStyle: TextStyle(
                            color: signature,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 15.0),
                            child: Icon(
                              Icons.search_rounded,
                              color: signature,
                            ),
                          ),
                          enabledBorder: MyOutLineInputBorder,
                          focusedBorder: MyOutLineInputBorder,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: RaisedButton(
                        padding: EdgeInsets.only(top: 17.0, bottom: 17.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                            color: signature,
                          ),
                        ),
                        onPressed: () {},
                        color: signature,
                        textColor: Colors.black,
                        child: Text(
                          "S e a r c h",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Stat"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
