import 'package:flutter/material.dart';
import '../Custom_dialog.dart';
import '../Custom_dialog_KeyPhrases.dart';

Map<String, dynamic> faq;
List keyPhrases;
String section;
String secName;

class Introduction extends StatelessWidget {
  Introduction(String d2, String i2) {
    section = d2;
    secName = i2;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: ListView(
          padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0, bottom: 30.0),
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.yellow),
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      secName,
                      style: TextStyle(color: Color(0xff232882), fontSize: 30.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 70.0),
                        child: Image(image: AssetImage('assets/Basic Info.png')))
                  ],
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDialog(
                          title: "FAQs",
                          description: faq['faq'].toString(),
                          buttonText: "Okay",
                        ),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 4,
                      alignment: FractionalOffset.center,
                      decoration: BoxDecoration(
                          color: Color(0xff232882),
                          borderRadius: BorderRadius.circular(30.0),
                          border: new Border.all(color: Colors.white)),
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
                            CustomDialogKeyPhrases("Key Phrases", keyPhrases),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 4,
                      alignment: FractionalOffset.center,
                      decoration: BoxDecoration(
                          color: Color(0xff232882),
                          borderRadius: BorderRadius.circular(30.0),
                          border: new Border.all(color: Colors.white)),
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
                        builder: (BuildContext context) => CustomDialog(
                          title: "DataBase",
                          description: "abc",
                          buttonText: "Okay",
                        ),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 4,
                      alignment: FractionalOffset.center,
                      decoration: BoxDecoration(
                          color: Color(0xff232882),
                          borderRadius: BorderRadius.circular(30.0),
                          border: new Border.all(color: Colors.white)),
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
            Card(
              child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(color: Color(0xff232882)),
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Color(0xffff1e50)),
                              labelText: 'Profile Title',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a profile name';
                            }
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        TextFormField(
                          style: TextStyle(color: Color(0xff232882)),
                          scrollPadding: EdgeInsets.all(10.0),
                          maxLines: 15,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelStyle: TextStyle(color: Color(0xffff1e50)),
                              labelText: 'Brief Description about yourself'),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  height: MediaQuery.of(context).size.height / 18,
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  alignment: FractionalOffset.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xff232882),
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: new Border.all(color: Colors.white)),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Icon(
                                            Icons.add_circle,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        Text(
                                          "Add Introduction",
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
                        )
                      ],
                    ),
                  )),
            )
          ],
        ));
  }
  }