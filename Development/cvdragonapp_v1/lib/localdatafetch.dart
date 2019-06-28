import 'package:sqflite/sqflite.dart';
Map<String,String> tablename=
{
"51099":"`cv-POA`",
"51100":"`cv-basic-info`",
"51101":"`cv-contact`",
"51102":"`cv-images`",
"51103":"`cv-introduction`",
"51104":"`cv-work`",
"51105":"`cv-project`",
"51106":"`cv-internship`",
"51107":"`cv-trainings`",
"51108":"`cv-professional`",
"51109":"`cv-education`",
"51110":"`cv-certification`",
"51111":"`cv-technical`",
"51112":"`cv-publications`",
"51113":"`cv-patent`",
"51114":"`cv-achievements`",
"51115":"`cv-awards`",
"51116":"`cv-association`",
"51117":"`cv-volunteer`",
"51118":"`cv-skills`",
"51119":"`cv-interests`",
"51120":"`cv-languages`",
"51121":"`cv-preference`",
"51122":"`cv-academic-projects`",
"51123":"`cv-co-curricular-activities`",
"51125":"`cv-presentations`",
"51126":"`cv-add-section`",
};
Map<String,String> columnName={
"51099":"poaid",
"51100":"id",//to be checked
"51101":"id",
"51102":"imageid",
"51103":"introid",
"51104":"workid",
"51105":"projectid",
"51106":"internshipid",
"51107":"trainingid",
"51108":"professionalid",
"51109":"eduid",
"51110":"certificateid",
"51111":"technicalid",
"51112":"publishid",
"51113":"patentid",
"51114":"achieveid",
"51115":"awardid",
"51116":"associationid",
"51117":"volunteerid",
"51118":"skillid",
"51119":"interestid",
"51120":"langid",
"51121":"prefid",
"51122":"academicid",
"51123":"activityid",
"51125":"activityid",
"51126":"addid",
};
Future<String> getDatabaseAcademicProject(String section) async {
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
      if(response[0]['subsection'].contains(element[columnName[section]].toString())==true)//perform response2-response
      {//element['academicid'].toString()
       // print(element);
       data.add(element);
      }
    });
  return data;
}