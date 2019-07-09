import 'package:http/http.dart' as http;
import './urlgenerator.dart'as urlgetter;
import 'dart:convert';
import 'dart:async';
List sending_response;
Map<String,dynamic> sendBasic;
 Future<List> getSectionData() async {
  String url = urlgetter.allSectionsBasic("1","1");
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }

 Future<List> getbasicInfo(String id,String authkey) async {
  String url = urlgetter.basic(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }

 Future<List> getcvAchievement(String id,String authkey) async {
  String url = urlgetter.cvAchievement(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
Future<List> getcvAcademicProjects(String id,String authkey) async {
  String url = urlgetter.cvAcademicProjects(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
Future<List> getcvAssociation(String id,String authkey) async {
  String url = urlgetter.cvAssociation(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
Future<List> getcvAwards(String id,String authkey) async {
  String url = urlgetter.cvAwards(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
 Future<List> getcvBasic(String id,String authkey) async {
  String url = urlgetter.cvBasic(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
 Future<List> getcvCertificate(String id,String authkey) async {
  String url = urlgetter.cvCertificate(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
  Future<List> getcvCoCurricular(String id,String authkey) async {
  String url = urlgetter.cvCoCurricular(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
 Future<List> getcvContact(String id,String authkey) async {
  String url = urlgetter.cvContact(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
 Future<List> getcvEducation(String id,String authkey) async {
  String url = urlgetter.cvEducation(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
 Future<List> getcvImages(String id,String authkey) async {
  String url = urlgetter.cvImages(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
  Future<List> getcvInterests(String id,String authkey) async {
  String url = urlgetter.cvInterests(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
   Future<List> getcvInternship(String id,String authkey) async {
  String url = urlgetter.cvInternship(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
  Future<List> getcvIntroduction(String id,String authkey) async {
  String url = urlgetter.cvIntroduction(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
 Future<List> getcvLanguage(String id,String authkey) async {
  String url = urlgetter.cvLanguage(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
 Future<List> getcvPatent(String id,String authkey) async {
  String url = urlgetter.cvPatent(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
Future<List> getcvPOA(String id,String authkey) async {
  String url = urlgetter.cvPOA(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
Future<List> getcvPreference(String id,String authkey) async {
  String url = urlgetter.cvPreference(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
Future<List> getcvPresentations(String id,String authkey) async {
  String url = urlgetter.cvPresentations(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
Future<List> getcvProfessional(String id,String authkey) async {
  String url = urlgetter.cvProfessional(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
Future<List> getcvPublication(String id,String authkey) async {
  String url = urlgetter.cvPublication(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }

Future<List> getcvSkills(String id,String authkey) async {
  String url = urlgetter.cvSkills(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
Future<List> getcvTechnical(String id,String authkey) async {
  String url = urlgetter.cvTechnical(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
 Future<List> getcvTraining(String id,String authkey) async {
  String url = urlgetter.cvTraining(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
Future<List> getcvVolunteer(String id,String authkey) async {
  String url = urlgetter.cvVolunteer(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
Future<List> getcvWork(String id,String authkey) async {
  String url = urlgetter.cvWork(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }

Future<List> getcvSection(String id,String authkey) async {
  String url = urlgetter.cvSection(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
 Future<List> getcvProfileSection(String id,String authkey) async {
  String url = urlgetter.cvProfileSection(id,authkey,"4672");
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
  Future<List> getcvProject(String id,String authkey) async {
  String url = urlgetter.cvProject(id,authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
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
    sending_response= json.decode(res.body);
    return sending_response;
 }
  Future<List> getOtp(String mobileno) async {
  String url = urlgetter.otpgenerator(mobileno);
  print(url);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
  Future<int> getverifyUser(String mobileno) async {
  String url = urlgetter.verifyUserMobile(mobileno);
    var res = await http.get(url);
    print(res.body);
    if(res.body=="null")
     return 0;
     else
     return 1;
    //sending_response= json.decode(res.body);
    //return sending_response;
 }
  Future<int> getverifyUserSocial(String socialid) async {
  String url = urlgetter.verifyUserSocial(socialid);
    var res = await http.get(url);
    print(res.body);
    if(res.body=="null")
     return 0;
     else
     return 1;
    //sending_response= json.decode(res.body);
    //return sending_response;
 }
   Future<Map<String,dynamic>> getUserDetailsSocial(String socialid) async {
  String url = urlgetter.verifyUserSocial(socialid);
    var res = await http.get(url);
    sendBasic= json.decode(res.body);
    return sendBasic ;
    
 }
 Future<Map<String,dynamic>> getUserDetaisMobile(String mobileno) async {
  String url = urlgetter.verifyUserMobile(mobileno);
    var res = await http.get(url);
    sendBasic= json.decode(res.body);
    return sendBasic ;
 }
 Future<List> getcvProfiles(String id,String authkey) async {
  String url = urlgetter.cvProfile(id, authkey);
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response ;
 }
 Future<List> getallDesigns() async {
  String url = urlgetter.allDesigns();
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response ;
 }