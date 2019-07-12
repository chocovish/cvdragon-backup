import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import './maps.dart';
Future<List> getDatabaseAcademicProject(String section) async {
var db=  await openDatabase('assets/sections.db', version: 3);
   List response=await db.rawQuery("SELECT subsection FROM `create-cvprofilesection` WHERE `cvid`= 4672 AND `section` = "+section);
    print(response);//contains 2 which is not in database
   List response2=await db.rawQuery("SELECT * FROM "+tablename[section]);
    print(response2);//contains all 4
    List data=[];
    response2.forEach((element){
      if(response[0]['subsection'].contains(element[columnName[section]].toString())==false)//perform response2-response
      {//element['academicid'].toString()
       // print(element);
       data.add(element);
      }
    });
  return data;
}

Future<List> getAddedAcademicProject(String section) async {
var db=  await openDatabase('assets/sections.db', version: 3);
   List response=await db.rawQuery("SELECT subsection FROM `create-cvprofilesection` WHERE `cvid`= 4672 AND `section` = "+section);
    //print(response);//contains 2 which is not in database
   List response2=await db.rawQuery("SELECT * FROM "+tablename[section]);
   // print(response2);//contains all 4
    List data=[];
    response2.forEach((element){
      if(response[0]['subsection'].contains(element[columnName[section]].toString())==true)//perform response2-response
      {//element['academicid'].toString()
       // print(element);
       data.add(element);
      }
    });
  return data;
}
Future<List> getDefaultSection(String section) async {
var db=  await openDatabase('assets/sections.db', version: 3);
   
   List response=await db.rawQuery("SELECT * FROM "+tablename[section]);
    return response;
}
Future<int>deleteFromProfile(String section,String subSection)async{
 var db=await openDatabase("assets/sections.db", version: 1);
  List response=await db.rawQuery("SELECT subsection FROM `create-cvprofilesection` WHERE `cvid`= 4672 AND `section` = "+section);
  List res=json.decode(response[0]['subsection']);
  print(res);
  print(subSection);
int i=0;
  res.forEach((element){
if(element.toString()==subSection.toString())
{
  print("found");
  i=res.indexOf(element);
}
  });
 res.removeAt(i);
  print(res);
  String sql="UPDATE `create-cvprofilesection` SET subsection=\""+res.toString()+"\" WHERE `cvid`= 4672 AND `section` = "+section;
  print(sql);
 await db.rawUpdate(sql);
}