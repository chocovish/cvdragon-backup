import 'package:cvdragonapp_v1/localdatafetch.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'package:reflected_mustache/mustache.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import './maps.dart' show tablename;

WebViewController webViewController;

class CVView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CVView();
  }
}

class _CVView extends State<CVView> {
  @override
  Widget build(BuildContext context) {
    return MyWebView();
  }
}

class MyWebView extends StatefulWidget {
  MyWebView({Key key}) : super(key: key);

  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadTemplate(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return WebviewScaffold(
          url: snapshot.data,
          withZoom: true,
        );
      },
    );
  }
}

Future loadTemplate() async {
  List addeddata = await getDefaultSection('51109');
  List exp = await getDefaultSection('51104');
  List certifications = await getDefaultSection('51110');
  List internships = await getDefaultSection('51106');
  List projects = await getDefaultSection('51122');
  List awards = await getDefaultSection('51115');
  List presentations = await getDefaultSection('51125');
  List technical = await getDefaultSection('51111');
  List achievements = await getDefaultSection('51114');
  List cocurricular = await getDefaultSection('51123');
  List skills = await getDefaultSection('51118');
  List contacts = await getDefaultSection('51101');
  List basicInfo = await getDefaultSection('51100');
  List languages = await getDefaultSection('51120');
  List interests = await getDefaultSection('51119');

  makeSendData();

//print(interests);

  Map senddata = {
    'cobjective': "sasasa",
    'profimg': "",
    'tagline': "sasasa",
    'education': addeddata,
    'exp': exp,
    'certifications': certifications,
    'internships': internships,
    'projects': projects,
    'awards': awards,
    'presentations': presentations,
    'technical': technical,
    'achievements': achievements,
    'cocurricular': cocurricular,
    'skills': skills,
    'contacts': contacts,
    'basicInfo': basicInfo,
    'languages': languages,
    'interests': interests,
  };
  String fileText = await rootBundle.loadString('assets/myhtml.html');
  Template template = new Template(fileText, htmlEscapeValues: false);
  String res = template.renderString(senddata);
  //print(res);
  return Uri.dataFromString(res, mimeType: "text/html").toString();
  webViewController.loadUrl(
    Uri.dataFromString(res, mimeType: "text/html").toString(),
  );
}

//...............Helper function... To be moved to another file....

Future makeSendData() async {
  Map m = {};
  String k;
  for (String key in tablename.keys) {
    k = tablename[key].replaceFirst("`cv-", "").replaceFirst("`", "");
    m[k] = await getDefaultSection(key);
  }
  return m;
}
