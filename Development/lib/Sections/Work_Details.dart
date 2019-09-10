import 'package:flutter/material.dart';
import '../Custom_dialog.dart';
import '../Custom_dialog_KeyPhrases.dart';
import '../Custom dialog database.dart';
import '../localdatapush.dart';
import '../edit_section.dart';

Map<String, dynamic> faq;
int index;
List databb3 = [];
List databb1 = [];
String database;
List keyPhrases;
String section;
String secName;

var data = [];
var organization = data[index]['organization'];
var designation = data[index]['designation'];
var dateJoined = data[index]['dateJoined'];
var dateResigned = data[index]['dateResigned'];
var location = data[index]['location'];
var workProfile = data[index]['workProfile'];
var currentWorking = data[index]['currentWorking'];
bool alreadyset = false;

class WorkDetails extends StatefulWidget {
  
  WorkDetails(String d2, String i2, int i1, List d, List k2, List d1, List d3) {
    if(!alreadyset){
      section = d2;
    secName = i2;
    index = i1;
    data = d;
    databb1 = d3;
    databb3 = d1;
    keyPhrases = k2;
    alreadyset = true;
    print("calling inside of condition");
    }
    print("Calling fron constructor");
  }

  @override
  _WorkDetailsState createState() => _WorkDetailsState();
}

class _WorkDetailsState extends State<WorkDetails> {
  var tc = TextEditingController();
  update(BuildContext context, String o, String des, String l, String dj,
      String dl, int cw, String w, Map<String, dynamic> initial) {
    Map<String, dynamic> newdata = {
      "organization": o,
      "designation": des,
      "location": l,
      "dateJoined": dj,
      "dateResigned": dl,
      "currentWorking": cw.toString(),
      "workProfile": w
    };
    updateData(section, newdata, initial).then((int status) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => EditSection(section)));
    });
  }

  String mydate1 = "Select Date";
  String mydate2 = "Select Date";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final speakVal = ValueNotifier(data[index]['currentWorking']);
    ValueNotifier<DateTime> _value = ValueNotifier(data[index][dateJoined]);
    ValueNotifier<DateTime> _value2 = ValueNotifier(data[index][dateResigned]);

    Future _selectDate(String t) async {
      DateTime picked = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(2016),
          lastDate: new DateTime(2030));
      if (picked != null) {
        //mydate1 = "${picked.day}-${picked.month}-${picked.year}";
        if (t == "true") {
          _value.value = picked;
          dateJoined = "${picked.day}-${picked.month}-${picked.year}";
        } else {
          _value2.value = picked;
          dateResigned = "${picked.day}-${picked.month}-${picked.year}";
        }
        //print("Value is $mydate");
      }
    }

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/FormSection/'+section+'-02.png'), fit: BoxFit.fill)),
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.transparent,
                      expandedHeight: 140.0,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text(secName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            )),
                      )),
                ];
              },
              body: Card(
                  elevation: 5.0,
                  child: Container(
                      child: ListView(
                          padding: EdgeInsets.only(bottom: 10.0),
                          children: <Widget>[
                        Column(children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CustomDialog(
                                            title: "FAQs",
                                            description: "You ask, we answer !",
                                            buttonText: "Okay",
                                          ),
                                    );
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    alignment: FractionalOffset.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xff232882),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: new Border.all(
                                            color: Colors.white)),
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
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    alignment: FractionalOffset.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xff232882),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: new Border.all(
                                            color: Colors.white)),
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
                                          CustomDialogDatabase("Database", data,
                                              databb3, section),
                                    );
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    alignment: FractionalOffset.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xff232882),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: new Border.all(
                                            color: Colors.white)),
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
                              padding: EdgeInsets.all(20.0),
                              child: Form(
                                  child: Column(
                                children: <Widget>[
                                    TextField(controller:
                                        new TextEditingController.fromValue(
                                            new TextEditingValue(
                                                text:
                                                    data[index]
                                                            ['organization']
                                                        .toString(),
                                                selection:
                                                    new TextSelection.collapsed(
                                                        offset: designation
                                                            .length))),
                                    onChanged: (val) => designation = val,
                                    
                                    scrollPadding: EdgeInsets.all(10.0),
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        labelStyle:
                                            TextStyle(color: Color(0xffff1e50)),
                                        hintText: 'Current Organization',
                                        labelText: 'Organization'),
                                  ),
                                  
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                  ),
                                  TextField(
                                    controller:
                                        new TextEditingController.fromValue(
                                            new TextEditingValue(
                                                text:
                                                    data[index]
                                                            ['designation']
                                                        .toString(),
                                                selection:
                                                    new TextSelection.collapsed(
                                                        offset: designation
                                                            .length))),
                                    onChanged: (val) => designation = val,
                                    style: TextStyle(color: Color(0xff232882)),
                                    scrollPadding: EdgeInsets.all(10.0),
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        labelStyle:
                                            TextStyle(color: Color(0xffff1e50)),
                                        hintText: 'Current Designation',
                                        labelText: 'Designation'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                  ),
                                  TextField(
                                    controller:
                                        new TextEditingController.fromValue(
                                            new TextEditingValue(
                                                text:
                                                    data[index]
                                                            ['location']
                                                        .toString(),
                                                selection:
                                                    new TextSelection.collapsed(
                                                        offset:
                                                            location.length))),
                                    onChanged: (val) => location = val,
                                    style: TextStyle(color: Color(0xff232882)),
                                    scrollPadding: EdgeInsets.all(10.0),
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        labelStyle:
                                            TextStyle(color: Color(0xffff1e50)),
                                        hintText: 'Current Location',
                                        labelText: 'Location'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10),
                                                    child: Text(
                                                      "Date of Joining",
                                                      textAlign: TextAlign.left,
                                                    )),
                                                InkWell(
                                                    onTap: () {
                                                      _selectDate("true");
                                                    },
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Colors.red),
                                                        height: 40,
                                                        width: 140,
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: <Widget>[
                                                              ValueListenableBuilder(
                                                                valueListenable:
                                                                    _value,
                                                                builder:
                                                                    (context,
                                                                        val,
                                                                        child) {
                                                                  return Text(
                                                                      dateJoined);
                                                                },
                                                              ),
                                                              InkWell(
                                                                child: Icon(Icons
                                                                    .arrow_drop_down_circle),
                                                              ),
                                                            ]))),
                                              ]),
                                        ),
                                        Container(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10),
                                                    child: Text(
                                                        "Date of Leaving")),
                                                InkWell(
                                                    onTap: () {
                                                      speakVal.value==0 ? _selectDate(""):dateResigned="00-00-0000";
                                                    },
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Colors.red),
                                                        height: 40,
                                                        width: 140,
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: <Widget>[
                                                              ValueListenableBuilder(
                                                                valueListenable:
                                                                    _value2,
                                                                builder:
                                                                    (context,
                                                                        val,
                                                                        child) {
                                                                  return Text(
                                                                      dateResigned);
                                                                },
                                                              ),
                                                              InkWell(
                                                                child: Icon(Icons
                                                                    .arrow_drop_down_circle),
                                                              ),
                                                            ])))
                                              ]),
                                        ),
                                      ]),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        ValueListenableBuilder(
                                            valueListenable: speakVal,
                                            builder: (context, val, child) {
                                              return Checkbox(
                                                value: val == 0 ? false : true,
                                                onChanged: (c) {
                                                  
                                                  speakVal.value = c ? 1 : 0;
                                                  setState(() {
                                                    dateResigned = "00-00-0000";
                                                  });
                                                },
                                              );
                                            }),
                                        Text("currentWorking"),
                                      ]),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                  ),
                                  TextField(
                                    controller:
                                        new TextEditingController.fromValue(
                                            new TextEditingValue(
                                                text:
                                                    data[index]
                                                            ['workProfile']
                                                        .toString(),
                                                selection:
                                                    new TextSelection.collapsed(
                                                        offset: workProfile
                                                            .toString()
                                                            .length))),
                                    onChanged: (val) => workProfile = val,
                                    style: TextStyle(color: Color(0xff232882)),
                                    scrollPadding: EdgeInsets.all(10.0),
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        labelStyle:
                                            TextStyle(color: Color(0xffff1e50)),
                                        labelText: 'Brief Description'),
                                    maxLines: 15,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        InkWell(
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                18,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.2,
                                            alignment: FractionalOffset.center,
                                            decoration: BoxDecoration(
                                                color: Color(0xff232882),
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                border: new Border.all(
                                                    color: Colors.white)),
                                            child: InkWell(
                                              onTap: () {
                                                print("hi");
                                                update(
                                                    context,
                                                    organization,
                                                    designation,
                                                    location,
                                                    dateJoined,
                                                    dateResigned,
                                                    currentWorking,
                                                    workProfile,
                                                    data[index]);
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        right: 5),
                                                    child: Icon(
                                                      Icons.add_circle,
                                                      color: Colors.white,
                                                      size:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .aspectRatio *
                                                              40,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Update Section",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )))
                        ])
                      ]))),
            )));
  }
}
