import 'package:cvdragonapp_v1/datapush.dart';
import 'package:cvdragonapp_v1/maps.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io' as io;
import './sharedfetch.dart' as sfetch;
import 'package:cvdragonapp_v1/datapush.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import './earlyfetch.dart';
var id = '';
var authkey = '';
var cvid = '';
//var sectionID = '51122';
//var data = 'projects';


Future<int>pushData(String section,Map<String,dynamic> createddata) async{
      var timestamp=new DateTime.now().millisecondsSinceEpoch;
      id=await sfetch.readid();
      authkey=await sfetch.readauthKey();
      cvid= await sfetch.readprofiles();
      var db=await openDatabase("assets/sections.db", version: 1);
      Map<String, dynamic> contents = {
        'id':id,
        'refID':timestamp,
        columnName[section]:timestamp,
        'status':1,
        'proofRead':0,
        'proofReadDate':"0000-00-00"
};
print(createddata);
contents.addAll(createddata);
        await db.insert(tablename[section],contents);
        await db.rawUpdate("UPDATE `create-cvsection` SET contentAdded = contentAdded+1, status=1 WHERE id="+id+" AND section="+section+" AND status=1");
        // insert a subsection the arrays of create-cvprofilesection => in subsection
        List response=await db.rawQuery("SELECT subsection FROM `create-cvprofilesection` WHERE `cvid`= "+cvid+" AND `section` = "+section);
        List res=json.decode(response[0]['subsection']);
        res.add(timestamp);
        String sql="UPDATE `create-cvprofilesection` SET subsection=\""+res.toString()+"\" WHERE `cvid`= "+cvid+" AND `section` = "+section;
        await db.rawUpdate(sql);
        print("Added a data in local data fetch");
        return 1;
}

// Future<int>updateAcademicProject(String t,String d,Map<String,dynamic> data) async{
// var db=await openDatabase("assets/sections.db", version: 1);
// String sql="UPDATE `cv-academic-projects` SET title = \" "+t+" \" , description = \" "+d+"\" WHERE id="+id+" AND academicid="+data['academicid'].toString();
//         await db.rawUpdate(sql);
//         return 1;
// }
Future<int>updateData(String section,Map<String,dynamic> newdata,Map<String,dynamic> data) async{
var db=await openDatabase("assets/sections.db", version: 1);
id=await sfetch.readid();
String sql="UPDATE "+tablename[section]+" SET ";
newdata.forEach((k,v){
  sql+=k+" = \""+v+"\"";
});
sql+=" WHERE id="+id+" AND "+columnName[section]+"="+data[columnName[section]].toString();
        await db.rawUpdate(sql);
        return 1;
}
