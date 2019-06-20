import 'package:cvdragonapp_v1/topmenu.dart';
import 'package:flutter/material.dart';
import './bottombar_preview.dart';
import './cvwebview.dart';
import 'package:photo_view/photo_view.dart';

class PreviewPane extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PreviewPane();
  }
}

class _PreviewPane extends State<PreviewPane>
{

  void _selectedTab(int index) {
    setState(() {
      print(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return  MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          onPressed: (){},
          child: Icon(
            Icons.arrow_downward,
            color: Colors.white,
          ),
          elevation: 0.0,
        ),
      appBar: TopMenuBar(),
      backgroundColor: Colors.black,
      body: CVView(),
      // Container(child: PhotoView(
      //   imageProvider: AssetImage("assets/cv.png"),
      //   minScale: PhotoViewComputedScale.contained * 0.8,
      //   maxScale: PhotoViewComputedScale.covered * 1.8,
      //   customSize: MediaQuery.of(context).size,
      //   initialScale: PhotoViewComputedScale.contained * 1.0,
      // ),
      // ),
      bottomNavigationBar: FABBottomAppBar(notchedShape:CircularNotchedRectangle() ,color: Colors.white30,
        centerItemText: "Download",
        backgroundColor: Color(0xff232882),
        selectedColor: Colors.white,
        items: [
          FABBottomAppBarItem(
              iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.edit, text: 'Designs'),
          FABBottomAppBarItem(iconData: Icons.edit, text: 'Sections'),
          FABBottomAppBarItem(iconData: Icons.more, text: 'More'),
        ],
        onTabSelected: _selectedTab,
      )
      ),
    );
  }
}