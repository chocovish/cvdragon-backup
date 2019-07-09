import 'package:cvdragonapp_v1/datapush.dart';
import 'package:cvdragonapp_v1/maps.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io' as io;

import 'package:cvdragonapp_v1/datapush.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import './earlyfetch.dart';
var id = '15585932569410';
var authkey = '1d9f7dba5fa41c8065f198f97cd177f9';
var cvid = '4763';
var sectionID = '51122';
var data = 'projects';
Map<String, dynamic> contents = {
  'id':id,
  'projectid':1,
  'organization':'jsdn',
  'designation':'ww',
  'workid':3,
  'duration':'2 weeks',
  'location':'howrah',
  'title': 'New Project Added by Rohit',
  'description': 'Description of New Project',
  'status':1,
  'proofRead':0,
  'proofReadDate':"0000-00-00"
};
Map<String, dynamic> academicProject = {
  'id':id,
  'academicid':123,
  'refID':'44',
  'title': 'New Academic Project Added by Application',
  'description': 'Description of New Project ',
  'status':1,
};

Future<int>push(String section) async{
var db=await openDatabase("assets/sections.db", version: 1);
          db.insert(tablename[section],contents).then((onValue){
          db.rawUpdate("UPDATE `create-cvsection` SET contentAdded = contentAdded+1 WHERE id="+id+" AND section="+sectionID+" AND status=1");
          print("Added1");
          });
        return 1;
}

Future<int>pushAcademicProject(String title,String description) async{
var db=await openDatabase("assets/sections.db", version: 1);
          // db.insert("`cv-academic-projects`",academicProject).then((onValue){
        //  db.rawUpdate("UPDATE `create-cvsection` SET contentAdded = contentAdded+1 WHERE id="+id+" AND section="+sectionID+" AND status=1");
         // });
        return 1;
}

Future<int>updateAcademicProject(String t,String d,Map<String,dynamic> data) async{
var db=await openDatabase("assets/sections.db", version: 1);
String sql="UPDATE `cv-academic-projects` SET title = \" "+t+" \" , description = \" "+d+"\" WHERE id="+id+" AND academicid="+data['academicid'].toString();
        await db.rawUpdate(sql);
        return 1;
}
