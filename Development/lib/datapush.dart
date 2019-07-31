import 'package:cvdragonapp_v1/sharedfetch.dart';
import './maps.dart' as maps;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
var id = ""; //Rohit Agarwal 
var authkey = "";
// var id		 = '15363407469796';
// var authkey	= '042b2de6a38da30c2a96a72d5b80993d';
var cvid	   = '';

Future<String> addData(String refid,String section,Map<String,dynamic> contents) async {
  id=await readid();
  authkey=await readauthKey();
  cvid=await readprofiles();
  Map<String,dynamic> contentsforserverpush=contents;
  contentsforserverpush.remove(maps.columnName[section]);
   String url="https://cvdragon.com/data/app/appCVAddAPI.php?"+"id="+id+"&authkey="+authkey+"&CVID="+cvid+"&sectionID="+section+"&refID="+refid+"&contents=";
    url+=json.encode(contentsforserverpush);
    await writeSyncQueue(url);
     return url;
    // var res = await http.get(url);
    //  return res.body;
 }
Future<String> deleteData(String refid,String section) async {
  id=await readid();
  authkey=await readauthKey();
  cvid=await readprofiles();
   String url="https://cvdragon.com/data/app/appCVDeleteAPI.php?"+"id="+id+"&authkey="+authkey+"&CVID="+cvid+"&sectionID="+section+"&refID="+refid;
    await writeSyncQueue(url);
     return url;
    // var res = await http.get(url);
    //  return res.body;
 }
 
Future<String> editData(String refid,String section,Map<String,dynamic> contents) async {
  id=await readid();
  authkey=await readauthKey();
  cvid=await readprofiles();
    Map<String,dynamic>  contentsforserverpush=contents;
  contentsforserverpush.remove(maps.columnName[section]);
   String url="https://cvdragon.com/data/app/appCVEditAPI.php?"+"id="+id+"&authkey="+authkey+"&CVID="+cvid+"&sectionID="+section+"&refID="+refid+"&contents=";
    url+=json.encode(contentsforserverpush);
     await writeSyncQueue(url);
     return url;
    // var res = await http.get(url);
    //  return res.body;
 }

Future<String> addintoProfile(String refid,String section) async {
  id=await readid();
  authkey=await readauthKey();
  cvid=await readprofiles();
   String url="https://cvdragon.com/data/app/appCVAddDatabaseSubsectionAPI.php?"+"id="+id+"&authkey="+authkey+"&CVID="+cvid+"&sectionID="+section+"&refID="+refid;
     await writeSyncQueue(url);
     return url;
    // var res = await http.get(url);
    //  return res.body;
 }
Future<String> deleteSection(String section) async {
  id=await readid();
  authkey=await readauthKey();
  cvid=await readprofiles();
   String url="https://cvdragon.com/data/app/appCVdeleteSectionAPI.php?"+"id="+id+"&authkey="+authkey+"&CVID="+cvid+"&sectionID="+section;
     await writeSyncQueue(url);
     return url;
    // var res = await http.get(url);
    //  return res.body;
 }


Future<String> addSection(String section) async {
  id=await readid();
  authkey=await readauthKey();
  cvid=await readprofiles();
   String url="https://cvdragon.com/data/app/addCVsectionAPI.php?"+"id="+id+"&authkey="+authkey+"&CVID="+cvid+"&sectionID="+section;
     await writeSyncQueue(url);
     return url;
    // var res = await http.get(url);
    //  return res.body;
 }

Future<String> createProfile(Map<String,dynamic> data,String profilename) async {
  id=await readid();
  authkey=await readauthKey();
  cvid=await readprofiles();
  data["51100"]=[];
  data["51101"]=[];
  data["51102"]=[];
  data["51103"]=[];
  data["51109"]=[];
   String url="https://cvdragon.com/data/app/appCVprofileAPI.php?"+"id="+id+"&authkey="+authkey+"&profileName=";
   url=url+json.encode(profilename)+"&contents=";
   url+=json.encode(data).toString();
   var res=await http.get(url);
   print(res.body);
   await writeprofile(res.body);
   return url;
    // var res = await http.get(url);
    //  return res.body;
 }


