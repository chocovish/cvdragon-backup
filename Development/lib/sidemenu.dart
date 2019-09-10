import 'package:cvdragonapp_v1/home.dart';
import 'package:flutter/material.dart';
import './myprofiles.dart';
import './coverletters.dart';
import './institute.dart';
import './publicprofile.dart';
import './MyDesigns.dart';
import './sections.dart';
import './Terms.dart';
import './Privacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './fetch.dart' as fetch;
import './sharedfetch.dart'as sfetch;
import './About.dart';
import './main.dart'as main;
import './vishal/utils.dart';
import './textformfield.dart';
import './pimage.dart';
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
    sfetch.readname().then((String n){
    name=n;
     sfetch.readmail().then((String mail) {
       email=mail;
       setState(() {
        _isLoading=false; 
       });
       });
    });
    
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
                        height: MediaQuery.of(context).size.height/12,
                        width: MediaQuery.of(context).size.width/6)),
              ): Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/sidemenu.png"), fit: BoxFit.cover)),
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
                IconButton(
                 
                  icon: Icon(Icons.home),
                  color: Colors.white,
                  onPressed:(){

                  Navigator.of(context).popUntil((Route route){
                   //  Navigator.pop(context);
            return route.isFirst;
          });},
                ),
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ],
            )),
            Divider(color: Colors.white30),
            ListTile(
              title: Text('My Profiles',
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
              leading: Icon(
                Icons.supervised_user_circle,
                size: MediaQuery.of(context).size.aspectRatio*55.0,
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
                size: MediaQuery.of(context).size.aspectRatio*55.0,
                color: Colors.white,
              ),
              subtitle: Text('View your cover letters',
                  style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CoverLetters()));
              },
            ),
            Divider(color: Colors.white30),
           
            ListTile(
              title: Text('Designs',
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              leading: Icon(
                Icons.supervised_user_circle,
                size: MediaQuery.of(context).size.aspectRatio*55.0,
                color: Colors.white,
              ),
              subtitle: Text('View Your Public Profile',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyDesigns()));
              },
            ),
            Divider(color: Colors.white30),

            ListTile(
              title: Text('Institute',
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
              leading: Icon(
                Icons.home,
                size: MediaQuery.of(context).size.aspectRatio*55.0,
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
                size: MediaQuery.of(context).size.aspectRatio*55.0,
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
              title: Text('Reviews and Ratings',
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
              leading: Icon(
                Icons.rate_review,
                size: MediaQuery.of(context).size.aspectRatio*55.0,
                color: Colors.white,
              ),
              subtitle: Text('Liked cvDragon ? Rate us !',
                  style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              onTap: () {
               
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
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => (About())));
                          },
                          icon: Icon(
                            Icons.info,
                            size: MediaQuery.of(context).size.aspectRatio*40.0,
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
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => (Terms())));
                          },
                          icon: Icon(
                            Icons.accessible,
                            size: MediaQuery.of(context).size.aspectRatio*40.0,
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
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => (Privacy())));
                          },
                          icon:
                              Icon(Icons.apps,size: MediaQuery.of(context).size.aspectRatio*40.0, color: Colors.white),
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
                          onPressed: () {
                            logout(context);
                          },
                          icon: Icon(Icons.link_off,
                              size: MediaQuery.of(context).size.aspectRatio*40.0,
                              color: Colors.white),
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
