import 'dart:io';

import 'package:cvdragonapp_v1/Colors.dart';
import 'package:cvdragonapp_v1/FirstTimeOverlay.dart';
import 'package:cvdragonapp_v1/MyPdfScaffold.dart';
import 'package:cvdragonapp_v1/localdatafetch.dart';
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import './MyDesigns.dart';
import 'package:flutter/services.dart';
import 'package:reflected_mustache/mustache.dart';
import './bottombar_preview.dart';
import './fonts.dart';
import './maps.dart' show tablename;

import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf_render/pdf_render.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

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
    //Navigator.of(context).pop();
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

  showDownloadMSG(BuildContext context) {
    Navigator.pop(context);
    File mfile =
        File("/sdcard/cvdragon/cv_${DateTime.now().toIso8601String()}.pdf");
    mfile.createSync(recursive: true);
    finalpdf.copySync(mfile.path);
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("File has been saved to /sdcard/cvdragon/"),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(

    //   floatingActionButton: FloatingActionButton(
    //     child: Icon(Icons.arrow_downward),
    //     onPressed: showDownloadMSG,
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    //   bottomNavigationBar: Builder(
    //     builder: (_) => FABBottomAppBar(
    //       notchedShape: CircularNotchedRectangle(),
    //       color: Colors.white30,
    //       centerItemText: "Download",
    //       backgroundColor: Color(0xff232882),
    //       selectedColor: Colors.white,
    //       items: [
    //         FABBottomAppBarItem(
    //           iconData: Icons.home,
    //           text: 'Home',
    //         ),
    //         FABBottomAppBarItem(iconData: Icons.edit, text: 'Designs'),
    //         FABBottomAppBarItem(iconData: Icons.edit, text: 'Sections'),
    //         FABBottomAppBarItem(iconData: Icons.more, text: 'More'),
    //       ],
    //       onTabSelected: (int index) {
    //         _selectedTab(index, _);
    //       },
    //     ),
    //   ),
    //   // body:
    //   body: FutureBuilder(
    //       future: loadTemplate(),
    //       builder: (context, snapshot) {
    //         if (!snapshot.hasData) return Center(child: CupertinoActivityIndicator(),);
    //         return PDFViewerScaffold(
    //           path: snapshot.data.path,
    //           primary: true,
    //           appBar: AppBar(title: Text("Preview"),),
    //         );
    //       }),
    // );
    return FutureBuilder(
      future: loadTemplate(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CupertinoActivityIndicator());
        return Stack(
          children: <Widget>[
            Scaffold(
              body: Align(
                alignment: Alignment.center,
                child: Container(
                  height: MediaQuery.of(context).size.width * 1.5,
                  child: PdfDocumentLoader(
                    filePath: finalpdf.path,
                    documentBuilder:
                        (BuildContext context, PdfDocument doc, int pageCount) =>
                            ListView.builder(
                      itemCount: pageCount,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => Container(
                        width: MediaQuery.of(context).size.width,
                        //height: MediaQuery.of(context).size.width * 4 / 3,
                        
                        child: PdfPageView(
                          pdfDocument: doc,
                          pageNumber: index + 1,
                          // calculateSize: (w, h, r) {
                          //   print("$w $h $r");
                          //   return Size(w * scale, h * scale);
                          // },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // bars and all...
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.arrow_downward),
                onPressed: () => showDownloadMSG(context),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: Builder(
                builder: (_) => FABBottomAppBar(
                  notchedShape: CircularNotchedRectangle(),
                  color: Colors.white,
                  centerItemText: "Download",
                  backgroundColor: Color(0xff000000), //Color(0xff232882),
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
              appBar: AppBar(title: Text("Previrew"),backgroundColor: Colors.black,centerTitle: true,),
            ),
            FirstTimeOverlay(),
          ],
        );
        // return MyPdfScaffold(
        //   path: snapshot.data.path,
        //   floatingActionButton: FloatingActionButton(
        //     child: Icon(Icons.arrow_downward),
        //     onPressed: () => showDownloadMSG(context),
        //   ),
        //   floatingActionButtonLocation:
        //       FloatingActionButtonLocation.centerDocked,
        //   bottomNavigationBar: Builder(
        //     builder: (_) => FABBottomAppBar(
        //       notchedShape: CircularNotchedRectangle(),
        //       color: Colors.white,
        //       centerItemText: "Download",
        //       backgroundColor: Color(0xff000000), //Color(0xff232882),
        //       selectedColor: Colors.white,
        //       items: [
        //         FABBottomAppBarItem(
        //           iconData: Icons.home,
        //           text: 'Home',
        //         ),
        //         FABBottomAppBarItem(iconData: Icons.edit, text: 'Designs'),
        //         FABBottomAppBarItem(iconData: Icons.edit, text: 'Sections'),
        //         FABBottomAppBarItem(iconData: Icons.more, text: 'More'),
        //       ],
        //       onTabSelected: (int index) {
        //         _selectedTab(index, _);
        //       },
        //     ),
        //   ),
        //   // body:
        // );
      },
    );
  }
}

File finalpdf;

Future<File> genPDF(String htmldata) async {
  Directory appDir = await getApplicationDocumentsDirectory();
  print(appDir.path);
  var targetPath = appDir.path;
  var targetFileName = "example";

  print("Started creating PDF");
  var strtedtime = DateTime.now();
  var generatedPDF = await FlutterHtmlToPdf.convertFromHtmlContent(
      htmldata, targetPath, targetFileName);

  print("Done creating PDF");
  var diff = DateTime.now().difference(strtedtime);
  print(diff.inMicroseconds);
  return generatedPDF;
}

Future<void> loadTemplate() async {
  Map senddata = await makeSendData();
  String fileText = await rootBundle.loadString('assets/myhtml.html');
  Template template =
      new Template(fileText, htmlEscapeValues: false, lenient: true);

  //RegExp regExp = RegExp("[^0-9a-zA-Z:,\[ \\\;!-+*?&%\$\#@={}()<>\"'\^]");
  String res = template.renderString(senddata);

  finalpdf = await genPDF(res);

  return finalpdf;

  //print(res);
  // var uri = Uri.dataFromString(res, mimeType: "text/html").toString();
  // print("uri is $uri");
  // webViewController.loadUrl(
  //   Uri.dataFromString(res,
  //           mimeType: "text/html", encoding: Latin1Codec(), base64: true)
  //       .toString(),
  // );
}

//...............Helper function... To be moved to another file....

Future<Map> makeSendData() async {
  String resumeid = await generateresumeid();
  var result = await getResumeDetails(resumeid);
  print("got result...: $result");
  print("heyyy");
  List colors = await getColors();
  print("hello");
  var color = colors[result['profileSetting']];
  print("color is $color");
  String sectionstring = result["ProfileSections"];
  List sections = sectionstring
      .substring(2, sectionstring.length - 2)
      .replaceAll(" ", "")
      .split(",");
  print(sections);

  Map m = {};
  String k;
  for (String key in sections) {
    k = tablename[key].replaceFirst("`cv-", "").replaceFirst("`", "");

    if(["basic-info","languages","contact","introduction","education"].contains(k)) m[k] = await getDefaultSection(key);  
    else m[k] = await getAddedData(key);
    
  }
  m['color'] = color;
  //print("m is $m");
  print(m["color"]);
  return m;
}
