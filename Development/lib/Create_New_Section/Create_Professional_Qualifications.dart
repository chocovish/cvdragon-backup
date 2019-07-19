import 'package:cvdragonapp_v1/edit_section.dart';
import 'package:flutter/material.dart';
import '../localdatapush.dart'as lpush;

Map<String, dynamic> faq;
int index3;
String database;
String y;

String section;
String secName;
var data = [];
var course ='';
var organization = '';
 var university = '';
var year = '';
 var grade = '';
  var score = '';


class CreateProfessionalQualifications extends StatelessWidget {
  CreateProfessionalQualifications(String d2, String i2, int i1, List d) {
     section = d2;
    secName = i2;
    index3 = i1;
    data = d;
  }

  
  create(BuildContext context,String c, String o, String u, String y, String g, String s) {
    Map<String,dynamic> datatobecreated={
       "course":c,
    "organization":o,
    "university":u,
    "year":y,
    "grade":g,
    "score":s
    };
   lpush.pushData(section,datatobecreated).then((int status) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> EditSection(section)));

    });
  }

  @override
  Widget build(BuildContext context) {
    return
                                Form(
                                  child: Column(
                                    children: <Widget>[
                                      TextField(
                                        controller: new TextEditingController(),
                                  onChanged: (val) => course = val,
                                        style: TextStyle(color: Color(0xff232882)),
                                        decoration: InputDecoration(
                                            labelStyle:
                                            TextStyle(color: Color(0xffff1e50)),
                                            labelText: 'Name of Course',
                                            hintText: "Ex - MBA",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(10))),
                                        // validator: (value) {
                                        //   if (value.isEmpty) {
                                        //     return 'Please enter the name of the course';
                                        //   }
                                        // },
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                      ),
                                      TextField(
                                        controller: new TextEditingController(),
                                  onChanged: (val) => organization = val,
                                        style: TextStyle(color: Color(0xff232882)),
                                        scrollPadding: EdgeInsets.all(10.0),
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            labelStyle:
                                            TextStyle(color: Color(0xffff1e50)),
                                            labelText: 'Name of the Institute',
                                            hintText: "Ex - IIM Rohtak"),
                                        // validator: (value) {
                                        //   if (value.isEmpty) {
                                        //     return 'Please enter the name of the institute';
                                        //   }
                                        // },
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                      ),
                                      TextField(
                                        controller: new TextEditingController(),
                                  onChanged: (val) => university = val,
                                        style: TextStyle(color: Color(0xff232882)),
                                        scrollPadding: EdgeInsets.all(10.0),
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            labelStyle:
                                            TextStyle(color: Color(0xffff1e50)),
                                            labelText:
                                            'University / Affiliation / Autonomous',
                                            hintText:
                                            "Ex - Affiliated to Anna University"),
                                        // validator: (value) {
                                        //   if (value.isEmpty) {
                                        //     return 'Please enter the Institute Status';
                                        //   }
                                        // },
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                      ),
                                      TextField(
                                        controller: new TextEditingController(),
                                  onChanged: (val) => year = val,
                                        style: TextStyle(color: Color(0xff232882)),
                                        scrollPadding: EdgeInsets.all(10.0),
                                        keyboardType: TextInputType.datetime,
                                        maxLength: 4,
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                            counterText: '',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            labelStyle:
                                            TextStyle(color: Color(0xffff1e50)),
                                            labelText: 'Year',
                                            hintText: "yyyy"),
                                        // validator: (value) {
                                        //   if (value.isEmpty) {
                                        //     return 'Please enter Internship Location';
                                        //   }
                                        // },
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                      ),
                                      TextField(
                                        controller: new TextEditingController(),
                                  onChanged: (val) => grade = val,
                                        style: TextStyle(color: Color(0xff232882)),
                                        scrollPadding: EdgeInsets.all(10.0),
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            labelStyle:
                                            TextStyle(color: Color(0xffff1e50)),
                                            labelText: 'Grade',
                                            hintText:
                                            "Percentage / CGPA / Division / Rank"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                      ),
                                      TextField(
                                        controller: new TextEditingController(),
                                  onChanged: (val) => score = val,
                                        style: TextStyle(color: Color(0xff232882)),
                                        scrollPadding: EdgeInsets.all(10.0),
                                        keyboardType: TextInputType.number,
                                        maxLength: 5,
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                          counterText: '',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          labelStyle:
                                          TextStyle(color: Color(0xffff1e50)),
                                          labelText: 'Score',
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(7),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
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
                                                    2.5,
                                                alignment: FractionalOffset.center,
                                                decoration: BoxDecoration(
                                                    color: Color(0xff232882),
                                                    borderRadius:
                                                    BorderRadius.circular(30.0),
                                                    border: new Border.all(
                                                        color: Colors.white)),
                                                child: InkWell(
                                                  onTap: () {
                                                    create(context, course, organization, university, year, grade, score);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Container(
                                                        padding:
                                                        EdgeInsets.only(right: 5),
                                                        child: Icon(
                                                          Icons.add_circle,
                                                          color: Colors.white,
                                                          size: 20,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Add Qualification",
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
                                      )
                                    ],
                                  ),
                                );

  }
}