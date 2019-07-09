import 'package:cvdragonapp_v1/sharedfetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './sidemenu.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PublicProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PublicProfile();
  }
}

class _PublicProfile extends State<PublicProfile> {
  @override
  String url = "https://cvdragon.com/profile/";
  bool isLoading=true;
  initState() {
    get();
  }
  void get() async {
    String id = await readid();
    setState(() {
      url += id;
      isLoading=false;
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build

    return isLoading?DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/cover.png"), fit: BoxFit.fill)),
              child: Center(
                  child: Image(
                      image: AssetImage("assets/logocv.gif"),
                      height: MediaQuery.of(context).size.height/12,
                      width: MediaQuery.of(context).size.width/6)),
            ):Scaffold(
              appBar: TopMenuBar(),
        body: Container(
            child: WebView(
      initialUrl: url,
    )));
  }
}
