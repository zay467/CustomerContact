import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
static final _dbName='myDatabase.db';
static final _dbVersion=1;
static final _tableName='myTable';
static final columnID='_id';
static final columnName='name';
static final phone='phone';
static final mail='mail';
static final address='address';





DatabaseHelper._privateConstructor();
static final DatabaseHelper instance =DatabaseHelper._privateConstructor();

static Database _database;
Future<Database> get database async{
  if(_database!=null)return _database;
  _database=await _initiateDatabase();
  return _database;
}

_initiateDatabase() async{

  Directory directory=await  getApplicationDocumentsDirectory();
  String path=join(directory.path,_dbName);
  return await openDatabase(path,version: _dbVersion,onCreate: _onCreate);


}
Future _onCreate(Database db,int version)
{
  db.execute(
    '''
    CREATE TABLE $_tableName (
    $columnID INTEGER PRIMARY KEY,
    $columnName TEXT NOT NULL,
    $phone TEXT NOT NULL,
    $mail TEXT NOT NULL,
    $address TEXT NOT NULL
    )
    
    
    '''
  );
}

Future<int> insert(Map<String,dynamic> row) async{
Database db=await instance.database;
await db.insert(_tableName,row);


}
Future<List<Map<String,dynamic>>> queryAll() async
{
  Database db=await instance.database;
  return await db.query(_tableName);
}

Future update(Map<String,dynamic>row) async{
  Database db=await instance.database;
  int id=row[columnID];
 return await db.update(_tableName, row,where:'$columnName=?' ,whereArgs: [id]);
}

Future<int>delete(int id) async{
  Database db=await instance.database;
  return await db.delete(_tableName,where:'$columnID=?',whereArgs: [id]);
}

}