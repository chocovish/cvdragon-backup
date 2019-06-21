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
Future<List> getcvAcademicProjects(String id,String authkey) async {
  String url = urlgetter.cvAcademicProjects(id,authkey);
    var res = await http.get(url);
    sendachieve= json.decode(res.body);
    return sendachieve;
 }


Future<List> getcvSection(String id,String authkey) async {
  String url = urlgetter.cvSection(id,authkey);
    var res = await http.get(url);
    sendachieve= json.decode(res.body);
    return sendachieve;
 }
 Future<List> getcvProfileSection(String id,String authkey) async {
  String url = urlgetter.cvProfileSection(id,authkey);
    var res = await http.get(url);
    sendachieve= json.decode(res.body);
    return sendachieve;
 }
  Future<List> getcvProject(String id,String authkey) async {
  String url = urlgetter.cvProject(id,authkey);
    var res = await http.get(url);
    sendachieve= json.decode(res.body);
    return sendachieve;
 }
 Future<Map<String,dynamic>> getFAQ(String sectionID)async {
  String url = urlgetter.faq(sectionID);
    var res = await http.get(url);
    sendBasic= json.decode(res.body);
    return sendBasic;
 }
  Future<List> getKeyPhrases(String sectionid) async {
  String url = urlgetter.keyPhrases(sectionid);
    var res = await http.get(url);
    sendachieve= json.decode(res.body);
    return sendachieve;
 }
  Future<List> getOtp(String mobileno) async {
  String url = urlgetter.otpgenerator(mobileno);
  print (url);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
 