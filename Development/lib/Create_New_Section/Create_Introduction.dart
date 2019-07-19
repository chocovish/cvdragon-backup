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
var title = '';
var introduction = '';


class CreateIntroduction extends StatelessWidget {
  CreateIntroduction(String d2, String i2, int i1, List d) {
     section = d2;
    secName = i2;
    index3 = i1;
    data = d;
  }

  create(BuildContext context,String t, String i) {
    Map<String,dynamic> datatobecreated={
    "title":t,
  "introduction":i
    };
   lpush.pushData(section,datatobecreated).then((int status) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> EditSection(section)));

    });
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
                                  height: MediaQuery.of(context).size.height / 18,
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  alignment: FractionalOffset.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xff232882),
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: new Border.all(color: Colors.white)),
                                  child: InkWell(
                                    onTap: () {
                                      create(context, title, introduction);
                                    },
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
                  );
  }
}