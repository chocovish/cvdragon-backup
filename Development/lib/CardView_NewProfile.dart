import 'package:cvdragonapp_v1/Configure_your_Profile.dart';
import 'package:cvdragonapp_v1/CustomDialogNewProfile.dart';
import 'package:cvdragonapp_v1/FirstTimeOverlay.dart';
import 'package:cvdragonapp_v1/LoadingScreen.dart';
import 'package:cvdragonapp_v1/maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './topmenu.dart';
import './maps.dart';
import './localdatafetch.dart' as lfetch;
import 'dart:convert';

String profileName = "";
List datatobesent = [];

List data = [];
List data2 = [];
List items = [];

class CardProfiles extends StatefulWidget {
  CardProfiles(String p) {
    profileName = p;
    datatobesent = [];
    items = [];
  }
  @override
  _CardProfiles createState() => new _CardProfiles();
}

class _CardProfiles extends State<CardProfiles> {
  TextEditingController con = new TextEditingController();

  Map<String, dynamic> totaldata = {};

  bool _isLoading = true;
  PageController controller;
  int currentpage = 0;
  @override
  initState() {
    super.initState();
    get();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.9,
    );
  }

  void get() async {
    datatobesent = [];
    data = await lfetch.getSections();
    //  data2.forEach((element){
    //   data.add({'sections':element['sections'].toString(),});
    //   });
    // data.add({"Add Profile":"1"});

    for (var element in data) {
      String it = element['section'].toString();
      if (it != "51100" &&
          it != "51101" &&
          it != "51102" &&
          it != "51103" &&
          it != "51109" &&
          it != "51126") {
        items.add(json.decode(it));
        List d1 = await lfetch.getDefaultSection(it);
        totaldata[element['section'].toString()] = d1;
      }
    }

    items.add("q");

    setState(() {
      totaldata = {};
      _isLoading = false;
    });
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        print(index);
        _selectedIndex = index;
      });
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/cys.jpeg'), fit: BoxFit.cover),
      ),
      child: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: TopMenuBar(),
            body: Container(
              child: _isLoading
                  ? LoadingScreen()
                  : ListView(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            //  Container(
                            //     padding: EdgeInsets.only(bottom: 10),
                            //      decoration: BoxDecoration(
                            //   gradient: LinearGradient(
                            //     begin: Alignment.topCenter,
                            //     end: Alignment.bottomCenter,
                            //     colors: [
                            //       Color(0xFFf45d27),
                            //       Color(0xFFf5851f)
                            //     ],
                            //   ),
                            //   borderRadius: BorderRadius.only(
                            //     bottomLeft: Radius.circular(90)
                            //   )
                            // ),
                            //     height: MediaQuery.of(context).size.height/2.5,
                            //     width: MediaQuery.of(context).size.width,
                            //     child: Column(
                            //       children: <Widget>[

                            //         Container(
                            //            padding: EdgeInsets.all(10),
                            //           child:Align(alignment: Alignment.topRight,
                            //           child: Text("Step 2/3",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.bold),),)),
                            //           Padding(padding: EdgeInsets.only(bottom: 5),),
                            //           Align(
                            //       alignment: Alignment.center,
                            //       child: Icon(Icons.person,
                            //         size: 90,
                            //         color: Colors.white,
                            //       ),
                            //     ),

                            //      Align(
                            //       alignment: Alignment.center,
                            //       child: Text("CHOOSE YOUR SECTIONS",
                            //       style: TextStyle(color: Colors.white,
                            //       fontWeight: FontWeight.bold,fontSize: 25),),
                            //     ),
                            //         // Container(
                            //         //   height: MediaQuery.of(context).size.height/3,
                            //         //   child: Center(
                            //         //     child: Text("NAME YOUR PROFILE !",
                            //         //     style: TextStyle(color: Colors.white,
                            //         //     fontWeight: FontWeight.bold,fontSize: 25),))),
                            //       ],
                            //     )

                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 3),
                            ),

                            Container(
                              height: MediaQuery.of(context).size.height / 3,
                              child: new PageView.builder(
                                  itemCount: items.length,
                                  onPageChanged: (value) {
                                    setState(() {
                                      currentpage = value;
                                    });
                                  },
                                  controller: controller,
                                  itemBuilder: (context, index) =>
                                      builder(index)),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          ),
          FirstTimeOverlay(),
        ],
      ),
    );
  }

  builder(int index) {
    return new AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 0.9;
        var item = items[index].toString();

        if (items[index] == 'q') {
          return new Center(
            child: new SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: Curves.easeOut.transform(value) * 500,
              child: new Container(
                decoration: BoxDecoration(
                  //image: DecorationImage(image: AssetImage('assets/ProfileSection/'+data[index].toString()+'-01.png'),fit: BoxFit.cover),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.purple,
                      Colors.pink,
                      // Color(0xFFf45d27),
                      // Color(0xFFf5851f)
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                margin: const EdgeInsets.all(8.0),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      items.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (ConfigureProfile(
                                  profileName, datatobesent))));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.chevron_right,
                                size: 40,
                                color: Colors.white,
                              )),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Continue".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Dismissible(
            direction: DismissDirection.vertical,
            key: Key(item),
            onDismissed: (direction) {
              if (direction == DismissDirection.up) {
                // Removes that item the list on swipwe
                setState(() {
                  items.removeAt(index);
                });
                // Shows the information on Snackbar
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Dismissed"),
                  duration: Duration(milliseconds: 500),
                ));
              }
              if (direction == DismissDirection.down) {
                var secid = "";
                // Removes that item the list on swipwe
                setState(() {
                  secid = items[index].toString();
                  items.removeAt(index);
                  datatobesent.add(secid);
                });
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Added"),
                  duration: Duration(milliseconds: 500),
                ));
                // return showDialog(
                //               context: context,
                //               builder: (BuildContext context) => CustomDialogNewProfile(
                //                 title:Sections[secid],
                //                 description: totaldata[secid],
                //                 buttonText: "Submit",
                //                 sectionId: secid,
                //               ),
                //             );
                // Shows the information on Snackbar

              }
            },
            child: new Center(
              child: new SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                width: Curves.easeOut.transform(value) * 500,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/ProfileSection/' +
                            items[index].toString() +
                            '-01.png'),
                        fit: BoxFit.cover),
                    //  gradient: LinearGradient(
                    //       begin: Alignment.topCenter,
                    //       end: Alignment.bottomCenter,
                    //       colors: [
                    //         Color(0xFFf45d27),
                    //         Color(0xFFf5851f)
                    //       ],
                    //     ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        Sections[items[index].toString()],
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                  //elevation: 15.0,
                  margin: const EdgeInsets.all(8.0),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
