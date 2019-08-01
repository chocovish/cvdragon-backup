import 'package:cvdragonapp_v1/vishBottomBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_knowledge.dart';
import './topmenu.dart';
import './sidemenu.dart';
import './home.dart';

class Knowledge extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Knowledge();
  }
}

class _Knowledge extends State<Knowledge> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          showCupertinoDialog(
              context: context,
              builder: (_) => CupertinoAlertDialog(
                title: Text("Stored in Favourites!"),
                // /content: Text("Hello"),
                actions: <Widget>[
                  CupertinoButton(child: Text("Gotcha!"),onPressed: Navigator.of(context).pop,),
                  
                ],
                  ));
        },
        child: Icon(
          Icons.favorite,
          color: Colors.white,
        ),
        elevation: 0.0,
      ),
      appBar: TopMenuBar(),
      // bottomNavigationBar: BottomBar(),
      drawer: SideMenu(),
      body: Center(
          child: Text(
        "Knowledge Centre",
        style: TextStyle(fontSize: 40.0),
      )),

      bottomNavigationBar: MybottomNav(0, "Favourite"),

      // bottomNavigationBar: FABBottomAppBar(
      //   onTabSelected: _selectedTab,
      //   notchedShape: CircularNotchedRectangle(),
      //   color: Colors.white30,
      //   centerItemText: "Home",
      //   backgroundColor: Color(0xff232882),
      //   selectedColor: Colors.white,
      //   items: [
      //     FABBottomAppBarItem(
      //         iconData: Icons.info, text: 'FAQs'),
      //     FABBottomAppBarItem(iconData: Icons.lightbulb_outline, text: 'Tips'),
      //     FABBottomAppBarItem(iconData: Icons.ondemand_video, text: 'Videos'),
      //     FABBottomAppBarItem(iconData: Icons.rss_feed, text: 'News Feed'),
      //   ],
      // ),
    );
  }
}
