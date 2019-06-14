import 'package:flutter/material.dart';
import './bottombar_preview.dart';
<<<<<<< HEAD
import './topmenu.dart';
=======

>>>>>>> 6e0d48fe4e29378d725e2c87af7d57db49535c90
class PreviewPane extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
<<<<<<< HEAD
      appBar: TopMenuBar(),
      backgroundColor: Colors.white,
=======
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          onPressed: () {},
          child: Icon(
            Icons.arrow_downward,
            color: Colors.white,
          ),
          elevation: 0.0,
        ),
      backgroundColor: Color(0xff232882),
>>>>>>> 6e0d48fe4e29378d725e2c87af7d57db49535c90
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
      ));
  }
}