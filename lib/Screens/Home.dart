import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Home"),
            expandedHeight: 200.0,
            // flexibleSpace: Image(
            //   image: NetworkImage(
            //       "http://wechannelmm.com/static/media/dchannel.03cde5cf.png"),
            // ),
          ),
        ],
      ),
    );
  }
}
