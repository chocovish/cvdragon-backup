import 'dart:io';
import 'package:flutter/material.dart';
import '../demologin.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

Future<void> logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("authKey", null);
  prefs.setString("loginStatus", null);  
  Directory appDocDir = await getApplicationDocumentsDirectory();
  appDocDir.deleteSync(recursive: true);
  print("deleted");
  var route = MaterialPageRoute(builder: (context)=>DemoLogin());
  Navigator.of(context).pushAndRemoveUntil(route, (r)=>false);
}
