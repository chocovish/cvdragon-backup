import 'package:flutter/material.dart';
import '../Custom_dialog.dart';
import '../Custom_dialog_KeyPhrases.dart';

Map<String, dynamic> faq;
//List keyPhrases;
String section;
String secName;

class CreateAchievments extends StatelessWidget {
  CreateAchievments(String d2, String i2) {
    section = d2;
    secName = i2;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Form(
      child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      style: TextStyle(color: Color(0xff232882)),
                                      decoration: InputDecoration(
                                          labelStyle:
                                          TextStyle(color: Color(0xffff1e50)),
                                          labelText: 'Achievement',
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10))),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter an Achievement';
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                    ),
                                    TextFormField(
                                      style: TextStyle(color: Color(0xff232882)),
                                      scrollPadding: EdgeInsets.all(10.0),
                                      keyboardType: TextInputType.number,
                                      maxLength: 4,
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                          counterText: '',
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10)),
                                          labelStyle:
                                          TextStyle(color: Color(0xffff1e50)),
                                          labelText: 'Year',
                                          hintText: "yyyy"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                    ),
                                    TextFormField(
                                      style: TextStyle(color: Color(0xff232882)),
                                      maxLines: 10,
                                      decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                            color: Color(0xffff1e50),
                                          ),
                                          labelText: 'Brief Description',
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10))),
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
                                              height:
                                              MediaQuery.of(context).size.height /
                                                  18,
                                              width: MediaQuery.of(context).size.width /
                                                  2.5,
                                              alignment: FractionalOffset.center,
                                              decoration: BoxDecoration(
                                                  color: Color(0xff232882),
                                                  borderRadius:
                                                  BorderRadius.circular(30.0),
                                                  border: new Border.all(
                                                      color: Colors.white)),
                                              child: InkWell(
                                                onTap: () {},
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
                                                      "Add Achievement",
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
    );

  }
}