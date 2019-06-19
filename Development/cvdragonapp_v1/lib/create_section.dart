import 'package:flutter/material.dart';
import './topmenu.dart';
import './sidemenu.dart';
import './rightpreviewpane.dart';
import './bottombar_createsection.dart';

class CreateSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CreateSection();
  }
}

class _CreateSection extends State<CreateSection> {
  void _selectedTab(int index) {
    setState(() {
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: TopMenuBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<Null>(
              builder: (BuildContext context) {
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
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
                height: 100,
                width: 500,
                child: Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(
                      "Basic Info",
                      style: TextStyle(
                          color: Color(0xff232882),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.rectangle,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  padding: EdgeInsets.only(top: 50),
                  child: Image(
                    image: AssetImage(
                      "assets/Basic Info.png",
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                child: Container(
                  height: 50.0,
                  width: 100.0,
                  alignment: FractionalOffset.center,
                  decoration: BoxDecoration(
                    color: Color(0xff232882),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: InkWell(
                    onTap: () {
//                    Navigator.push(context, MaterialPageRoute(builder: (context)=>(HomePagee())));
                    },
                    child: Center(
                      child: Text(
                        "FAQs",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  height: 50.0,
                  width: 100.0,
                  alignment: FractionalOffset.center,
                  decoration: BoxDecoration(
                    color: Color(0xff232882),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: InkWell(
                    onTap: () {
//                    Navigator.push(context, MaterialPageRoute(builder: (context)=>(HomePagee())));
                    },
                    child: Center(
                      child: Text(
                        "Key Phrases",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  height: 50.0,
                  width: 100.0,
                  alignment: FractionalOffset.center,
                  decoration: BoxDecoration(
                    color: Color(0xff232882),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: InkWell(
                    onTap: () {
//                    Navigator.push(context, MaterialPageRoute(builder: (context)=>(HomePagee())));
                    },
                    child: Center(
                      child: Text(
                        "Database",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Card(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Full Name",
                        style:
                            TextStyle(fontSize: 22.0, color: Color(0xffff1e50)),
                      ),
                      padding: EdgeInsets.only(left: 10.0, top: 15.0),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Piyush Jindal",
                        style:
                            TextStyle(fontSize: 25.0, color: Color(0xff232880)),
                      ),
                      padding: EdgeInsets.only(
                        left: 10.0,
                        top: 10.0,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Nationality",
                            style: TextStyle(
                                fontSize: 22.0, color: Color(0xffff1e50)),
                          ),
                          padding: EdgeInsets.only(left: 10.0, top: 10.0,bottom: 50.0),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Gender",
                            style: TextStyle(
                                fontSize: 22.0, color: Color(0xffff1e50)),
                          ),
                          padding: EdgeInsets.only(left: 120.0, top: 10.0,bottom: 50.0),
                        ),
                      ],
                    ),

                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
