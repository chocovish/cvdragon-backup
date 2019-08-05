import 'dart:io';
import 'package:flutter/material.dart';
import '../demologin.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
Future<void> logout(BuildContext context) async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("authKey", null);
  prefs.setInt("loginstatus", null);  
  prefs.setString("name", null);
  prefs.setString("email", null);
  prefs.setBool("alltablescreated",null);
  prefs.setString("cvid", null);
  prefs.setString("id", null);
  prefs.setStringList('syncQuery',null);
  Directory appDocDir = await getApplicationDocumentsDirectory();
 var db=await  openDatabase(appDocDir.path.toString()+"/sections.db");
 db.close();
 await deleteDatabase(appDocDir.path.toString()+"/sections.db");
      print(appDocDir.listSync().toString());
  appDocDir.deleteSync(recursive: true);
 // print(appDocDir.listSync().toString());
  print("deleted");
  var route = MaterialPageRoute(builder: (context)=>DemoLogin());
  Navigator.of(context).pushAndRemoveUntil(route, (r)=>false);
}
