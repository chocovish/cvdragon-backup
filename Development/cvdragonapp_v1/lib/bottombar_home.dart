import 'package:cvdragonapp_v1/rightpreviewpane.dart';
import 'package:flutter/material.dart';
import './main.dart';
import './bottombar_home.dart';

class BottomBar extends StatefulWidget{
  //final Function pressed;
 // BottomBar();
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomBar();
  }
}

class _BottomBar extends State <BottomBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomAppBar(

      //iconSize: 35.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //type: BottomNavigationBarType.fixed,

        children: <Widget>[
          IconButton(icon: Icon(Icons.import_contacts), onPressed: () {},),
          IconButton(icon: Icon(Icons.menu), onPressed: () {},),
          IconButton(icon: Icon(Icons.menu), onPressed: () {},),
          IconButton(icon: Icon(Icons.menu), onPressed: () {},),

        ],

      ),
//        BottomNavigationBarItem(
//          icon: Icon(Icons.import_contacts),
//          title: Text('Knowledge'),
//        ),
//        BottomNavigationBarItem(
//          icon: Icon(Icons.mode_edit),
//          title: Text('Sections'),
//        ),
//        BottomNavigationBarItem(
//          icon: Icon(Icons.home),
//          title: Text('Home'),
//        ),
//         BottomNavigationBarItem(
//          icon: Icon(Icons.swap_vert),
//          title: Text('Profiles'),
//        ),
//         BottomNavigationBarItem(
//          icon: Icon(Icons.visibility),
//          title: Text('Preview'),
//        ),
//
//
//      currentIndex: _selectedIndex,
//      selectedItemColor: Color(0xff232882),
//      backgroundColor: Colors.white,
//      showSelectedLabels: true,
//      showUnselectedLabels: true,
//      unselectedItemColor: Colors.black,
//       onTap: _onItemTapped,
//
//    );
    );
  }

}

//return  Scaffold(
//floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//floatingActionButton: FloatingActionButton(
//onPressed: () { },
//tooltip: 'Increment',
//child: Icon(Icons.add),
//elevation: 3
//),
//bottomNavigationBar: BottomAppBar(
//child: Container(
////mainAxisSize: MainAxisSize.max,
//height: 60.0,
////mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//
////notchedShape: CircularNotchedRectangle(),
//color: Colors.blueGrey,
//),
//)
