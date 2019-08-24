import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './topmenu.dart';
import './sidemenu.dart';
import './localdatafetch.dart' as lfetch;

import './sharedfetch.dart' as sfetch;
import './Add_New_Section.dart';
import './edit_section.dart';

import 'package:auto_size_text/auto_size_text.dart';
import './maps.dart' as maps;

class ProfileSections extends StatefulWidget {
  ProfileSections({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ProfileSections();
  }
}

class _ProfileSections extends State<ProfileSections> {
  String id = "";
  String authkey = "";
  String cvid = "";
  bool _isLoading = true;
  Map<String, dynamic> countoftotaldata = {};
  List data2 = [];
  List data = [];
  //List data3 = [];

  Future getSections() async {
    print("----------withing getSections() function-------------------");
    data2 = [];
    data = [];
    //data3 = [];
    id = await sfetch.readid();
    authkey = await sfetch.readauthKey();
    cvid = await sfetch.readprofiles();
    data2 = await lfetch.getProfileSections(id, cvid);
    countoftotaldata = await lfetch.getCount(data2);
    
    data2.forEach((element) {
      data.add(json.decode(element['section'].toString()));
    });
    data.add("Add a New Section");
    //data3 = data2;
    //for (var i in data) data3.remove(i);

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
      body: _isLoading ? Center(child: CupertinoActivityIndicator()) : Container(
                padding: EdgeInsets.only(
                    top: 4.0, bottom: 4.0, right: 0.0, left: 0.0),
                decoration: BoxDecoration(color: Colors.black),
                child: Scrollbar(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: data == null ? 0 : data.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (data[index].toString() == "51126") {
                        print("New Section loop executed");
                      }

                      //     child: Container(
                      //       height: 120,
                      //       width: MediaQuery.of(context).size.width,
                      //     child: InkWell(
                      //       onTap: () {
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) =>
                      //                     (CardProfiles())));
                      //       },
                      //       child: Stack(
                      //         children: <Widget>[
                      //           Image.asset(
                      //             "51125-01.png",
                      //             fit: BoxFit.cover,
                      //             width: MediaQuery.of(context).size.width,
                      //             //heighaQuery.of(context).size.height,
                      //           ),
                      //           Center(child:
                      //           Container(
                      //             padding: new EdgeInsets.symmetric(
                      //                 vertical: 40, horizontal: MediaQuery.of(context).size.width/25),
                      //             alignment: Alignment.center,
                      //             child: Row(

                      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //               children: <Widget>[
                      //                 AutoSizeText(
                      //                 "Add a Section",
                      //                   style: TextStyle(
                      //                       color: Colors.white,
                      //                       fontSize: 20,
                      //                       letterSpacing: 0.5,
                      //                       fontWeight: FontWeight.bold),
                      //                 ),

                      //                 // CircleAvatar(backgroundColor: Colors.black,radius: 21,
                      //                 //   child: Text("D"),),
                      //               ],
                      //             ),
                      //           ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     ),
                      //   );

                      //  }
                      else if (data[index].toString() == "Add a New Section") {
                        return Card(
                          child: Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            (AddNewSection(data))));
                              },
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/ProfileSection/51102-01.png",
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    //heighaQuery.of(context).size.height,
                                  ),
                                  Center(
                                    child: Container(
                                      padding: new EdgeInsets.symmetric(
                                          vertical: 40,
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              25),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          AutoSizeText(
                                            "Add a New Section",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.bold),
                                          ),

                                          // CircleAvatar(backgroundColor: Colors.black,radius: 21,
                                          //   child: Text("D"),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else if (data[index].toString() == "51100" ||
                          data[index].toString() == "51101" ||
                          data[index].toString() == "51102" ||
                          data[index].toString() == "51103" ||
                          data[index].toString() == "51109") {
                        return Card(
                          child: Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => (EditSection(
                                            data[index].toString()))));
                              },
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/ProfileSection/" +
                                        data[index].toString() +
                                        "-01.png",
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    //heighaQuery.of(context).size.height,
                                  ),
                                  Center(
                                    child: Container(
                                      padding: new EdgeInsets.symmetric(
                                          vertical: 40,
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              25),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          AutoSizeText(
                                            maps.Sections[
                                                    data[index].toString()]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.black,
                                            radius: 21,
                                            child: Text("D"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Card(
                          child: Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => (EditSection(
                                            data[index].toString()))));
                              },
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/ProfileSection/" +
                                        data[index].toString() +
                                        "-01.png",
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    //heighaQuery.of(context).size.height,
                                  ),
                                  Center(
                                    child: Container(
                                      padding: new EdgeInsets.symmetric(
                                          vertical: 40,
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              25),
                                      alignment: Alignment.center,
                                      child: Row(
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          AutoSizeText(
                                            maps.Sections[
                                                    data[index].toString()]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.black,
                                            radius: 21,
                                            child: Text(countoftotaldata[
                                                data[index].toString()]),
                                          ),
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
                      return null;
                    },
                  ),
                ),
              ),
      
    );
  }

  @override
  void initState() {
    super.initState();
    this.getSections();
  }
}
