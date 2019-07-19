import 'package:cvdragonapp_v1/sharedfetch.dart';
import './maps.dart' as maps;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
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
