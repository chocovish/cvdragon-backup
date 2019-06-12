import 'package:flutter/material.dart';
import './myprofiles.dart';
import './coverletters.dart';
import './institute.dart';
import './publicprofile.dart';
import './sections.dart';

class SideMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SideMenu();
  }
}

//create a list for the list items
class _SideMenu extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      elevation: 2,
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/cover.png"),
                        fit: BoxFit.fill)),
                child: Column(
                  children: <Widget>[
                    Container(
                        child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.transparent),
                      accountName: Text("My dragon"),
                      accountEmail: Text("rohitagarwal17800@gmail.com"),
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
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyProfiles()));
                        });
                      },
                    ),
                    Divider(color: Colors.white30),
                    ListTile(
                      title: Text('Sections',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Sections()));
                      },
                    ),
                    Divider(color: Colors.white30),
                    ListTile(
                      title: Text('Cover Letters',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
                      leading: Icon(
                        Icons.crop_rotate,
                        size: 30,
                        color: Colors.white,
                      ),
                      subtitle: Text('Check your Cover Letters',
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(Icons.arrow_forward, color: Colors.white),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CoverLetters()));
                      },
                    ),
                    Divider(color: Colors.white30),
                    ListTile(
                      title: Text('Institute',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Institutes()));
                      },
                    ),
                    Divider(color: Colors.white30),
                    ListTile(
                      title: Text('Public Profile',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PublicProfile()));
                      },
                    ),
                    Divider(color: Colors.white30),
                    Spacer(),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.only(bottom: 5.0),
                        child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              IconButton(
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
                                    height: -1,
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
                                icon: Icon(
                                  Icons.accessible,
                                  size: 20.0,
                                  color: Colors.white,
                                ),
                                tooltip: 'Terms',
                              ),
                              Text('Terms',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      height: -1,
                                      fontSize: 10,
                                      color: Colors.white))
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.apps,
                                    size: 20.0, color: Colors.white),
                                tooltip: 'Privacy',
                              ),
                              Text('Privacy',
                                  style: TextStyle(
                                      height: -1,
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
                                icon: Icon(Icons.link_off,
                                    size: 20.0, color: Colors.white),
                                tooltip: 'Logout',
                              ),
                              Text('Logout',
                                  style: TextStyle(
                                      height: -1,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10,
                                      color: Colors.white))
                            ],
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
