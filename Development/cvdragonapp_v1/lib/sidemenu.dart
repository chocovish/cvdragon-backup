import 'package:flutter/material.dart';
import './myprofiles.dart';
import './coverletters.dart';
import './institute.dart';
import './publicprofile.dart';
import './sections.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './fetch.dart' as fetch;
import './sharedfetch.dart'as sfetch;
import './main.dart'as main;
String name;
String email;
class SideMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SideMenu();
  }
}

//create a list for the list items
class _SideMenu extends State<SideMenu> {
     bool _isLoading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.get();
  }
  void get(){
    
      name=main.name;
      email=main.email;
      _isLoading=false;
    }
  @override

  Widget build(BuildContext context) {
    //print('called');
    // TODO: implement build
    return Drawer(
      elevation: 2,
      child: _isLoading?Center(child: Center(
                    child: Image(
                        image: AssetImage("assets/logocv.gif"),
                        height: 75.0,
                        width: 75.0)),
              ): Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/cover.png"), fit: BoxFit.fill)),
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            Container(
                child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              accountName: Text(name),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: <Widget>[
                Icon(
                  Icons.edit,
                  color: Colors.white,
                )
              ],
            )),
            Divider(color: Colors.white30),
            ListTile(
              title: Text('My Profiles',
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
              leading: Icon(
                Icons.supervised_user_circle,
                size: 30,
                color: Colors.white,
              ),
              subtitle: Text(
                'Check your Profiles',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyProfiles()));
                });
              },
            ),
            Divider(color: Colors.white30),
            ListTile(
              title: Text('Cover Letters',
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
              leading: Icon(
                Icons.edit,
                size: 30,
                color: Colors.white,
              ),
              subtitle: Text('View your sections',
                  style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Sections()));
              },
            ),
            Divider(color: Colors.white30),
            ListTile(
              title: Text('Sections',
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
              leading: Icon(
                Icons.edit,
                size: 30,
                color: Colors.white,
              ),
              subtitle: Text('View your sections',
                  style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Sections()));
              },
            ),
            Divider(color: Colors.white30),
            ListTile(
              title: Text('Designs',
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              leading: Icon(
                Icons.supervised_user_circle,
                size: 30,
                color: Colors.white,
              ),
              subtitle: Text('View Your Public Profile',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PublicProfile()));
              },
            ),
            Divider(color: Colors.white30),

            ListTile(
              title: Text('Institute',
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
              leading: Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              subtitle: Text('My Institute Details',
                  style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Institutes()));
              },
            ),
            Divider(color: Colors.white30),
            ListTile(
              title: Text('Public Profile',
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              leading: Icon(
                Icons.supervised_user_circle,
                size: 30,
                color: Colors.white,
              ),
              subtitle: Text('View Your Public Profile',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PublicProfile()));
              },
            ),
            Divider(color: Colors.white30),
            Container(
              padding: EdgeInsets.only(top:5.0,bottom: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          padding: EdgeInsets.only(bottom: 15.0),
                          onPressed: () {},
                          icon: Icon(
                            Icons.info,
                            size: 20.0,
                            color: Colors.white,
                          ),
                          tooltip: 'About',
                        ),
                        Text(
                          'About',
                          style: TextStyle(
                              height: 0.0,
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          padding: EdgeInsets.only(bottom: 15.0),
                          onPressed: () {},
                          icon: Icon(
                            Icons.accessible,
                            size: 20.0,
                            color: Colors.white,
                          ),
                          tooltip: 'Terms',
                        ),
                        Text('Terms',
                            style: TextStyle(
                                height: 0.0,
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                                color: Colors.white))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          padding: EdgeInsets.only(bottom: 15.0),
                          onPressed: () {},
                          icon:
                              Icon(Icons.apps, size: 20.0, color: Colors.white),
                          tooltip: 'Privacy',
                        ),
                        Text('Privacy',
                            style: TextStyle(
                                height: 0.0,
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                                color: Colors.white))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          padding: EdgeInsets.only(bottom: 15.0),
                          onPressed: () {},
                          icon: Icon(Icons.link_off,
                              size: 25.0, color: Colors.white),
                          tooltip: 'Logout',
                        ),
                        Text('Logout',
                            style: TextStyle(
                                height: 0.0,
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                                color: Colors.white))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.white30),

          ],
        ),
      ),
    );
  }
}
