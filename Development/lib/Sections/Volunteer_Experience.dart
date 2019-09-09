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
var cause = data[index]['cause'];
var role = data[index]['role'];
var dateJoining = data[index]['dateJoining'];
var dateLeaving = data[index]['dateLeaving'];
var description = data[index]['description'];

class VolunteerExperience extends StatelessWidget {
  VolunteerExperience(String d2, String i2, int i1, List d, List k2, List d1, List d3) {
     section = d2;
    secName = i2;
    index = i1;
    data = d;
    databb1 = d3;
    databb3 = d1;
    keyPhrases = k2;
  }

  update(BuildContext context,String o, String c, String r, String dj, String dl, String d, Map<String, dynamic> initial) {
    Map <String,dynamic> newdata={
    "organization":o,
    "cause":c,
    "role":r,
    "dateJoining":dj,
    "dateLeaving":dl,
    "description":d
  };
      updateData(section,newdata,initial).then((int status) {

        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> EditSection(section)));



      });
    }



  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> _value = ValueNotifier(data[index]['dateJoining']);
    ValueNotifier<String> _value2 = ValueNotifier(data[index]['dateLeaving']);


    Future _selectDate() async {
      DateTime picked = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(2016),
          lastDate: new DateTime(2030));
      if (picked != null) {
        String mydate = "${picked.day}/${picked.month}/${picked.year}";
        _value.value = mydate;
        print("Value is $mydate");
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
                          padding: EdgeInsets.only(bottom: 30.0),
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
                                    // showDialog(
                                    //   context: context,
                                    //   builder: (BuildContext context) =>
                                    //      CustomDialogDatabase("Database",data, databb3,section
                                    //       ),
                                    // );
                                    Navigator.pop(context);
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
                                            text: data[index]['organization'],
                                            selection: new TextSelection.collapsed(
                                                offset: organization.length))),
                                    onChanged: (val) => organization = val,
                                    style: TextStyle(color: Color(0xff232882)),
                                    decoration: InputDecoration(
                                        labelStyle:
                                            TextStyle(color: Color(0xffff1e50)),
                                        labelText: 'Organization',
                                        hintText:
                                            "Name of the NGO/Organization",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
//                                    validator: (value) {
//                                      if (value.isEmpty) {
//                                        return 'Please enter an Organization';
//                                      }
//                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                  ),
                                  TextField(
                                    controller: new TextEditingController.fromValue(
                                        new TextEditingValue(
                                            text: data[index]['role'],
                                            selection: new TextSelection.collapsed(
                                                offset: role.length))),
                                    onChanged: (val) => role = val,
                                    style: TextStyle(color: Color(0xff232882)),
                                    scrollPadding: EdgeInsets.all(10.0),
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        labelStyle:
                                            TextStyle(color: Color(0xffff1e50)),
                                        labelText: 'Role'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                  ),
                                  TextField(
                                    controller: new TextEditingController.fromValue(
                                        new TextEditingValue(
                                            text: data[index]['cause'],
                                            selection: new TextSelection.collapsed(
                                                offset: cause.length))),
                                    onChanged: (val) => cause = val,
                                    style: TextStyle(color: Color(0xff232882)),
                                    scrollPadding: EdgeInsets.all(10.0),
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        labelStyle:
                                            TextStyle(color: Color(0xffff1e50)),
                                        labelText: 'Cause'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                                    onTap: _selectDate,
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Colors.red),
                                                        height: 40,
                                                        width: 130,
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
                                                                      val);
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
                                                    onTap: _selectDate,
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Colors.red),
                                                        height: 40,
                                                        width: 130,
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
                                                                      val);
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
                                  TextField(
                                    controller: new TextEditingController.fromValue(
                                        new TextEditingValue(
                                            text: data[index]['description'],
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
                                        labelText: 'Your Contribution'),
                                    maxLines: 15,
                                  ),
                                ],
                              ))),

                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height / 18,
                                    width: MediaQuery.of(context).size.width / 2.2,
                                    alignment: FractionalOffset.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xff232882),
                                        borderRadius: BorderRadius.circular(30.0),
                                        border:
                                        new Border.all(color: Colors.white)),
                                    child: InkWell(
                                      onTap: () {
                                      update(context, organization, cause, role, dateJoining, dateLeaving, description, data[index]);
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
                                            "Update Section",
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
                          ),
                        ])
                      ]))),
            )));
  }
}
