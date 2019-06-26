import 'package:sqflite/sqflite.dart';
Map<String,String> tablename=
{
  "51122":"`cv-academic-projects`"
};
Future<String> getDatabaseAcademicProject(String section) async {
var db=  await openDatabase('assets/sections.db', version: 3);
   List response=await db.rawQuery("SELECT subsection FROM `create-cvprofilesection` WHERE `cvid`= 4672 AND `section` = "+section);
    print(response);//contains 2 which is not in database
   List response2=await db.rawQuery("SELECT * FROM "+tablename[section]);
    print(response2);//contains all 4
    List data=[];
    response2.forEach((element){
      if(response[0]['subsection'].contains(element['academicid'].toString())==false)//perform response2-response
      {//element['academicid'].toString()
       // print(element);
       data.add(element);
      }
    });
  return data.toString();
}
Future<List> getAddedAcademicProject(String section) async {
var db=  await openDatabase('assets/sections.db', version: 3);
   List response=await db.rawQuery("SELECT subsection FROM `create-cvprofilesection` WHERE `cvid`= 4672 AND `section` = "+section);
    //print(response);//contains 2 which is not in database
   List response2=await db.rawQuery("SELECT * FROM "+tablename[section]);
   // print(response2);//contains all 4
    List data=[];
    response2.forEach((element){
      if(response[0]['subsection'].contains(element['academicid'].toString())==true)//perform response2-response
      {//element['academicid'].toString()
       // print(element);
       data.add(element);
      }
    });
  return data;
}