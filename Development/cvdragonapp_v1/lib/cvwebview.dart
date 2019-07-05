import 'package:cvdragonapp_v1/localdatafetch.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:reflected_mustache/mustache.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
WebViewController webViewController;
class CVView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CVView();
  }
}

class _CVView extends State<CVView> {
  WebViewController _webViewController;
  String filePath = "assets/cv3.html";
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
    return Scaffold(
      body: Container(
        child: WebView(
          initialUrl: "",
          onWebViewCreated: (c) {
            webViewController = c;
            loadTemplate();
          },
        ),
      ),
    );
  }
}
Future loadTemplate() async {
List addeddata=await getDefaultSection('51109');
print(addeddata);
Map senddata = {
  'name':"Rohit Agarwal",
  'email':"rohit@gmail.com",
  'cobjective':"sasasa",
  'profimg':"",
  'tagline':"sasasa",
  'education': addeddata,
};
 String fileText = await rootBundle.loadString('assets/myhtml.html');
Template template = new Template(fileText);
  String res = template.renderString(senddata);
  print(res);
  webViewController.loadUrl(
    Uri.dataFromString(res, mimeType: "text/html").toString(),
  );
}