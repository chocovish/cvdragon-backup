import 'dart:convert';

import 'package:cvdragonapp_v1/localdatafetch.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'package:reflected_mustache/mustache.dart';
import './bottombar_preview.dart';
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
   void  _selectedTab(int index) {
    setState(() {
      print(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FABBottomAppBar(
            notchedShape: CircularNotchedRectangle(),
            color: Colors.white30,
            centerItemText: "Download",
            backgroundColor: Color(0xff232882),
            selectedColor: Colors.white,
            items: [
              FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
              FABBottomAppBarItem(iconData: Icons.edit, text: 'Designs'),
              FABBottomAppBarItem(iconData: Icons.edit, text: 'Sections'),
              FABBottomAppBarItem(iconData: Icons.more, text: 'More'),
            ],
            onTabSelected: _selectedTab,
          ),
          body: WebView(initialUrl: "",onWebViewCreated: (WebViewController c){
        webViewController = c;
        loadTemplate();
      },),
    );
  }
}

Future<void> loadTemplate() async {
  
  Map senddata = await makeSendData();
  String fileText = await rootBundle.loadString('assets/myhtml.html');
  Template template = new Template(fileText, htmlEscapeValues: false,lenient: false);

  //RegExp regExp = RegExp("[^0-9a-zA-Z:,\[ \\\;!-+*?&%\$\#@={}()<>\"'\^]");
  String res = template.renderString(senddata);
  //print(res);
  var uri = Uri.dataFromString(res, mimeType: "text/html").toString();
  //print("uri is $uri");
   webViewController.loadUrl(
     Uri.dataFromString(res, mimeType: "text/html",encoding: Latin1Codec(),base64: true)
     .toString(),
   );
}

//...............Helper function... To be moved to another file....

Future<Map> makeSendData() async {
  Map<String,List> m = {};
  String k;
  for (String key in tablename.keys) {
    k = tablename[key].replaceFirst("`cv-", "").replaceFirst("`", "");
    m[k] = await getDefaultSection(key);
  }
  print(m["introduction"]);
  //print(m);
  return m;
}
