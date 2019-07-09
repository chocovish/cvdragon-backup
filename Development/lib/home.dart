import 'package:cvdragonapp_v1/cvwebview.dart';
import 'package:cvdragonapp_v1/donut.dart';
import 'package:cvdragonapp_v1/rightpreviewpane.dart';
import 'package:cvdragonapp_v1/sharedfetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './sidemenu.dart';
import './earlyfetch.dart' as efetch;
import './fetch.dart' as fetch;
import './rightpreviewpane.dart';

String name = "";
var id = '';
var authkey = '';
var selectedprofile='';
List profiles;
Map<String, dynamic> contents = {
  'id': id,
  'projectid': 1,
  'organization': 'jsdn',
  'designation': 'ww',
  'workid': 3,
  'duration': '2 weeks',
  'location': 'howrah',
  'proofRead': 0,
  'title': 'New Project Added by Rohit 2 ',
  'description': 'Description of New Project',
  'status': 1
};

class HomePagee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePagee();
  }
}

bool profileselected = false;
class _HomePagee extends State<HomePagee> {
  @override
  bool isLoading = true;
  
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  void get() async{
  
    
    int val=await efetch.get();
      if(val==1){
         id=await readid();
          authkey=await readauthKey();
        name=await readname();
        selectedprofile=await readprofiles();
        if(selectedprofile!=" ")
        profileselected=true;
        print("selected prfilrd is "+selectedprofile);
       profiles=await fetch.getcvProfiles(id, authkey);
        print(name);
        setState(() {
        print(val);
        isLoading = false;
      });
  }
  }

  void _selectedTab(int index) {
    setState(() {
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? DecoratedBox(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/cover.png"), fit: BoxFit.fill)),
            child: Center(
                child: Image(
                    image: AssetImage("assets/logocv.gif"),
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width / 6)),
          )
         :Scaffold(
            backgroundColor: Colors.black,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.pinkAccent,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return CVView();
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
            body: profileselected?
            _buildCardView(context):
            dialogContent(context, write,setState),
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
                FABBottomAppBarItem(
                    iconData: Icons.swap_vert, text: 'Profiles'),
                FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
              ],
            ),
          );
  }
}
write(String cvid) async
  {
      await writeprofile(cvid);
  }
Widget dialogContent(BuildContext context,write,setState)
{
  return Center(
    child: Container(
      height: MediaQuery.of(context).size.height/3,
      child: Dialog( 
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: profiles == null ? 0 : profiles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(border: new Border.all(color: Colors.black),),
                        child: InkWell(
                         
                          onTap: ()async{
                           // print(profiles[index]['cvid'].toString());
                            await write(profiles[index]['cvid'].toString());
                             setState((){
                               print("done");
                               profileselected=true;
                             });
                          },
                          child: Text(
                           profiles[index]['profileName'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  
        ),
      ),
    ),
  );
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
             ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 30.0,
                color: Color(0xff232882),
              ),
              title: Text(
              name,
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
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          child: DonutPieChart.withSampleData(),
        ),
      ),
//      Card(
//          shape:
//              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//          child: Column(children: <Widget>[
//            ListTile(
//              title: Text("PROFILE CREATED",
//                  style: TextStyle(color: Color(0xff232882))),
//              leading: Container(
//                decoration: BoxDecoration(
//                    shape: BoxShape.circle, color: Color(0xff232882)),
//                child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Icon(
//                      Icons.check,
//                      size: MediaQuery.of(context).size.aspectRatio * 40.0,
//                      color: Colors.green,
//                    )),
//              ),
//            ),
//            ListTile(
//              title: Text("FILL IN DATA",
//                  style: TextStyle(color: Color(0xff232882))),
//              leading: Container(
//                decoration: BoxDecoration(
//                    shape: BoxShape.circle, color: Color(0xff232882)),
//                child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Icon(
//                      Icons.check,
//                      size: MediaQuery.of(context).size.aspectRatio * 40.0,
//                      color: Colors.green,
//                    )),
//              ),
//            ),
//            ListTile(
//              title: Text("DESIGN SELECTED",
//                  style: TextStyle(color: Color(0xff232882))),
//              leading: Container(
//                decoration: BoxDecoration(
//                    shape: BoxShape.circle, color: Color(0xff232882)),
//                child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Icon(
//                      Icons.check,
//                      size: MediaQuery.of(context).size.aspectRatio * 40.0,
//                      color: Colors.green,
//                    )),
//              ),
//            ),
//            ListTile(
//              title: Text("SETTINGS CONFIRMED",
//                  style: TextStyle(color: Color(0xff232882))),
//              leading: Container(
//                decoration: BoxDecoration(
//                    shape: BoxShape.circle, color: Color(0xff232882)),
//                child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Icon(
//                      Icons.check,
//                      size: MediaQuery.of(context).size.aspectRatio * 40.0,
//                      color: Colors.green,
//                    )),
//              ),
//            ),
//            ListTile(
//              title: Text("DOWNLOAD RESUME",
//                  style: TextStyle(color: Color(0xff232882))),
//              leading: Container(
//                decoration: BoxDecoration(
//                    shape: BoxShape.circle, color: Color(0xff232882)),
//                child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Icon(
//                      Icons.close,
//                      size: MediaQuery.of(context).size.aspectRatio * 40.0,
//                      color: Colors.red,
//                    )),
//              ),
//            ),
//          ])),
    ],
  ));
}