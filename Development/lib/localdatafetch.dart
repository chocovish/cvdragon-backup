import 'dart:convert';
import 'package:cvdragonapp_v1/sharedfetch.dart';
import 'package:sqflite/sqflite.dart';
import './maps.dart';
import './datapush.dart' as server;
import 'package:path_provider/path_provider.dart';
Future<List> getDatabase(String section) async {
   var add =await getApplicationDocumentsDirectory();
var db=  await openDatabase(add.path.toString()+'/sections.db', version: 3);
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
   var add =await getApplicationDocumentsDirectory();
var db=  await openDatabase(add.path.toString()+'/sections.db', version: 3);
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

Future<Map<String,dynamic>> getCount(List sections) async {
  var add =await getApplicationDocumentsDirectory();
  var db=  await openDatabase(add.path.toString()+'/sections.db', version: 3);
  var cvid=await readprofiles();
  Map<String,dynamic> response={};
  for(var element in sections)
  {
    var count = await db.rawQuery("SELECT COUNT(*) FROM "+tablename[element['section'].toString()]);
    response[element['section'].toString()]=count[0]["COUNT(*)"].toString();
  }
  return response;
}


Future<List> getProfileSections(String id,String cvid) async {
   var add =await getApplicationDocumentsDirectory();
var db=  await openDatabase(add.path+'/sections.db', version: 3);
   
   List response=await db.rawQuery("SELECT * FROM `create-cvprofilesection` WHERE id="+id+" AND cvid="+cvid);
    return response; 
}

Future<List> getDefaultSection(String section) async {
   var add =await getApplicationDocumentsDirectory();
var db=  await openDatabase(add.path+'/sections.db', version: 3);
   
   List response=await db.rawQuery("SELECT * FROM "+tablename[section]);
    return response;
}
Future<List> getProfiles(String id, String authkey) async {
   var add =await getApplicationDocumentsDirectory();
var db=  await openDatabase(add.path+'/sections.db', version: 3);
   List response=await db.rawQuery("SELECT * FROM `create-cvprofile`");
    return response;
}
Future<List> getSections() async {
   var add =await getApplicationDocumentsDirectory();
var db=  await openDatabase(add.path+'/sections.db', version: 3);
   List response=await db.rawQuery("SELECT * FROM `resource-section`");
    return response;
}

Future<List> getKeyPhrases(String section) async {
   var add =await getApplicationDocumentsDirectory();
var db=  await openDatabase(add.path+'/sections.db', version: 3);
   List response=await db.rawQuery("SELECT * FROM `resource-all` WHERE section ="+section);
    return response;
}

Future<List> getFAQ(String section) async {
   var add =await getApplicationDocumentsDirectory();
var db=  await openDatabase(add.path+'/sections.db', version: 3);
   List response=await db.rawQuery("SELECT * FROM `resource-faqs` WHERE section ="+section);
    return response;
}
Future<List> getTips(String section) async {
   var add =await getApplicationDocumentsDirectory();
var db=  await openDatabase(add.path+'/sections.db', version: 3);
   List response=await db.rawQuery("SELECT * FROM `resource-tips` WHERE section ="+section);
    return response;
}

Future<List> getallDesigns() async {
   var add =await getApplicationDocumentsDirectory();
var db=  await openDatabase(add.path+'/sections.db', version: 3);
   List response=await db.rawQuery("SELECT * FROM `resource-profiledesign` ORDER BY category");
    return response;
}

Future<List> getColors() async {
   var add =await getApplicationDocumentsDirectory();
var db=  await openDatabase(add.path+'/sections.db', version: 3);
   List response=await db.rawQuery("SELECT * FROM `resource-profilesetting`");
    return response;
}

Future<List> getFonts() async {
   var add =await getApplicationDocumentsDirectory();
var db=  await openDatabase(add.path+'/sections.db', version: 3);
   List response=await db.rawQuery("SELECT * FROM `resource-profilefont`");
    return response;
}


Future<int>deleteFromProfile(String section,String subSection)async{
   var add =await getApplicationDocumentsDirectory();
 var db=await openDatabase(add.path+"/sections.db", version: 1);
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
 String refsql="SELECT refID FROM "+tablename[section]+" WHERE "+columnName[section]+"="+subSection.toString();
var resrefid= await db.rawQuery(refsql);
 String deletequery = await server.deleteData(resrefid[0]['refID'].toString(), section);
 print(deletequery);
}

Future<int>addintoProfile(String section,String subSection)async{
   var add =await getApplicationDocumentsDirectory();
 var db=await openDatabase(add.path+"/sections.db", version: 1);
 var cvid=await readprofiles();
  List response=await db.rawQuery("SELECT subsection FROM `create-cvprofilesection` WHERE `cvid`= "+cvid+" AND `section` = "+section);
 List res=[];
  // print("1. "+response[0].toString());
  // print(res);
  if(response[0]['subsection'].isEmpty==true)
    {
      res.add(subSection);
    }
    else
    {
        res=json.decode(response[0]['subsection']);
  print("added "+ subSection);
    res.add(subSection);
    }
  // print(res);
  String sql="UPDATE `create-cvprofilesection` SET subsection=\""+res.toString()+"\" WHERE `cvid`= "+cvid+" AND `section` = "+section;
  print(sql);
 await db.rawUpdate(sql);
}

