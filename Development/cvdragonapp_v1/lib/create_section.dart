import 'package:flutter/material.dart';
import './topmenu.dart';
import './sidemenu.dart';
import './rightpreviewpane.dart';
import './bottombar_createsection.dart';
import './Custom_dialog.dart';
import './fetch.dart';
class CreateSection extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
  // TODO: implement createState
  return _CreateSection();
 }
}
bool isLoading=true;
 Map<String,dynamic> faq;
 List keyPhrases;
class _CreateSection extends State<CreateSection> {
 @override
 
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  void get(){
    getFAQ("51110").then((Map<String,dynamic> data){
       faq=data;
       getKeyPhrases("academic-projects").then((List data){
        keyPhrases=data;
        setState(() {
         isLoading=false; 
        });
       });
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
  return isLoading? DecoratedBox(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/cover.png"),
                        fit: BoxFit.fill)),
                child: Center(
                    child: Image(
                        image: AssetImage("assets/logocv.gif"),
                        height: 75.0,
                        width: 75.0)),
              ):Scaffold(
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
   body: _buildCardView(context),
  );
 }
}

Widget _buildCardView(BuildContext context) {
 return Container(
     child: ListView(
      padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0, bottom: 30.0),
      children: <Widget>[
       Stack(
        children: <Widget>[
         Container(
          height: 130,
          width: 400,
          decoration: BoxDecoration(color: Colors.yellow),
          child: Container(
           margin: EdgeInsets.only(top: 10.0),
           child: Text(
            'Academic Projects',
            style: TextStyle(color: Color(0xff232882), fontSize: 30.0),
            textAlign: TextAlign.center,
           ),
          ),
         ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Container(
               margin: EdgeInsets.only(top: 70.0),
               child: Image(image: AssetImage('assets/Basic Info.png')))
          ],
         )
        ],
       ),
       Container(
        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
          InkWell(
           onTap: () {
            showDialog(
             context: context,
             builder: (BuildContext context) => CustomDialog(
              title: "FAQs",
              description:
             faq['51100'],
              buttonText: "Okay",
             ),
            );
           },
           child: Container(
            height: 50.0,
            width: 100.0,
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
                color: Color(0xff232882),
                borderRadius: BorderRadius.circular(30.0),
                border: new Border.all(color: Colors.white)),

             child: Text(
              "FAQs",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
             ),
            ),

          ),
          InkWell(
           onTap: (){showDialog(
            context: context,
            builder: (BuildContext context) => CustomDialog(
             title: "Key Phrases",
             description:
             keyPhrases.toString(),
             buttonText: "Okay",
            ),
           );
           },
           child: Container(
            height: 50.0,
            width: 100.0,
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
                color: Color(0xff232882),
                borderRadius: BorderRadius.circular(30.0),
                border: new Border.all(color: Colors.white)),
             child: Text(
              "Key Phrases",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
             ),
            ),

          ),
          InkWell(
           onTap: (){showDialog(
            context: context,
            builder: (BuildContext context) => CustomDialog(
             title: "DataBase",
             description:
             "Data Aaoo, Hum Darte Hai Kya ?",
             buttonText: "Okay",
            ),
           );
           },
           child: Container(
            height: 50.0,
            width: 100.0,
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
                color: Color(0xff232882),
                borderRadius: BorderRadius.circular(30.0),
                border: new Border.all(color: Colors.white)),

             child: Text(
              "Database",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
             ),
            ),

          ),
         ],
        ),
       ),
       Container(
           child: Form(
            child: Column(
             children: <Widget>[
              TextFormField(
               style: TextStyle(color: Color(0xff232882)),
               decoration: InputDecoration(
                   labelStyle: TextStyle(color: Color(0xffff1e50)),
                   labelText: 'Academic Project Title',
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10))),
               validator: (value) {
                if (value.isEmpty) {
                 return 'Please enter a name';
                }
               },
              ),
              Padding(
               padding: EdgeInsets.all(10),
              ),
              TextFormField(
               style: TextStyle(color: Color(0xff232882)),
               scrollPadding: EdgeInsets.all(10.0),
               maxLines: 15,
               textAlign: TextAlign.start,
               decoration: InputDecoration(
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10)),
                   labelStyle: TextStyle(color: Color(0xffff1e50)),
                   labelText: 'Brief Description about the project'),
               validator: (value) {
                if (value.isEmpty) {
                 return 'Please enter a name';
                }
               },
              ),
              Container(
               padding: EdgeInsets.all(10.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 InkWell(
                  child: Container(
                   height: 50.0,
                   width: 150.0,
                   alignment: FractionalOffset.center,
                   decoration: BoxDecoration(
                       color: Color(0xff232882),
                       borderRadius: BorderRadius.circular(30.0),
                       border: new Border.all(color: Colors.white)),
                   child: InkWell(
                    onTap: () {},
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                      Container(
                       padding: EdgeInsets.only(right: 5),
                       child: Icon(
                        Icons.add_circle,
                        color: Colors.white,
                        size: 20,
                       ),
                      ),
                      Text(
                       "Add Section",
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: 15.0,
                           fontWeight: FontWeight.bold),
                      )
                     ],
                    ),
                   ),
                  ),
                 ),
                ],
               ),
              )
             ],
            ),
           ))
      ],
     ));
}