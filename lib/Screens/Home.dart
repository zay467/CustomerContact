import 'package:customer_contact/Components/CustomCards.dart';
import 'package:customer_contact/Components/HomeAppBar.dart';
import 'package:customer_contact/Utilities/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Utilities/Data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeAppBar(),
            // THIS IS JUST TESTING NOT A FINAL DESIGN!!!!!!!!!!!!!!!!!
            SliverList (

              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return CustomCards (data[index]);
              }, childCount: data.length),
            ),
          ],
        ),
      ),
    );
  }
}
