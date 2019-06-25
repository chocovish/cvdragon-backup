import 'package:sqflite/sqflite.dart';
Map<String,String> tablename=
{
  "51122":"`cv-academic-projects`"
};
Future<String> getDatabaseAcademicProject(String section) async {
var db=  await openDatabase('assets/sections.db', version: 3);
   List response=await db.rawQuery("SELECT subsection FROM `create-cvprofilesection` WHERE `cvid`= 4672 AND `section` = "+section);
    List<String> x=response[0]['subsection'];
    List<String> data;
    x.forEach((element){
      data.add((db.rawQuery("SELECT * FROM "+tablename[section]+" WHERE academicid="+element)).toString());
    });
return data.toString();
}