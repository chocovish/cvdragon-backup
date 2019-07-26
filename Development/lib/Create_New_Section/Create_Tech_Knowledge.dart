import 'package:cvdragonapp_v1/edit_section.dart';
import 'package:flutter/material.dart';
import '../localdatapush.dart'as lpush;
import '../Custom_dialog.dart';

Map<String, dynamic> faq;
int index3;
String database;
String y;

String section;
String secName;
var data = [];
var technical = '';
var type = '';
var level = '';
var description ='';

class CreateTechnicalKnowledge extends StatelessWidget {
  CreateTechnicalKnowledge(String d2, String i2, int i1, List d) {
    section = d2;
    secName = i2;
    index3 = i1;
    data = d;
  }

  create(BuildContext context,String t, String type, String l, String d) {
    Map<String,dynamic> datatobecreated={
       "technical":t,
  "type":type,
  "level":l,
  "description":d
    };
   lpush.pushData(section,datatobecreated).then((int status) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> EditSection(section)));

    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
          child: Column(
            children: <Widget>[
              TextField(
                 controller: new TextEditingController(),
                                  onChanged: (val) => technical = val,
                style: TextStyle(color: Color(0xff232882)),
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Color(0xffff1e50)),
                    labelText: 'Technical Knowledge',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Please enter a Title';
                //   }
                // },
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                 controller: new TextEditingController(),
                                  onChanged: (val) => type = val,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Type",
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
              SizedBox(height: 10),
              TextField(
                 controller: new TextEditingController(),
                                  onChanged: (val) => level = val,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Level",
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
                controller: new TextEditingController(),
                                  onChanged: (val) => description = val,
                style: TextStyle(color: Color(0xff232882)),
                scrollPadding: EdgeInsets.all(10.0),
                maxLines: 10,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelStyle: TextStyle(color: Color(0xffff1e50)),
                  labelText: 'Brief Description about the Award',
                ),
              ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                    
                                    },
                                    child: Container(
                                      height: MediaQuery.of(context).size.height / 18,
                                      width: MediaQuery.of(context).size.width / 2,
                                      alignment: FractionalOffset.center,
                                      decoration: BoxDecoration(
                                          color: Color(0xff232882),
                                          borderRadius: BorderRadius.circular(30.0),
                                          border:
                                          new Border.all(color: Colors.white)),
                                      child: InkWell(
                                        onTap: () {
                                          
                                        create(context, technical, type, level, description);
                                      
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
                          ],
                        ),
                      );
  }
  }