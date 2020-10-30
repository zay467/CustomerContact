import 'package:customer_contact/Utilities/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomCards(dynamic data) {
  return Padding(
    padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
    child: Card(
      color: Color(0xFF333333),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 4,
      child: InkWell(
        splashColor: signature,
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(
            height: 120,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    backgroundColor: signature,
                    radius: 50,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "#${data['id']}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            data['name'],
                            style: TextStyle(
                              fontSize: 24,
                              // fontWeight: FontWeight.bold,
                              fontFamily: "Oswald",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.phone_forwarded,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  data['phone'],
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: "Oswald",
                                    color: Colors.white,
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
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.navigate_next_rounded,
                    color: signature,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
