import 'package:flutter/material.dart';
import './bottombar_preview.dart';

class PreviewPane extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PreviewPane();
  }
}

class _PreviewPane extends State<PreviewPane>
{
  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      //_lastSelected = 'TAB: $index';
      print(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return  Scaffold(
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
      backgroundColor: Color(0xff232882),
      body: Center(child: Text('Preview Page'),),
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
    );
  }
}