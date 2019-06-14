import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './sidemenu.dart';
import './rightpreviewpane.dart';

class HomePagee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePagee();
  }
}

class _HomePagee extends State<HomePagee> {
  void _selectedTab(int index) {
    setState(() {
      print(index);
    });
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
      //bottomNavigationBar: BottomBar(),
      drawer: SideMenu(),
      endDrawer: PreviewPane(),
      body: _buildCardView(),
      bottomNavigationBar: FABBottomAppBar(
        onTabSelected: _selectedTab,
        notchedShape: CircularNotchedRectangle(),
        color: Colors.white30,
        centerItemText: "Home",
        backgroundColor: Color(0xff232882),
        selectedColor: Colors.white,
        items: [
          FABBottomAppBarItem(
              iconData: Icons.import_contacts, text: 'Knowledge'),
          FABBottomAppBarItem(iconData: Icons.edit, text: 'Sections'),
          FABBottomAppBarItem(iconData: Icons.swap_vert, text: 'Profiles'),
          FABBottomAppBarItem(iconData: Icons.visibility, text: 'Preview'),
        ],
      ),
    );
  }
}

Widget _buildCardView() {
  return Scaffold(
    body: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(
              Icons.account_circle,
              size: 30,
            ),
            title: Text(
              'Hello User',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              'Your Subscription: ',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
    ),
  );
}
