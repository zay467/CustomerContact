import 'package:customer_contact/Components/CustomCards.dart';
import 'package:customer_contact/Components/HomeAppBar.dart';
import 'package:customer_contact/Utilities/Constants.dart';
import 'package:customer_contact/database_helper.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:loading_animations/loading_animations.dart';
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
            SliverList(
              delegate: gettingData
                  ? SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: Duration(milliseconds: 400),
                        child: SlideAnimation(
                          verticalOffset: 100.0,
                          child: CustomCards(
                            data: data[index],
                            refreshDb: getAllUsers,
                          ),
                        ),
                      );
                    }, childCount: data.length)
                  : SliverChildListDelegate(
                      [
                        Center(
                          child: LoadingBouncingGrid.circle(
                            backgroundColor: signature,
                            duration: Duration(milliseconds: 500),
                          ),
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
