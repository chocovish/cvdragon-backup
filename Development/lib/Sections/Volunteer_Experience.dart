import 'package:flutter/material.dart';
import '../Custom_dialog.dart';
import '../Custom_dialog_KeyPhrases.dart';

Map<String, dynamic> faq;
List keyPhrases;
String section;
String secName;

class VolunteerExperience extends StatelessWidget {
  VolunteerExperience(String d2, String i2) {
    section = d2;
    secName = i2;
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> _value = ValueNotifier("DD/MM/YYYY");

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
                                  TextFormField(
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
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter an Organization';
                                      }
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                  ),
                                  TextFormField(
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
                                  TextFormField(
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
                                                            ])))
                                              ]),
                                        ),
                                      ]),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                  ),
                                  TextFormField(
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
                          ),
                        ])
                      ]))),
            )));
  }
}
