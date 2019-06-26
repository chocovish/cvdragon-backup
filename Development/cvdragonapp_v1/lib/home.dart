import 'package:cvdragonapp_v1/designs.dart';
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
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute<Null>(builder: (BuildContext context) {
          return PreviewPane();
        },
        ),
      );
      },
        child: Icon(
          Icons.visibility,
          color: Colors.white,
        ),
        elevation: 0.0,
      ),
      appBar: TopMenuBar(),
      //bottomNavigationBar: BottomBar(),
      drawer: SideMenu(),
      endDrawer: PreviewPane(),
      body: _buildCardView(context),
      bottomNavigationBar: FABBottomAppBar(
        onTabSelected: _selectedTab,
        notchedShape: CircularNotchedRectangle(),
        color: Colors.white30,
        centerItemText: "Preview",
        backgroundColor: Color(0xff232882),
        selectedColor: Colors.white,
        items: [
          FABBottomAppBarItem(
              iconData: Icons.import_contacts, text: 'Knowledge'),
          FABBottomAppBarItem(iconData: Icons.edit, text: 'Sections'),
          FABBottomAppBarItem(iconData: Icons.swap_vert, text: 'Profiles'),
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
        ],
      ),
    );
  }
}

Widget _buildCardView(BuildContext context) {
  return Container(
      child: ListView(
    padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0, bottom: 30.0),
    children: <Widget>[
      Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 30.0,
                color: Color(0xff232882),
              ),
              title: Text(
                'Hello User',
                style: TextStyle(
                    color: Color(0xff232882),
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                'Your Subscription: ',
                style: TextStyle(fontSize: 14.0, color: Color(0xffff1e50)),
              ),
            ),
          ],
        ),
      ),
      Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: SizedBox(
          height: MediaQuery.of(context).size.height/3,
          width: MediaQuery.of(context).size.width,
          child: DonutPieChart.withSampleData(),
        ),
      ),
      Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Column(children: <Widget>[
            ListTile(
              title: Text("PROFILE CREATED",
                  style: TextStyle(color: Color(0xff232882))),
              leading: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff232882)),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check,
                      size: MediaQuery.of(context).size.aspectRatio*40.0,
                      color: Colors.green,
                    )),
              ),
            ),
            ListTile(
              title: Text("FILL IN DATA",
                  style: TextStyle(color: Color(0xff232882))),
              leading: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff232882)),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check,
                      size: MediaQuery.of(context).size.aspectRatio*40.0,
                      color: Colors.green,
                    )),
              ),
            ),
            ListTile(
              title: Text("DESIGN SELECTED",
                  style: TextStyle(color: Color(0xff232882))),
              leading: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff232882)),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check,
                      size: MediaQuery.of(context).size.aspectRatio*40.0,
                      color: Colors.green,
                    )),
              ),
            ),
            ListTile(
              title: Text("SETTINGS CONFIRMED",
                  style: TextStyle(color: Color(0xff232882))),
              leading: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff232882)),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check,
                      size: MediaQuery.of(context).size.aspectRatio*40.0,
                      color: Colors.green,
                    )),
              ),
            ),
            ListTile(
              title: Text("DOWNLOAD RESUME",
                  style: TextStyle(color: Color(0xff232882))),
              leading: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff232882)),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.close,
                      size: MediaQuery.of(context).size.aspectRatio*40.0,
                      color: Colors.red,
                    )),
              ),
            ),
          ])),
    ],
  ));
}
