import 'dart:ui';

import 'package:customer_contact/Components/DetailAppBar.dart';
import 'package:customer_contact/Utilities/Constants.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Material(
          color: Colors.black,
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: DetailAppBar(expandedHeight: 200),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF333333),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 80,
                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                "Name",
                                style: TextStyle(
                                    color: signature,
                                    fontFamily: "Stat",
                                    fontSize: 20),
                              ),
                            ),
                            TextField(
                              style: TextStyle(
                                color: signature,
                              ),
                              cursorColor: signature,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black,
                                enabledBorder: MyOutLineInputBorder,
                                focusedBorder: MyOutLineInputBorder,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                "Phone",
                                style: TextStyle(
                                    color: signature,
                                    fontFamily: "Stat",
                                    fontSize: 20),
                              ),
                            ),
                            TextField(
                              style: TextStyle(
                                color: signature,
                              ),
                              cursorColor: signature,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black,
                                enabledBorder: MyOutLineInputBorder,
                                focusedBorder: MyOutLineInputBorder,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                "Email",
                                style: TextStyle(
                                    color: signature,
                                    fontFamily: "Stat",
                                    fontSize: 20),
                              ),
                            ),
                            TextField(
                              style: TextStyle(
                                color: signature,
                              ),
                              cursorColor: signature,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black,
                                enabledBorder: MyOutLineInputBorder,
                                focusedBorder: MyOutLineInputBorder,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                "Address",
                                style: TextStyle(
                                    color: signature,
                                    fontFamily: "Stat",
                                    fontSize: 20),
                              ),
                            ),
                            TextField(
                              style: TextStyle(
                                color: signature,
                              ),
                              cursorColor: signature,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black,
                                enabledBorder: MyOutLineInputBorder,
                                focusedBorder: MyOutLineInputBorder,
                              ),
                            ),
                            SizedBox(
                              height: 400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
