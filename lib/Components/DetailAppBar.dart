import 'package:customer_contact/Utilities/Constants.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class DetailAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool isNew;
  final dynamic chooseimg;
  final File image;
  BuildContext contex;
  final dynamic Imagee;
  DetailAppBar({@required this.expandedHeight, @required this.isNew,@required this.chooseimg,@required this.contex,@required this.Imagee,@required this.image});





  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Opacity(
          // shrinkOffset / expandedHeight
          // Opacity one is the most shine and zero does not shine at all
          // shrinkOffset is in easy it is the number of pixel overflow accordingly during to the conditions or
          // position of the widget
          opacity: 1,
          child: Container(
            width: double.infinity,
            height: 100.0,
            color: Colors.black,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: signature,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    isNew ? "Detail" : "New",
                    style: TextStyle(
                      color: signature,
                      fontFamily: 'Stat',
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 3 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              shape: CircleBorder(),
              elevation: 10,
              child: SizedBox(
                height: expandedHeight,
                width: MediaQuery.of(context).size.width / 2,
                child: CircleAvatar(
                  backgroundColor: signature,


                  radius: 38,
                  child: ClipOval(
                    child: (image!=null)?Image.file(image,fit:BoxFit.fill,width: double.infinity,):IconButton(
                      icon: Icon(
                        Icons.camera_alt
                      ),
                      onPressed: ()
                      {
                        chooseimg(contex);
                      },

                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
