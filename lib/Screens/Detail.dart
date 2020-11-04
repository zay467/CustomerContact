import 'dart:collection';
import 'dart:ui';

import 'package:customer_contact/Components/DetailAppBar.dart';
import 'package:customer_contact/Utilities/Constants.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final dynamic data;
  @override
  _DetailState createState() => _DetailState();
  Detail({@required this.data});
}

class _DetailState extends State<Detail> {
  final nameCon = TextEditingController();
  final phoneCon = TextEditingController();
  final emailCon = TextEditingController();
  final addressCon = TextEditingController();

  bool nameEmpty = false;
  bool phoneEmpty = false;
  bool editable = true;

  dynamic userData;

  @override
  void initState() {
    super.initState();
    if (widget.data.length != 0) {
      userData = widget.data;
      nameCon.text = userData['name'];
      phoneCon.text = userData['phone'];
      emailCon.text = userData['gmail'];
      addressCon.text = userData['address'];
      editable = false;
    }
  }

  bool isNameAndPhoneEmpty() {
    setState(
      () {
        nameCon.text.isEmpty ? nameEmpty = true : nameEmpty = false;
        phoneCon.text.isEmpty ? phoneEmpty = true : phoneEmpty = false;
      },
    );
    if (!(nameEmpty || phoneEmpty)) {
      return true;
    }
    return false;
  }

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
                              enabled: editable,
                              controller: nameCon,
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
                                errorBorder: MyOutLineInputBorder,
                                focusedErrorBorder: MyOutLineInputBorder,
                                disabledBorder: MyOutLineInputDisBorder,
                                errorText: nameEmpty ? "Require !" : null,
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
                              enabled: editable,
                              controller: phoneCon,
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
                                errorBorder: MyOutLineInputBorder,
                                focusedErrorBorder: MyOutLineInputBorder,
                                disabledBorder: MyOutLineInputDisBorder,
                                errorText: phoneEmpty ? "Require !" : null,
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
                              enabled: editable,
                              controller: emailCon,
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
                                disabledBorder: MyOutLineInputDisBorder,
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
                              enabled: editable,
                              controller: addressCon,
                              style: TextStyle(
                                color: signature,
                              ),
                              cursorColor: signature,
                              keyboardType: TextInputType.multiline,
                              maxLines: 4,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black,
                                enabledBorder: MyOutLineInputBorder,
                                focusedBorder: MyOutLineInputBorder,
                                disabledBorder: MyOutLineInputDisBorder,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RaisedButton(
                                  padding:
                                      EdgeInsets.only(top: 17.0, bottom: 17.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                      color: signature,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (editable) {
                                      if (isNameAndPhoneEmpty()) {
                                        print("Save in DB");
                                      } else {
                                        print("Don't save");
                                      }
                                    } else {
                                      setState(
                                        () {
                                          editable = true;
                                        },
                                      );
                                    }
                                  },
                                  color: signature,
                                  textColor: Colors.black,
                                  child: Text(
                                    editable ? "S a v e" : "E d i t",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24.0,
                                        fontFamily: "Stat"),
                                  ),
                                ),
                              ],
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
