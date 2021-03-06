import 'dart:ui';
import 'package:customer_contact/Components/DetailAppBar.dart';
import 'package:customer_contact/Utilities/Constants.dart';
import 'package:customer_contact/Utilities/Data.dart';
import 'package:customer_contact/database_helper.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class Detail extends StatefulWidget {
  final dynamic data;
  final dynamic refreshDb;

  @override
  _DetailState createState() => _DetailState();
  Detail({@required this.data, @required this.refreshDb,});
}

class _DetailState extends State<Detail> {
  final nameCon = TextEditingController();
  final phoneCon = TextEditingController();
  final emailCon = TextEditingController();
  final addressCon = TextEditingController();

  bool nameEmpty = false;
  bool phoneEmpty = false;
  bool editable = true;
  bool saveNew = true;
  BuildContext contxtt;
  File imageFile;

  dynamic userData;

  @override
  void initState() {
    super.initState();
    if (widget.data.length != 0) {
      userData = widget.data;
      nameCon.text = userData['name'];
      phoneCon.text = userData['phone'];
      emailCon.text = userData['mail'];
      addressCon.text = userData['address'];
      editable = false;
      saveNew = false;
    }
  }

  void dispose() {
    nameCon.dispose();
    phoneCon.dispose();
    emailCon.dispose();
    addressCon.dispose();
    super.dispose();
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

  Future<bool> saveNewUser() async {
    int i = await DatabaseHelper.instance.insert({
      DatabaseHelper.name: nameCon.text,
      DatabaseHelper.phone: phoneCon.text,
      DatabaseHelper.mail: emailCon.text,
      DatabaseHelper.address: addressCon.text
    });

    return i == 0 ? false : true;
  }

  Future updateUser() async {
    await DatabaseHelper.instance.update({
      DatabaseHelper.idnum: userData["_id"],
      DatabaseHelper.name: nameCon.text,
      DatabaseHelper.phone: phoneCon.text,
      DatabaseHelper.mail: emailCon.text,
      DatabaseHelper.address: addressCon.text

    });
  }
  _openGallary (BuildContext context)async
  {
    var picture=await ImagePicker.pickImage(source: ImageSource.gallery);

    this.setState(() {
      imageFile=picture;
    });
    Navigator.of(context).pop();
  }
  _openCamera(BuildContext context)async
  {
    var picture=await ImagePicker.pickImage(source: ImageSource.camera);

    this.setState(() {
      imageFile=picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> showChoiceDialog(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Make a Choice"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              GestureDetector(
                  child: Text("Gallary"),
                  onTap:()
                  {
                    _openGallary(context);
                  }
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                  child: Text("Camera"),
                  onTap:()
                  {
                    _openCamera(context);
                  }
              )
            ],
          ),
        ),
      );

    },
    );
  }

  Future<bool> deleteUser() async {
    int i = await DatabaseHelper.instance.delete(userData["_id"]);
    return i == 1 ? true : false;
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
                delegate: DetailAppBar(expandedHeight: 200, isNew: !saveNew,chooseimg: showChoiceDialog,contex: context,image: imageFile),
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
                              height: 10,
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
                              height: 10,
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
                              height: 10,
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
                              mainAxisAlignment: saveNew
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.spaceBetween,
                              children: [
                                if (!saveNew)
                                  RaisedButton(
                                    padding: EdgeInsets.only(
                                        top: 17.0,
                                        bottom: 17.0,
                                        left: 10.0,
                                        right: 10.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                    onPressed: () {
                                      deleteUser()
                                          .then((value) => print(value));
                                      widget.refreshDb();
                                      Navigator.of(context).pop();
                                    },
                                    color: Colors.red,
                                    textColor: Colors.black,
                                    child: Text(
                                      "D E L E T E",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24.0,
                                          fontFamily: "Stat"),
                                    ),
                                  ),
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
                                        if (saveNew) {
                                          saveNewUser().then(
                                              (success) => print(success));
                                        } else {
                                          updateUser().then(
                                              (success) => print(success));
                                        }
                                        widget.refreshDb();
                                        Navigator.of(context).pop();
                                      }
                                    } else {
                                      setState(() {
                                        editable = !editable;
                                      });
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
