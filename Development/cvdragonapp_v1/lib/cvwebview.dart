import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class CVView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CVView();
  }
}

class _CVView extends State<CVView> {
  WebViewController _webViewController;
  String filePath = 'assets/cv3.html';
  @override
  Widget build(BuildContext context) {
    return WebView(
        initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
        // gestureRecognizers: Set().add(Factory<>),
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          _loadHtmlFromAssets();
        });
  }

  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
