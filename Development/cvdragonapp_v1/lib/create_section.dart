import 'package:flutter/material.dart';
import './topmenu.dart';
import './sidemenu.dart';
import './rightpreviewpane.dart';
import './bottombar_createsection.dart';

class CreateSection extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CreateSection();
  }
}

class _CreateSection extends State <CreateSection> {
  void _selectedTab(int index) {
    setState(() {
      print(index);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: TopMenuBar(),
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
      // bottomNavigationBar: BottomBar(),
      drawer: SideMenu(),
      endDrawer: PreviewPane(),
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
      body: _buildCardView(),
    );
  }
}


Widget _buildCardView() {
  return Container(
    child: ListView(
      padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0, bottom: 30.0),
      children: <Widget>[
        Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(
                  Icons.info,
                  size: 30,
                  color: Color(0xff232882),
                ),
                title: Text(
                  'Basic Info',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'Description ',
                  style: TextStyle(fontSize: 14.0, color: Color(0xff232882)),
                ),
              ),
            ],
          ),
        ),
        Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              Container(
//              title: Text("PROFILE CREATED",
//              style: TextStyle(color: Color(0xff232882))),
//              leading: Container(

              decoration: BoxDecoration(
              shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(10.0),color: Color(0xff232882)),

              child:
                FlatButton(
                onPressed: () => {},
                color: Colors.white,
                padding: EdgeInsets.all(2),
                child: Column( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                Icon(Icons.skip_previous),
                Text("Previous")
                ],
                ),
                ),
              ),

              Container(
//              title: Text("PROFILE CREATED",
//              style: TextStyle(color: Color(0xff232882))),
//              leading: Container(

                decoration: BoxDecoration(
                    shape: BoxShape.rectangle, color: Color(0xff232882)),
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child:
                  FlatButton(
                    onPressed: () => {},
                    color: Colors.white,
                    padding: EdgeInsets.all(2),
                    child: Column( // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.skip_previous),
                        Text("Previous")
                      ],
                    ),
                  ),
                ),
              ),

              Container(
//              title: Text("PROFILE CREATED",
//              style: TextStyle(color: Color(0xff232882))),
//              leading: Container(

                decoration: BoxDecoration(
                    shape: BoxShape.rectangle, color: Color(0xff232882)),
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child:
                  FlatButton(
                    onPressed: () => {},
                    color: Colors.white,
                    padding: EdgeInsets.all(2),
                    child: Column( // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.skip_previous),
                        Text("Previous")
                      ],
                    ),
                  ),
                ),
              ),
              ],
              ),
              ],
              ),
//              ListTile(
//              title: Text("FILL IN DATA",
//              style: TextStyle(color: Color(0xff232882))),
//              leading: Container(
//              decoration: BoxDecoration(
//              shape: BoxShape.circle, color: Color(0xff232882)),
//              child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Icon(
//              Icons.check,
//              size: 30.0,
//              color: Colors.green,
//              )),
//              ),
//              ),
//              ListTile(
//              title: Text("DESIGN SELECTED",
//              style: TextStyle(color: Color(0xff232882))),
//              leading: Container(
//              decoration: BoxDecoration(
//              shape: BoxShape.circle, color: Color(0xff232882)),
//              child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Icon(
//              Icons.check,
//              size: 30.0,
//              color: Colors.green,
//              )),
//              ),
//              ),
//              ListTile(
//              title: Text("SETTINGS CONFIRMED",
//              style: TextStyle(color: Color(0xff232882))),
//              leading: Container(
//              decoration: BoxDecoration(
//              shape: BoxShape.circle, color: Color(0xff232882)),
//              child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Icon(
//              Icons.check,
//              size: 30.0,
//              color: Colors.green,
//              )),
//              ),
//              ),
//              ListTile(
//              title: Text("DOWNLOAD RESUME",
//              style: TextStyle(color: Color(0xff232882))),
//              leading: Container(
//              decoration: BoxDecoration(
//              shape: BoxShape.circle, color: Color(0xff232882)),
//              child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Icon(
//              Icons.close,
//              size: 30.0,
//              color: Colors.red,
//              )
//              ),
//              ),
//              ),
        ),
          ],
        )
        );
//        ],
//        ),
//        );

//      ],
//    ),
//  );

}