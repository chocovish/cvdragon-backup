import 'package:flutter/material.dart';
import '../Custom_dialog.dart';
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
var institute = data[index]['institute'];
var year = data[index]['year'].toString();
var university = data[index]['university'];
var location = data[index]['location'];
var specialization = data[index]['specialization'];
var grade = data[index]['grade'];
var score = data[index]['score'];
var category = data[index]['category'];


class EducationalBackground extends StatelessWidget {
  EducationalBackground(String d2, String i2, int i1, List d, List k2, List d1, List d3) {
    section = d2;
    secName = i2;
    index = i1;
    data = d;
    databb1 = d3;
    databb3 = d1;
    keyPhrases = k2;
  }

update(BuildContext context,String t, String u, String l, String sp, String y, String g, String s, String c, Map<String, dynamic> initial) {
   Map <String,dynamic> newdata={
  "institute":t,
  "university":u,
  "location":l,
  "specialization":sp,
  "year":y,
  "grade":g,
  "score":s,
  "category":c
};
    updateData(section,newdata,initial).then((int status) {

       Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> EditSection(section)));

    });
  }

  @override
  Widget build(BuildContext context) {
   
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
                          //Image.asset('assets/final structure-02.png'),
                        )),
                  ];
                },
                body: Card(
                    elevation: 5.0,
                    child: Container(
                        child: ListView(
                          padding: EdgeInsets.only(bottom: 30.0),
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                // Container(
                                //   padding: EdgeInsets.only(top: 5.0, bottom: 20.0),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //     children: <Widget>[
                                //       InkWell(
                                //         onTap: () {
                                //           showDialog(
                                //             context: context,
                                //             builder: (BuildContext context) =>
                                //                 CustomDialog(
                                //                   title: "FAQs",
                                //                   description: "You ask, we answer !",
                                //                   buttonText: "Okay",
                                //                 ),
                                //           );
                                //         },
                                //         child: Container(
                                //           height:
                                //           MediaQuery.of(context).size.height / 18,
                                //           width:
                                //           MediaQuery.of(context).size.width / 4,
                                //           alignment: FractionalOffset.center,
                                //           decoration: BoxDecoration(
                                //               color: Color(0xff232882),
                                //               borderRadius:
                                //               BorderRadius.circular(30.0),
                                //               border: new Border.all(
                                //                   color: Colors.white)),
                                //           child: Text(
                                //             "FAQs",
                                //             style: TextStyle(
                                //                 color: Colors.white,
                                //                 fontSize: 15.0,
                                //                 fontWeight: FontWeight.bold),
                                //           ),
                                //         ),
                                //       ),
                                //       InkWell(
                                //         onTap: () {
                                //           showDialog(
                                //             context: context,
                                //             builder: (BuildContext context) =>
                                //                 CustomDialogKeyPhrases(
                                //                     "Key Phrases", keyPhrases),
                                //           );
                                //         },
                                //         child: Container(
                                //           height:
                                //           MediaQuery.of(context).size.height / 18,
                                //           width:
                                //           MediaQuery.of(context).size.width / 4,
                                //           alignment: FractionalOffset.center,
                                //           decoration: BoxDecoration(
                                //               color: Color(0xff232882),
                                //               borderRadius:
                                //               BorderRadius.circular(30.0),
                                //               border: new Border.all(
                                //                   color: Colors.white)),
                                //           child: Text(
                                //             "Key Phrases",
                                //             style: TextStyle(
                                //                 color: Colors.white,
                                //                 fontSize: 15.0,
                                //                 fontWeight: FontWeight.bold),
                                //           ),
                                //         ),
                                //       ),
                                //       InkWell(
                                //         onTap: () {
                                //           showDialog(
                                //             context: context,
                                //             builder: (BuildContext context) =>
                                //               CustomDialogDatabase("Database",data, databb3,section
                                //                 ),
                                //           );
                                //         },
                                //         child: Container(
                                //           height:
                                //           MediaQuery.of(context).size.height / 18,
                                //           width:
                                //           MediaQuery.of(context).size.width / 4,
                                //           alignment: FractionalOffset.center,
                                //           decoration: BoxDecoration(
                                //               color: Color(0xff232882),
                                //               borderRadius:
                                //               BorderRadius.circular(30.0),
                                //               border: new Border.all(
                                //                   color: Colors.white)),
                                //           child: Text(
                                //             "Database",
                                //             style: TextStyle(
                                //                 color: Colors.white,
                                //                 fontSize: 15.0,
                                //                 fontWeight: FontWeight.bold),
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                Container(
                                    padding: EdgeInsets.all(20.0),
                                    child: Form(
                                      child: Column(
                                        children: <Widget>[
                                          
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(data[index]['category'],style: TextStyle(fontSize: 25),)),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                                            controller: new TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: data[index]['institute'].toString(),
                                                    selection: new TextSelection.collapsed(
                                                        offset: institute.length))),
                                            onChanged: (val) => institute = val,
                                            style:
                                            TextStyle(color: Color(0xff232882)),
                                            decoration: InputDecoration(
                                                labelStyle: TextStyle(
                                                    color: Color(0xffff1e50)),
                                                labelText: 'Institute',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10))),
//                                            validator: (value) {
//                                              if (value.isEmpty) {
//                                                return 'Please enter a Title';
//                                              }
//                                            },
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                                            controller: new TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: data[index]['university'],
                                                    selection: new TextSelection.collapsed(
                                                        offset: university.length))),
                                            onChanged: (val) => university = val,
                                            style:
                                            TextStyle(color: Color(0xff232882)),
                                            scrollPadding: EdgeInsets.all(10.0),
                                            textAlign: TextAlign.start,
                                            decoration: InputDecoration(
                                              counterText: '',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(10)),
                                              labelStyle:
                                              TextStyle(color: Color(0xffff1e50)),
                                              labelText: 'Board',
                                            ),
//                                            validator: (value) {
//                                              if (value.isEmpty) {
//                                                return 'Please enter the Issuer';
//                                              }
//                                            },
                                          ),

                                          Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                                            controller: new TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: data[index]['location'],
                                                    selection: new TextSelection.collapsed(
                                                        offset: location.length))),
                                            onChanged: (val) => location = val,
                                            style:
                                            TextStyle(color: Color(0xff232882)),
                                            maxLength: 4,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                counterText: '',
                                                labelStyle: TextStyle(
                                                  color: Color(0xffff1e50),
                                                ),
                                                labelText: 'Location',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10))),
//                                            validator: (value) {
//                                              if (value.isEmpty) {
//                                                return 'Please enter the year';
//                                              }
//                                            },
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                                            controller: new TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: data[index]['specialization'],
                                                    selection: new TextSelection.collapsed(
                                                        offset: specialization.length))),
                                            onChanged: (val) => specialization = val,
                                            style:
                                            TextStyle(color: Color(0xff232882)),
                                            maxLength: 4,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                counterText: '',
                                                labelStyle: TextStyle(
                                                  color: Color(0xffff1e50),
                                                ),
                                                labelText: 'Specialization',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10))),
//                                            validator: (value) {
//                                              if (value.isEmpty) {
//                                                return 'Please enter the year';
//                                              }
//                                            },
                                          ),
                                           Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                                            controller: new TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: data[index]['year'].toString(),
                                                    selection: new TextSelection.collapsed(
                                                        offset: year.toString().length))),
                                            onChanged: (val) => year = val,
                                            style:
                                            TextStyle(color: Color(0xff232882)),
                                            maxLength: 4,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                counterText: '',
                                                labelStyle: TextStyle(
                                                  color: Color(0xffff1e50),
                                                ),
                                                labelText: 'Year',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10))),
//                                            validator: (value) {
//                                              if (value.isEmpty) {
//                                                return 'Please enter the year';
//                                              }
//                                            },
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                 controller: new TextEditingController.fromValue(
                                      new TextEditingValue(
                                          text: data[index]['grade'].toString(),
                                          selection: new TextSelection.collapsed(
                                              offset: grade.toString().length))),
                                  onChanged: (val) => grade = val,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                          labelStyle: TextStyle(
                                                  color: Color(0xffff1e50),
                                                ),
                      labelText: "Grade",
                      
                      hintText: "Example - Percentage",
                      suffix: IconButton(
                        icon: Icon(Icons.arrow_drop_down_circle),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog(
                                    buttonText: "Set",
                                    title: "Set",
                                    description: "Hello");
                              });
                        },
                      ))),
                       Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                                            controller: new TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: data[index]['score'].toString(),
                                                    selection: new TextSelection.collapsed(
                                                        offset: score.toString().length))),
                                            onChanged: (val) => score = val,
                                            style:
                                            TextStyle(color: Color(0xff232882)),
                                            scrollPadding: EdgeInsets.all(10.0),
                                            textAlign: TextAlign.start,
                                            decoration: InputDecoration(
                                              counterText: '',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(10)),
                                              labelStyle:
                                              TextStyle(color: Color(0xffff1e50)),
                                              labelText:
                                              'Score',
                                            ),
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
                                                    alignment:
                                                    FractionalOffset.center,
                                                    decoration: BoxDecoration(
                                                        color: Color(0xff232882),
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                        border: new Border.all(
                                                            color: Colors.white)),
                                                    child: InkWell(
                                                      onTap: () {
                                                        update(context, category, institute, university, location, specialization, year, grade, score, data[index]);
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
                                                              size: 20,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Update section",
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
                                    )),
                              ],
                            )
                          ],
                        ))))));
  }
  }