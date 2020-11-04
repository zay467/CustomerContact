import 'package:customer_contact/Components/CustomCards.dart';
import 'package:customer_contact/Components/HomeAppBar.dart';
import 'package:customer_contact/Utilities/Constants.dart';
import 'package:customer_contact/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic data;
  bool gettingData = false;
  @override
  void initState() {
    super.initState();
    getAllUsers();
  }

  void getAllUsers() async {
    dynamic users = await DatabaseHelper.instance.queryAll();
    setState(() {
      data = users;
      gettingData = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeAppBar(
              refreshDb: getAllUsers,
            ),
            // THIS IS JUST TESTING NOT A FINAL DESIGN!!!!!!!!!!!!!!!!!

            SliverList(
              delegate: gettingData
                  ? SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                      return CustomCards(
                        data: data[index],
                        refreshDb: getAllUsers,
                      );
                    }, childCount: data.length)
                  : SliverChildListDelegate(
                      [
                        Center(
                          child: Text(
                            "Loading",
                            style: TextStyle(fontSize: 100, color: signature),
                          ),
                        )
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
