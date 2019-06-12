 import 'package:http/http.dart' as http;
 import './urlgenerator.dart'as urlgetter;
 import 'dart:convert';
import 'dart:async';
List sending_response;
 Future<List> getSectionData() async {
  String url = urlgetter.allSectionsBasic("1","1");
    var res = await http.get(url);
    sending_response= json.decode(res.body);
    return sending_response;
 }
Future<http.Response> allDesigns() async {
  String url = urlgetter.allDesigns("1","1");
    var res = await http.get(url);
    return res;
 }

