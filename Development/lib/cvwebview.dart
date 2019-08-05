import 'dart:convert';
import 'dart:convert' show jsonDecode;

import 'package:cvdragonapp_v1/Colors.dart';
import 'package:cvdragonapp_v1/localdatafetch.dart';
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import './MyDesigns.dart';
import 'package:flutter/services.dart';
import 'package:reflected_mustache/mustache.dart';
import './bottombar_preview.dart';
import './fonts.dart';
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
  void _selectedTab(int index, BuildContext context) {
    if (index == 3)
      showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.font_download),
                  title: new Text('Fonts'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CVFont()));
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.colorize),
                  title: new Text('Colors'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Colorset()));
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.edit),
                  title: new Text('Designs'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyDesigns()));
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.event),
                  title: new Text('Proof Read'),
                  onTap: () {},
                ),
              ],
            );
          });
  }

  showDownloadMSG(){
    showDialog(context: context,builder: (context)=>Dialog(child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text("Download link will be sent to your email!"),
    ),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_downward),
        onPressed: showDownloadMSG,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Builder(
        builder: (_) => FABBottomAppBar(
          notchedShape: CircularNotchedRectangle(),
          color: Colors.white30,
          centerItemText: "Download",
          backgroundColor: Color(0xff232882),
          selectedColor: Colors.white,
          items: [
            FABBottomAppBarItem(
              iconData: Icons.home,
              text: 'Home',
            ),
            FABBottomAppBarItem(iconData: Icons.edit, text: 'Designs'),
            FABBottomAppBarItem(iconData: Icons.edit, text: 'Sections'),
            FABBottomAppBarItem(iconData: Icons.more, text: 'More'),
          ],
          onTabSelected: (int index) {
            _selectedTab(index, _);
          },
        ),
      ),
      body: WebView(
        initialUrl: "",
        onWebViewCreated: (WebViewController c) {
          webViewController = c;
          loadTemplate();
        },
      ),
    );
  }
}

Future<void> loadTemplate() async {
  Map senddata = await makeSendData();
  String fileText = await rootBundle.loadString('assets/myhtml.html');
  Template template =
      new Template(fileText, htmlEscapeValues: false, lenient: true);

  //RegExp regExp = RegExp("[^0-9a-zA-Z:,\[ \\\;!-+*?&%\$\#@={}()<>\"'\^]");
  String res = template.renderString(senddata);
  //print(res);
  var uri = Uri.dataFromString(res, mimeType: "text/html").toString();
  //print("uri is $uri");
  webViewController.loadUrl(
    Uri.dataFromString(res,
            mimeType: "text/html", encoding: Latin1Codec(), base64: true)
        .toString(),
  );
}

//...............Helper function... To be moved to another file....

Future<Map> makeSendData() async {
  String resumeid = await generateresumeid();
  var result = await getResumeDetails(resumeid);
  print("runtime type: ${result.runtimeType}");
  print("got result...: $result");
  String sectionstring = result["ProfileSections"];
  List sections = sectionstring.substring(2,sectionstring.length-2).replaceAll(" ", "").split(",");
  print(sections);

  Map<String, List> m = {};
  String k;
  for (String key in sections) {
    k = tablename[key].replaceFirst("`cv-", "").replaceFirst("`", "");
    m[k] = await getDefaultSection(key);
  }
  print(m["introduction"]);
  return m;
}
