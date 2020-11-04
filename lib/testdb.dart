import 'package:customer_contact/database_helper.dart';
import 'package:flutter/material.dart';




class Homeo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'DB Text'
      ),),
      body: Center(
        child: Column(

          children: [
            FlatButton(onPressed:() async{

              int i=await DatabaseHelper.instance.insert({
                DatabaseHelper.columnName:"Zinlinaung",
                DatabaseHelper.phone:"09447032756",
                DatabaseHelper.mail:"Zla@gmail.com",
                DatabaseHelper.address:"my home",
              });
              print(i);
            } , child: Text('insert')),
            FlatButton(onPressed:() async{
              List<Map<String,dynamic>>queryRows=await DatabaseHelper.instance.queryAll();
              print(queryRows);
            } , child: Text('query')),
            FlatButton(onPressed:(){} , child: Text('update')),
            FlatButton(onPressed:(){} , child: Text('delete')),
          ],
        ),
      ),
    );
  }
}
