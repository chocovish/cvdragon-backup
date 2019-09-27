import 'package:cvdragonapp_v1/FirstTimeOverlay.dart';
import 'package:cvdragonapp_v1/home.dart';

import 'localdatapush.dart';
import 'package:cvdragonapp_v1/maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './topmenu.dart';
import './maps.dart';
import './localdatafetch.dart' as lfetch;

List data = [];

class AddNewSection extends StatefulWidget {
  @override
  _AddNewSection createState() => new _AddNewSection();
}

class _AddNewSection extends State<AddNewSection> {
  List sectobeadded = [];

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
    data = await lfetch.getNotAddedSections();
    setState(() {
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

    return _isLoading
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
                    child: ListView(
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
                            //       Colors.pinkAccent,
                            //       Colors.purple
                            //     ],
                            //   ),
                            //   borderRadius: BorderRadius.only(
                            //     bottomLeft: Radius.circular(90)
                            //   )
                            // ),
                            //     height: MediaQuery.of(context).size.height/4,
                            //     width: MediaQuery.of(context).size.width,
                            //     child: Column(
                            //       children: <Widget>[

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

                            //       ],
                            //     )
                            //   ),

                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 3),
                            ),

                            Container(
                              height: MediaQuery.of(context).size.height / 3,
                              child: new PageView.builder(
                                  itemCount: data.length,
                                  onPageChanged: (value) {
                                    setState(() {
                                      currentpage = value;
                                    });
                                  },
                                  controller: controller,
                                  itemBuilder: (context, index) =>
                                      builder(index)),
                            ),
                            RaisedButton(
                              color: Colors.transparent,
                              child: Text(
                                "Add the Sections",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                print("sectobeadded" + sectobeadded.toString());
                                sectobeadded.forEach((f) async {
                                  await addSection(f.toString());
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePagee()));
                              },
                            )
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
        var item = data[index].toString();

        if (data[index].toString() == '51126') {
          return new Center(
              child: Text(
            "None of the sections left !",
            style: TextStyle(color: Colors.white),
          ));
        } else {
          return Dismissible(
            direction: DismissDirection.vertical,
            key: Key(item),
            onDismissed: (direction) {
              if (direction == DismissDirection.up) {
                // Removes that item the list on swipwe
                setState(() {
                  data.removeAt(index);
                });
                // Shows the information on Snackbar
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(" dismissed"),
                  duration: Duration(milliseconds: 50),
                ));
              }
              if (direction == DismissDirection.down) {
                var secid = "";
                // Removes that item the list on swipwe
                setState(() {
                  secid = data[index].toString();
                  data.removeAt(index);
                  sectobeadded.add(secid.toString());
                });
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Added"),
                  duration: Duration(milliseconds: 50),
                ));
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
                            data[index].toString() +
                            '-01.png'),
                        fit: BoxFit.cover),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.pink, Colors.purple],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        Sections[data[index].toString()].toString(),
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
