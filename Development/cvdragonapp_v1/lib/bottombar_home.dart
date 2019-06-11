import 'package:cvdragonapp_v1/rightpreviewpane.dart';
import 'package:flutter/material.dart';
import './main.dart';
import './bottombar_home.dart';
class BottomBar extends StatefulWidget{
  final Function pressed;
  BottomBar(this.pressed);
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomBar(pressed);
  }
}

class _BottomBar extends State <BottomBar>{
  final Function pressed;
  _BottomBar(this.pressed);
  int _selectedIndex=2;
  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index; 
    pressed('Home Pressed');
  });
}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  BottomNavigationBar(
      iconSize: 35.0,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.import_contacts),
          title: Text('Knowledge'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mode_edit),
          title: Text('Sections'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.swap_vert),
          title: Text('Profiles'),
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.visibility),
          title: Text('Preview'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xff232882),
      backgroundColor: Colors.white, 
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.black,
       onTap: _onItemTapped,
      
    );
  }

}