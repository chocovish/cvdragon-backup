import 'package:cvdragonapp_v1/cvwebview.dart';
import 'package:cvdragonapp_v1/donut.dart';
import 'package:cvdragonapp_v1/localdatafetch.dart';
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:cvdragonapp_v1/myprofiles.dart';
import 'package:cvdragonapp_v1/rightpreviewpane.dart';
import 'package:cvdragonapp_v1/sharedfetch.dart';
import 'package:cvdragonapp_v1/vishBottomBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './topmenu.dart';
import './sidemenu.dart';
import './rightpreviewpane.dart';

String name = "";
var id = '';
var authkey = '';
var selectedprofile='';
List profiles;
int filled=14,total=27;
String pname="";
int val=0;
class HomePagee extends StatefulWidget {
HomePagee()
{
val=1;
}
// HomePagee.fromLayer(int a)
// {
//   val=a;
// }

  @override

  State<StatefulWidget> createState() {
 
    return _HomePagee();
  }
}


class _HomePagee extends State<HomePagee> {
  @override
  bool isLoading = true;
  bool profileselected = false;
  
  void initState() {
    
    super.initState();
    get();
  }

  void get() async{
  print("called HomepAge");
    total=0;
    filled=0;
  //  int val=await efetch.get();
      if(val==1){
         id=await readid();
          authkey=await readauthKey();
        name=await readname();
        selectedprofile=await readprofiles();
         profiles=await getProfiles(id, authkey);
        
        if(selectedprofile!=" ")
        profileselected=true;
        if(profileselected==true)
        {
          for(var element in profiles){
            if(element['cvid'].toString()==selectedprofile){
              pname=element['profileName'].toString();
            }
          }
          total=await getTotalSections(id);
        filled=await getFilledSections(id);
        print("total is"+total.toString());
        print("filled is"+filled.toString());
        }
        else{
          
          total=1;
          filled=1;
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MyProfiles()));
        }

        print("selected profile id is "+selectedprofile);
      
        print(name);
        setState(() {
        print(val);
        print("Homepage false ");
        isLoading = false;
      });
  }
  }

  
// Widget dialogContent(BuildContext context,write,setState)
// {
//   return Center(
//     child: Container(
//       height: MediaQuery.of(context).size.height/3,
//       child: Dialog( 
//         child: Container(padding: EdgeInsets.only(bottom:10),
//                   child: Column(
//                                       children: <Widget>[Container(
//                                         height: MediaQuery.of(context).size.height/6,
//                                                                               child: ListView.builder(
//             physics: BouncingScrollPhysics(),
//             itemCount: profiles == null ? 0 : profiles.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Container(
//                               decoration: BoxDecoration(border: new Border.all(color: Colors.black),),
//                               child: InkWell(
                               
//                                 onTap: ()async{
//                                  // print(profiles[index]['cvid'].toString());
//                                   await write(profiles[index]['cvid'].toString());
//                                    setState((){
//                                      print("done");
                                         
//                                      profileselected=true;
//                                    });
//                                 },
//                                 child: Text(
//                                  profiles[index]['profileName'],
//                                   style: TextStyle(
//                                     fontFamily: "cvFonts",
//                                         color: Colors.black,
//                                         fontSize: 15.0,
//                                         fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             );
//                         },
                      
//           ),
//                                       ),

//                                        Align(alignment: Alignment.bottomCenter,
//                           child: OutlineButton(splashColor: Colors.blue,
//                             onPressed: (){
//                                Navigator.of(context).push(
//               MaterialPageRoute<Null>(builder: (BuildContext context) {
//                 return CardProfilesName();
//               }
//               )
//           );
//                             },
//                             child: Text("Add New Profile"),color: Colors.blue),)
//                                       ],
//                   ),
//         ),
//       ),
//     ),
//   );
// }
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
              onPressed: () async{
              await generateresumeid();
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
            body: _buildCardView(context),
            
            // bottomNavigationBar: FABBottomAppBar(
            //   selectedPage: 3,
            //   onTabSelected: _selectedTab,
            //   notchedShape: CircularNotchedRectangle(),
            //   color: Colors.white30,
            //   centerItemText: "Preview",
            //   backgroundColor: Color(0xff232882),
            //   selectedColor: Colors.white,
            //   items: [
            //     FABBottomAppBarItem(
            //         iconData: Icons.import_contacts, text: 'Knowledge'),
            //     FABBottomAppBarItem(iconData: Icons.edit, text: 'Sections'),
            //     FABBottomAppBarItem(
            //         iconData: Icons.swap_vert, text: 'Profiles'),
            //     FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
            //   ],
            // ),
            bottomNavigationBar: MybottomNav(0),
          );
  }
}
write(String cvid) async
  {
      await writeprofile(cvid);
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                size: 30.0,
                color: Color(0xff232882),
              ),
              title: Text(
              "You have an active subscription: Dummy",
                style: TextStyle(
                    color: Color(0xff232882),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
       Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                size: 30.0,
                color: Color(0xff232882),
              ),
              title: Text(
              "Selected profile - "+pname,
                style: TextStyle(
                    color: Color(0xff232882),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      Container(
        
        child: Donut(filled, total),
      ),
    ],
  ));
}
