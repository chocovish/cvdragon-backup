import 'package:flutter/material.dart';
import '../Custom_dialog.dart';
import '../Custom_dialog_KeyPhrases.dart';

Map<String, dynamic> faq;
List keyPhrases;
String section;
String secName;
String database;
int index;

var data = [];
var organization = data[index]['organization'];
var title = data[index]['title'];
var designation = data[index]['designation'];
var duration = data[index]['duration'];
var location = data[index]['location'];
var description = data[index]['description'];


class WorkProjects extends StatelessWidget {
  WorkProjects(String d2, String i2, int i1, List d, List k2) {
    section = d2;
    secName = i2;
    keyPhrases = k2;
    index = i1;
    data = d;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg.png'), fit: BoxFit.fill)),
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
                                              CustomDialog(
                                                title: "DataBase",
                                                description:
                                                "Data Aaoo, Hum Darte Hai Kya ?",
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
                                          TextField(
                                            controller: new TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: data[index]['organization'].toString(),
                                                    selection: new TextSelection.collapsed(
                                                        offset: organization.length))),
                                            onChanged: (val) => organization = val,
                                            style: TextStyle(color: Color(0xff232882)),
                                            decoration: InputDecoration(
                                                labelStyle:
                                                TextStyle(color: Color(0xffff1e50)),
                                                labelText: 'Organization',
                                                hintText:
                                                "Your Current/Previous Organization",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10))),
//                                            validator: (value) {
//                                              if (value.isEmpty) {
//                                                return 'Please enter an Organization';
//                                              }
//                                            },
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                                            controller: new TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: data[index]['title'].toString(),
                                                    selection: new TextSelection.collapsed(
                                                        offset: title.length))),
                                            onChanged: (val) => title = val,
                                            style: TextStyle(color: Color(0xff232882)),
                                            scrollPadding: EdgeInsets.all(10.0),
                                            textAlign: TextAlign.start,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10)),
                                                labelStyle:
                                                TextStyle(color: Color(0xffff1e50)),
                                                hintText: 'Name of the Project',
                                                labelText: 'Project Title'),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                                            controller: new TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: data[index]['designation'].toString(),
                                                    selection: new TextSelection.collapsed(
                                                        offset: designation.length))),
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
                                                hintText: 'Designation during the Project',
                                                labelText: 'Project Designation'),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                                            controller: new TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: data[index]['location'].toString(),
                                                    selection: new TextSelection.collapsed(
                                                        offset: location.length))),
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
                                                hintText: 'Location during the Project',
                                                labelText: 'Location'),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                                            controller: new TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: data[index]['duration'].toString(),
                                                    selection: new TextSelection.collapsed(
                                                        offset: duration.length))),
                                            onChanged: (val) => duration = val,
                                            style: TextStyle(color: Color(0xff232882)),
                                            scrollPadding: EdgeInsets.all(10.0),
                                            textAlign: TextAlign.start,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10)),
                                                labelStyle:
                                                TextStyle(color: Color(0xffff1e50)),
                                                hintText: 'Duration of the Project',
                                                labelText: 'Duration'),
                                          ),


                                          Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                                            controller: new TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: data[index]['description'].toString(),
                                                    selection: new TextSelection.collapsed(
                                                        offset: description.length))),
                                            onChanged: (val) => description = val,
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
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                InkWell(
                                                  child: Container(
                                                    height: MediaQuery.of(context).size.height / 18,
                                                    width: MediaQuery.of(context).size.width / 3,
                                                    alignment: FractionalOffset.center,
                                                    decoration: BoxDecoration(
                                                        color: Color(0xff232882),
                                                        borderRadius: BorderRadius.circular(30.0),
                                                        border:
                                                        new Border.all(color: Colors.white)),
                                                    child: InkWell(
                                                      onTap: () {
                                                        //update(context, title, description, data[index]);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          Container(
                                                            padding: EdgeInsets.only(right: 5),
                                                            child: Icon(
                                                              Icons.add_circle,
                                                              color: Colors.white,
                                                              size: MediaQuery.of(context)
                                                                  .size
                                                                  .aspectRatio *
                                                                  40,
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
                                          ),],
                                      )))
                            ])
                          ]))),
            )));
  }
}
