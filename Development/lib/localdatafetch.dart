import 'dart:convert';
import 'package:cvdragonapp_v1/sharedfetch.dart';
import 'package:sqflite/sqflite.dart';
import './maps.dart';
Future<List> getDatabase(String section) async {
var db=  await openDatabase('assets/sections.db', version: 3);
var cvid=await readprofiles();
   List response=await db.rawQuery("SELECT subsection FROM `create-cvprofilesection` WHERE `cvid`= "+cvid+" AND `section` = "+section);
    print("response="+response.toString());//contains 2 which is not in database
   List response2=await db.rawQuery("SELECT * FROM "+tablename[section]);
    print("response2="+response2.toString());//contains all 4
    List data=[];
    if(response.isEmpty==true)
    {
      return data;  
    }
    else
    {
    response2.forEach((element){
      if(response[0]['subsection'].contains(element[columnName[section]].toString())==false)//perform response2-response
      {//element['academicid'].toString()
       // print(element);
       data.add(element);
      }
    });
  return data;
}
}

Future<List> getAddedData(String section) async {
var db=  await openDatabase('assets/sections.db', version: 3);
var cvid=await readprofiles();
print(section);
   List response=await db.rawQuery("SELECT subsection FROM `create-cvprofilesection` WHERE `cvid`= "+cvid+" AND `section` = "+section);

    print("Added data base case - "+response.toString());//contains 2 which is not in database
   List response2=await db.rawQuery("SELECT * FROM "+tablename[section]);
   print("Added data base calls "+response2.toString());//contains all 4
  
    List data=[];
    if(response.isEmpty==true)
    {
      return data;  
    }
    else
    {
    response2.forEach((element){

      if(response[0]['subsection'].contains(element[columnName[section]].toString())==true)//perform response2-response
      {//element['academicid'].toString()
       // print(element);
       data.add(element);
      }
    });
  return data;
    }
}
Future<List> getDefaultSection(String section) async {
var db=  await openDatabase('assets/sections.db', version: 3);
   
   List response=await db.rawQuery("SELECT * FROM "+tablename[section]);
    return response;
}
Future<List> getProfiles(String id, String authkey) async {
var db=  await openDatabase('assets/sections.db', version: 3);
   List response=await db.rawQuery("SELECT * FROM `create-cvprofile`");
    return response;
}

Future<int>deleteFromProfile(String section,String subSection)async{
 var db=await openDatabase("assets/sections.db", version: 1);
 var cvid=await readprofiles();
  List response=await db.rawQuery("SELECT subsection FROM `create-cvprofilesection` WHERE `cvid`= "+cvid+" AND `section` = "+section);
  List res=json.decode(response[0]['subsection']);
  // print("1. "+response[0].toString());
  // print(res);

  print("deleted "+ subSection);
int i=0;
  res.forEach((element){
if(element.toString()==subSection.toString())
{
   print("found");
  i=res.indexOf(element);
}
  });
 res.removeAt(i);
   print("After deleting "+res.toString());
  String sql="UPDATE `create-cvprofilesection` SET subsection=\""+res.toString()+"\" WHERE `cvid`= "+cvid+" AND `section` = "+section;
  print(sql);
 await db.rawUpdate(sql);
}

Future<int>addintoProfile(String section,String subSection)async{
 var db=await openDatabase("assets/sections.db", version: 1);
 var cvid=await readprofiles();
  List response=await db.rawQuery("SELECT subsection FROM `create-cvprofilesection` WHERE `cvid`= "+cvid+" AND `section` = "+section);
  List res=[];
  print(response);
if(response[0]["subsection"].isEmpty==true)
{
res.add(subSection);
}
else
{
  res= json.decode(response[0]['subsection']);
  // print("1. "+response[0].toString());
  // print(res);
  print("added "+ subSection);
    res.add(subSection);
}
  // print(res);
  String sql="UPDATE `create-cvprofilesection` SET subsection=\""+res.toString()+"\" WHERE `cvid`= "+cvid+" AND `section` = "+section;
  print(sql);
 await db.rawUpdate(sql);
}

