
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomBar();
  }
}

class _BottomBar extends State <BottomBar>{

int _selectedIndex=2;
  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
    if(index==4)
    {
    } 
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
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mode_edit),
          title: Text('Designs'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_downward),
          title: Text('Download'),
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          title: Text('Sections'),
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.more),
          title: Text('More'),
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