import 'dart:ui' as prefix0;
import 'dart:convert';
import 'package:cvdragonapp_v1/localdatapush.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './sidemenu.dart';
import 'dart:async';
import './localdatafetch.dart' as lfetch;
import './sharedfetch.dart' as sfetch;
import 'package:http/http.dart' as http;
import './create_section.dart';
import './edit_section.dart';
import 'package:auto_size_text/auto_size_text.dart';
import './maps.dart'as  maps;

class ProfileSections extends StatefulWidget {
  ProfileSections({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileSections();
  }
}

class _ProfileSections extends State<ProfileSections> {
  String id = "";
  String  authkey = "" ;
  String cvid="";
  bool _isLoading = true;
  Map<String,dynamic> countoftotaldata={};
  List data;

  void get() async{
    id=await sfetch.readid();
    authkey=await sfetch.readauthKey();
    cvid=await sfetch.readprofiles();
    data=await lfetch.getProfileSections(id,cvid);
    countoftotaldata= await lfetch.getCount(data);
      setState(() {
        _isLoading = false;
      });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_circle),
        backgroundColor: Colors.green,
        //label: Text("Add Profile"),
      ),
      appBar: TopMenuBar(),
      // bottomNavigationBar: BottomBar(),
      drawer: SideMenu(),
      body: _isLoading
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
          : Container(
              padding:
                  EdgeInsets.only(top: 4.0, bottom: 4.0, right: 0.0, left: 0.0),
              decoration: BoxDecoration(color: Colors.black),
              child: Scrollbar(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(data[index].toString());
                    if (data[index]['section'].toString()=="51100" || data[index]['section'].toString()=="51101" || data[index]['section'].toString()=="51102" || data[index]['section'].toString()=="51103" || data[index]['section'].toString()=="51109"){
                    return  Card(
                        child: Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        (EditSection(data[index]['section'].toString()))));
                          },
                          child: Stack(
                            children: <Widget>[
                              Image.asset(
                                "assets/ProfileSection/"+data[index]['section'].toString()+"-01.png",
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                //heighaQuery.of(context).size.height,
                              ),
                              Center(child:
                              Container(
                                padding: new EdgeInsets.symmetric(
                                    vertical: 40, horizontal: MediaQuery.of(context).size.width/25),
                                alignment: Alignment.center,               
                                child: Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AutoSizeText(
                                     maps.Sections[data[index]['section'].toString()].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.bold),
                                    ),

                                    
                                    CircleAvatar(backgroundColor: Colors.black,radius: 21,
                                      child: Text("D"),),
                                  ],
                                ),
                              ),
                              ),
                            ],
                          ),
                        ),
                        ),
                      );
                    }
                    
                    
                    else {
                      return
                    Dismissible(
                      direction: DismissDirection.endToStart,
                key: Key(data.toString()),
                onDismissed: (direction) {
                  // Removes that item the list on swipwe
                  setState(() {
                    data.removeAt(index);
                  });
                  // Shows the information on Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("dismissed")));
                },
                background: Container(color: Colors.red),
              
                                          child: Card(
                        child: Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        (EditSection(data[index]['section'].toString()))));
                          },
                          child: Stack(
                            children: <Widget>[
                              Image.asset(
                                "assets/ProfileSection/"+data[index]['section'].toString()+"-01.png",
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                //heighaQuery.of(context).size.height,
                              ),
                              Center(child:
                              Container(
                                padding: new EdgeInsets.symmetric(
                                    vertical: 40, horizontal: MediaQuery.of(context).size.width/25),
                                alignment: Alignment.center,
//                      margin: EdgeInsets.only(top: MediaQuery
//                          .of(context)
//                          .size
//                          .height / 13, left: MediaQuery
//                          .of(context)
//                          .size
//                          .width / 33),
                                //alignment: Alignment.centerLeft,
                                //margin: new EdgeInsets.fromLTRB(12.0, 50.0, 40.0, 50.0),
                                child: Row(
                                 // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AutoSizeText(
                                     maps.Sections[data[index]['section'].toString()].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    CircleAvatar(backgroundColor: Colors.black,radius: 21,
                                      child: Text(countoftotaldata[data[index]['section'].toString()]),),
                                  ],
                                ),
                              ),
                              ),
                            ],
                          ),
                        ),
                        ),
                      ),
                    );
                    }
                    

                

                  },
                ),
              ),
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.get();
  }
}
