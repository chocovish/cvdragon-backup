import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './sidemenu.dart';


class Knowledge extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Knowledge();
  }
}

class _Knowledge extends State <Knowledge> {
  void _selectedTab(int index) {
    setState(() {
      print(index);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {_selectedTab(5);},
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
        elevation: 0.0,
      ),
      appBar: TopMenuBar(),
      // bottomNavigationBar: BottomBar(),
      drawer: SideMenu(),
      body: Center(child: Text("Knowledge Centre",style: TextStyle(fontSize: 40.0),)),
      bottomNavigationBar: FABBottomAppBar(
        onTabSelected: _selectedTab,
        notchedShape: CircularNotchedRectangle(),
        color: Colors.white30,
        centerItemText: "Home",
        backgroundColor: Color(0xff232882),
        selectedColor: Colors.white,
        items: [
          FABBottomAppBarItem(
              iconData: Icons.info, text: 'FAQs'),
          FABBottomAppBarItem(iconData: Icons.lightbulb_outline, text: 'Tips'),
          FABBottomAppBarItem(iconData: Icons.ondemand_video, text: 'Videos'),
          FABBottomAppBarItem(iconData: Icons.rss_feed, text: 'News Feed'),
        ],
      ),
    );
  }
}
