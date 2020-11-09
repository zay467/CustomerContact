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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic data;
  dynamic searchUsers;

  bool gettingData = false;
  bool isSortByID = true;
  @override
  void initState() {
    super.initState();
    getAllUsers();
  }

  void sortData() {
    if (isSortByID) {
      getAllUsers();

      final snackBar = SnackBar(
        content: Text(
            'Sorted By ID',
          style: TextStyle(

          color: Colors.black,)
        ),
        duration: Duration(milliseconds: 500),
        backgroundColor: signature,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        behavior: SnackBarBehavior.floating,
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
      isSortByID = false;
    } else {
      getAllUsers();

      final snackBar = SnackBar(
        content: Text(
          'Sorted By Name',
            style: TextStyle(

              color: Colors.black,)
        ),
        duration: Duration(milliseconds: 500),
        backgroundColor: signature,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        behavior: SnackBarBehavior.floating,
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
      isSortByID = true;
    }
  }

  void getAllUsers() async {
    if(isSortByID) {
      dynamic users = await DatabaseHelper.instance.queryAll(false);
      setState(() {
        searchUsers = users;
        data = users;
        gettingData = true;
      });
    }else
      {
        dynamic users = await DatabaseHelper.instance.queryAll(true);
        setState(() {
          searchUsers = users;
          data = users;
          gettingData = true;
        });
      }

  }

  void search(String q) {
    data = searchUsers;
    if (!(q.length == 0)) {
      dynamic result = data.where((user) =>
          user['name'].toString().toLowerCase().contains(q.toLowerCase()));
      print(result);
      setState(() {
        data = result.toList();
      });
    } else {
      setState(() {
        data = searchUsers;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeAppBar(
              refreshDb: getAllUsers,
              searchFun: search,
              Sorted: sortData,
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
