 import 'package:http/http.dart' as http;
 import './urlgenerator.dart'as urlgetter;
 import 'dart:convert';
import 'dart:async';
List sending_response;
Map<String,dynamic> sendBasic;
List sendachieve;
 Future<List> getSectionData() async {
  String url = urlgetter.allSectionsBasic("1","1");
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
 Future<Map<String,dynamic>> getbasicInfo(String id,String authkey) async {
  String url = urlgetter.basic(id,authkey);
    var res = await http.get(url);
    sendBasic= json.decode(res.body);
    return sendBasic;
 }

 Future<List> getcvAchievement(String id,String authkey) async {
  String url = urlgetter.cvAchievement(id,authkey);
    var res = await http.get(url);
    sendachieve= json.decode(res.body);
    return sendachieve;
 }

