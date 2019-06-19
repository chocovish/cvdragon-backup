import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
var id = "15585932569410"; //Rohit Agarwal 
var authkey = "1d9f7dba5fa41c8065f198f97cd177f9";
// var id		 = '15363407469796';
// var authkey	= '042b2de6a38da30c2a96a72d5b80993d';
var cvid	   = '4672';
var sectionID  = '51105';
var data  	   = 'academic-projects';
Map<String,dynamic> contents_skills={
        'skill':'New Skill Added by Rohit 2 ',
        'description':'Description of New Skill'
    };
    
    Map<String,dynamic> contents_academic_projects={
        'title':'New Project Added by Rohit  ',
        'description':'Description of Project'
    };
    
Future<String> pushData() async {
   String url="https://cvdragon.com/data/appCVAddAPI.php?"+"id="+id+"&authkey="+authkey+"&CVID="+cvid+"&sectionID="+sectionID+"&data="+data+"&contents=";
    url+=json.encode(contents_academic_projects);
     return url;
    // var res = await http.get(url);
    //  return res.body;
 }
 Future<int> displaylocal()async{
    print('This display called');
    await openDatabase('assets/sections.db', version: 3,
        onOpen: (Database db) async {
      print(await db.rawQuery("SELECT * FROM `create-cvprofilesection`"));
      // DataPush();
      print('execute');
      return 1;
    });
 }
class DataPush{
  DataPush(){
    print('Server Data Pushed called');
    pushData().then((String message){
      print(message);
    });
    displaylocal().then((int status) {
      print(status); 
    });
  }
}