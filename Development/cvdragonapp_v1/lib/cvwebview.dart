import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

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
    return WebView(
      initialUrl: "file:///android_asset/flutter_assets/assets/test.html",
      javascriptMode: JavascriptMode.unrestricted,
      debuggingEnabled: true,
    );
  }
}
