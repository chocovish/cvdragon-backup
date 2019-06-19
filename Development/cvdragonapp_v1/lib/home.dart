import 'package:cvdragonapp_v1/donut.dart';
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:cvdragonapp_v1/rightpreviewpane.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './sidemenu.dart';
import 'package:sqflite/sqflite.dart';
import './fetch.dart' as fetch;
import './rightpreviewpane.dart';
var id = '15363407469796';
var authkey = '042b2de6a38da30c2a96a72d5b80993d';
var cvid = '4763';
var sectionID = '51105';
var data = 'projects';
Map<String, dynamic> contents = {
  'id':id,
  'projectid':1,
  'organization':'jsdn',
  'designation':'ww',
  'workid':3,
  'duration':'2 weeks',
  'location':'howrah',
  'proofRead':0,
  'title': 'New Project Added by Rohit 2 ',
  'description': 'Description of New Project',
  'status':1
};
class HomePagee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePagee();
  }
}

class _HomePagee extends State<HomePagee> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //set();
  }
  void set()
  {
    push().then((int status){
        print(status);
    });
  }
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
