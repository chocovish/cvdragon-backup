import 'package:cvdragonapp_v1/earlyfetch.dart';
import 'package:cvdragonapp_v1/localdatafetch.dart';
import 'package:flutter/material.dart';
import './topmenu.dart';
import './sidemenu.dart';
import './rightpreviewpane.dart';
import './bottombar_createsection.dart';
import './Custom_dialog.dart';
import './Custom_dialog_KeyPhrases.dart';

import './fetch.dart';
List data;
int index;
String database;
class CreateSection extends StatefulWidget {
 @override
 CreateSection(List d,int i)
 {
data=d;
index=i;
 } 
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
    getFAQ("51100").then((Map<String,dynamic> data){
       faq=data;
       getKeyPhrases("51122").then((List data){
        keyPhrases=data;
           getDatabaseAcademicProject(data[index]['section'].toString()).then((String s){
            setState(() {
                database=s;
             isLoading=false; 
            });
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
   body: _buildChild(context),
  );
 }
}

<<<<<<< HEAD
<<<<<<< HEAD
Widget _buildCardView(BuildContext context) {
  create(){
      
  }
=======
=======
>>>>>>> 7550ad139212faad227d2d0c433a0eace1044a52
Widget _buildChild(BuildContext context) {
 if (data[index]['section'] == "51099") {
  return _buildPositionOfResponsibility(context);
 }
 else if (data[index]['section'] == "51101") {
  return _buildContactDetails(context);
 }
 else
  return _buildAcademicProjects(context);
}


Widget _buildAcademicProjects(BuildContext context) {
<<<<<<< HEAD
>>>>>>> 7550ad139212faad227d2d0c433a0eace1044a52
=======
>>>>>>> 7550ad139212faad227d2d0c433a0eace1044a52
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
            data[index]['sectionName'],
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
       Card(
        elevation: 5.0,
        child: Column(
         children: <Widget>[
          Container(
           padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
             InkWell(
              onTap: () {
//                            showDialog(
//                              context: context,
//                              builder: (BuildContext context) => CustomDialog(
//                                title: "FAQs",
//                                description: faq['faq'].toString(),
//                                buttonText: "Okay",
//                              ),
//                            );
              },
              child: Container(
               height: MediaQuery
                   .of(context)
                   .size
                   .height / 18,
               width: MediaQuery
                   .of(context)
                   .size
                   .width / 4,
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
              onTap: () {
               showDialog(
                context: context,
                builder: (BuildContext context) =>
                    CustomDialogKeyPhrases(
                        "Key Phrases", keyPhrases),
               );
              },
              child: Container(
               height: MediaQuery
                   .of(context)
                   .size
                   .height / 18,
               width: MediaQuery
                   .of(context)
                   .size
                   .width / 4,
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
              onTap: () {
               showDialog(
                context: context,
                builder: (BuildContext context) =>
                    CustomDialog(
                     title: "DataBase",
                     description: "Data Aaoo, Hum Darte Hai Kya ?",
                     buttonText: "Okay",
                    ),
               );
              },
              child: Container(
               height: MediaQuery
                   .of(context)
                   .size
                   .height / 18,
               width: MediaQuery
                   .of(context)
                   .size
                   .width / 4,
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


           child: Column(
            children: <Widget>[
             Container(
                 width: MediaQuery
                     .of(context)
                     .size
                     .width / 1.2,
                 child: TextField(
                  //initialValue: myController.text,
//                  controller: new TextEditingController.fromValue(new TextEditingValue(text: title,selection: new TextSelection.collapsed(offset: title.length-2))),
//                  onChanged: (val) => title = val,
                  //autofocus: true,
                  style: TextStyle(color: Color(0xff232882)),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: Color(0xffff1e50)),
                      labelText: 'Academic Project Title',

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10))),
//                                  validator: (value) {
//                                    if (value.isEmpty) {
//                                      return 'Please enter a name';
//                                    }
//                                  },
                 )),
             Padding(
              padding: EdgeInsets.all(10),
             ),
             Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextField(
//               controller: new TextEditingController.fromValue(new TextEditingValue(text: description,selection: new TextSelection.collapsed(offset: description.length-2))),
//               onChanged: (val) => description = val,
               //autofocus: true,
               // initialValue: myController2.text,
               style: TextStyle(color: Color(0xff232882)),
               scrollPadding: EdgeInsets.all(10.0),
               maxLines: 15,
               textAlign: TextAlign.start,
               decoration: InputDecoration(
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(
                           10)),
                   labelStyle: TextStyle(
                       color: Color(0xffff1e50)),
                   labelText: 'Brief Description about the project'),
//                                validator: (value) {
//                                  if (value.isEmpty) {
//                                    return 'Please enter a name';
//                                  }
//                                },
              ),
             ),
             Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                InkWell(
                 child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 18,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 3,
                  alignment: FractionalOffset.center,
                  decoration: BoxDecoration(
                      color: Color(0xff232882),
                      borderRadius: BorderRadius.circular(
                          30.0),
                      border: new Border.all(
                          color: Colors.white)),
                  child: InkWell(
                   onTap: () {

                   },
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center,
                    children: <Widget>[
                     Container(
                      padding: EdgeInsets.only(
                          right: 5),
                      child: Icon(
                       Icons.add_circle,
                       color: Colors.white,
                       size: MediaQuery
                           .of(context)
                           .size
                           .aspectRatio * 40,
                      ),
                     ),
                     Text(
                      "Add Project",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight
                              .bold),
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
          ),
         ],
        ),
       ),
      ],
     ));
}

Widget _buildPositionOfResponsibility(BuildContext context) {
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
            data[index]['sectionName'],
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
       Card(
        elevation: 5.0,
        child: Column(
         children: <Widget>[
          Container(
           padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
             InkWell(
              onTap: () {
//                            showDialog(
//                              context: context,
//                              builder: (BuildContext context) => CustomDialog(
//                                title: "FAQs",
//                                description: faq['faq'].toString(),
//                                buttonText: "Okay",
//                              ),
//                            );
              },
              child: Container(
               height: MediaQuery
                   .of(context)
                   .size
                   .height / 18,
               width: MediaQuery
                   .of(context)
                   .size
                   .width / 4,
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
              onTap: () {
               showDialog(
                context: context,
                builder: (BuildContext context) =>
                    CustomDialogKeyPhrases(
                        "Key Phrases", keyPhrases),
               );
              },
              child: Container(
               height: MediaQuery
                   .of(context)
                   .size
                   .height / 18,
               width: MediaQuery
                   .of(context)
                   .size
                   .width / 4,
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
              onTap: () {
               showDialog(
                context: context,
                builder: (BuildContext context) =>
                    CustomDialog(
                     title: "DataBase",
                     description: "Data Aaoo, Hum Darte Hai Kya ?",
                     buttonText: "Okay",
                    ),
               );
              },
              child: Container(
               height: MediaQuery
                   .of(context)
                   .size
                   .height / 18,
               width: MediaQuery
                   .of(context)
                   .size
                   .width / 4,
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
<<<<<<< HEAD


=======


>>>>>>> 7550ad139212faad227d2d0c433a0eace1044a52
           child: Column(
            children: <Widget>[
             Container(
                 width: MediaQuery
                     .of(context)
                     .size
                     .width / 1.2,
                 child: TextField(
                  //initialValue: myController.text,
//                  controller: new TextEditingController.fromValue(new TextEditingValue(text: title,selection: new TextSelection.collapsed(offset: title.length-2))),
//                  onChanged: (val) => title = val,
                  //autofocus: true,
                  style: TextStyle(color: Color(0xff232882)),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: Color(0xffff1e50)),
                      labelText: 'Position Heading',

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10))),
//                                  validator: (value) {
//                                    if (value.isEmpty) {
//                                      return 'Please enter a name';
//                                    }
//                                  },
                 )),
             Padding(
              padding: EdgeInsets.all(10),
             ),
             Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextField(
//               controller: new TextEditingController.fromValue(new TextEditingValue(text: description,selection: new TextSelection.collapsed(offset: description.length-2))),
//               onChanged: (val) => description = val,
               //autofocus: true,
               // initialValue: myController2.text,
               style: TextStyle(color: Color(0xff232882)),
               scrollPadding: EdgeInsets.all(10.0),
               maxLines: 15,
               textAlign: TextAlign.start,
               decoration: InputDecoration(
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(
                           10)),
                   labelStyle: TextStyle(
                       color: Color(0xffff1e50)),
                   labelText: 'Brief Description about the position'),
//                                validator: (value) {
//                                  if (value.isEmpty) {
//                                    return 'Please enter a name';
//                                  }
//                                },
              ),
             ),
             Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                InkWell(
                 child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 18,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 3,
                  alignment: FractionalOffset.center,
                  decoration: BoxDecoration(
                      color: Color(0xff232882),
                      borderRadius: BorderRadius.circular(
                          30.0),
                      border: new Border.all(
                          color: Colors.white)),
                  child: InkWell(
                   onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => (CreateSection(data,index))));
                   },
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center,
                    children: <Widget>[
                     Container(
                      padding: EdgeInsets.only(
                          right: 5),
                      child: Icon(
                       Icons.add_circle,
                       color: Colors.white,
                       size: MediaQuery
                           .of(context)
                           .size
                           .aspectRatio * 40,
                      ),
                     ),
                     Text(
                      "Add Position",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight
                              .bold),
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
          ),
         ],
        ),
       ),
      ],
     ));
}

Widget _buildContactDetails(BuildContext context) {
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
            data[index]['sectionName'],
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
       Card(
        elevation: 5.0,
        child: Column(
         children: <Widget>[
          Container(
           padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
             InkWell(
              onTap: () {
//                            showDialog(
//                              context: context,
//                              builder: (BuildContext context) => CustomDialog(
//                                title: "FAQs",
//                                description: faq['faq'].toString(),
//                                buttonText: "Okay",
//                              ),
//                            );
              },
              child: Container(
               height: MediaQuery
                   .of(context)
                   .size
                   .height / 18,
               width: MediaQuery
                   .of(context)
                   .size
                   .width / 4,
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
              onTap: () {
               showDialog(
                context: context,
                builder: (BuildContext context) =>
                    CustomDialogKeyPhrases(
                        "Key Phrases", keyPhrases),
               );
              },
              child: Container(
               height: MediaQuery
                   .of(context)
                   .size
                   .height / 18,
               width: MediaQuery
                   .of(context)
                   .size
                   .width / 4,
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
              onTap: () {
               showDialog(
                context: context,
                builder: (BuildContext context) =>
                    CustomDialog(
                     title: "DataBase",
                     description: "Data Aaoo, Hum Darte Hai Kya ?",
                     buttonText: "Okay",
                    ),
               );
              },
              child: Container(
               height: MediaQuery
                   .of(context)
                   .size
                   .height / 18,
               width: MediaQuery
                   .of(context)
                   .size
                   .width / 4,
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


           child: Column(
            children: <Widget>[
             Container(
                 width: MediaQuery
                     .of(context)
                     .size
                     .width / 1.2,
                 child: TextFormField(
                  //initialValue: myController.text,
//                  controller: new TextEditingController.fromValue(new TextEditingValue(text: title,selection: new TextSelection.collapsed(offset: title.length-2))),
//                  onChanged: (val) => title = val,
                  //autofocus: true,
                  style: TextStyle(color: Color(0xff232882)),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: Color(0xffff1e50)),
                      labelText: 'Email ID',

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10))),
//                                  validator: (value) {
//                                    if (value.isEmpty) {
//                                      return 'Please enter a name';
//                                    }
//                                  },
                 )),
             Padding(
              padding: EdgeInsets.all(10),
             ),
             Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
//               controller: new TextEditingController.fromValue(new TextEditingValue(text: description,selection: new TextSelection.collapsed(offset: description.length-2))),
//               onChanged: (val) => description = val,
               //autofocus: true,
               // initialValue: myController2.text,
               style: TextStyle(color: Color(0xff232882)),
               scrollPadding: EdgeInsets.all(10.0),
               //maxLines: 15,
               textAlign: TextAlign.start,
               decoration: InputDecoration(
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(
                           10)),
                   labelStyle: TextStyle(
                       color: Color(0xffff1e50)),
                   labelText: 'Phone Number'),
                   keyboardType:TextInputType.numberWithOptions(decimal: false),
//                                validator: (value) {
//                                  if (value.isEmpty) {
//                                    return 'Please enter a name';
//                                  }
//                                },
              ),
             ),
             Padding(
              padding: EdgeInsets.all(10),
             ),
             Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
//               controller: new TextEditingController.fromValue(new TextEditingValue(text: description,selection: new TextSelection.collapsed(offset: description.length-2))),
//               onChanged: (val) => description = val,
               //autofocus: true,
               // initialValue: myController2.text,
               style: TextStyle(color: Color(0xff232882)),
               scrollPadding: EdgeInsets.all(10.0),
               //maxLines: 15,
               textAlign: TextAlign.start,
               decoration: InputDecoration(
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(
                           10)),
                   labelStyle: TextStyle(
                       color: Color(0xffff1e50)),
                   labelText: 'Current Location'),
                   keyboardType:TextInputType.numberWithOptions(decimal: false),
//                                validator: (value) {
//                                  if (value.isEmpty) {
//                                    return 'Please enter a name';
//                                  }
//                                },
              ),
             ),
             Padding(
              padding: EdgeInsets.all(10),
             ),
             Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
//               controller: new TextEditingController.fromValue(new TextEditingValue(text: description,selection: new TextSelection.collapsed(offset: description.length-2))),
//               onChanged: (val) => description = val,
               //autofocus: true,
               // initialValue: myController2.text,
               style: TextStyle(color: Color(0xff232882)),
               scrollPadding: EdgeInsets.all(10.0),
               maxLines: 7,
               textAlign: TextAlign.start,
               decoration: InputDecoration(
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(
                           10)),
                   labelStyle: TextStyle(
                       color: Color(0xffff1e50)),
                   labelText: 'Complete Address'),
               keyboardType:TextInputType.numberWithOptions(decimal: false),
//                                validator: (value) {
//                                  if (value.isEmpty) {
//                                    return 'Please enter a name';
//                                  }
//                                },
              ),
<<<<<<< HEAD
<<<<<<< HEAD
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
                    onTap: create,
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
=======
=======
>>>>>>> 7550ad139212faad227d2d0c433a0eace1044a52
             ),

             Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                InkWell(
                 child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 18,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 3,
                  alignment: FractionalOffset.center,
                  decoration: BoxDecoration(
                      color: Color(0xff232882),
                      borderRadius: BorderRadius.circular(
                          30.0),
                      border: new Border.all(
                          color: Colors.white)),
                  child: InkWell(
                   onTap: () {

                   },
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center,
                    children: <Widget>[
                     Container(
                      padding: EdgeInsets.only(
                          right: 5),
                      child: Icon(
                       Icons.add_circle,
                       color: Colors.white,
                       size: MediaQuery
                           .of(context)
                           .size
                           .aspectRatio * 40,
<<<<<<< HEAD
>>>>>>> 7550ad139212faad227d2d0c433a0eace1044a52
=======
>>>>>>> 7550ad139212faad227d2d0c433a0eace1044a52
                      ),
                     ),
                     Text(
                      "Add Details",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight
                              .bold),
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
          ),
         ],
        ),
       ),
      ],
     ));
}
