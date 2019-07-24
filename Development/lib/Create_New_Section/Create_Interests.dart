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
var interest = '';
var level = '';

class CreateInterests extends StatelessWidget {
  CreateInterests(String d2, String i2, int i1, List d) {
      section = d2;
    secName = i2;
    index3 = i1;
    data = d;
  }

  create(BuildContext context,String i, String l) {
    Map<String,dynamic> datatobecreated={
      "interest":i,
      "level":l
    };
   lpush.pushData(section,datatobecreated).then((int status) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> EditSection(section)));

    });
  }
  final _selectedVal = ValueNotifier("No Interest selected");

  @override
  Widget build(BuildContext context) {
    return  Form(
                                      child: Column(children: <Widget>[
                                        TextField(
                                           controller: new TextEditingController(),
                                  onChanged: (val) => interest = val,
                                          style: TextStyle(color: Color(0xff232882)),
                                          decoration: InputDecoration(
                                              labelStyle: TextStyle(color: Color(0xffff1e50)),
                                              labelText: 'Interest',
                                              //hintText: "Heading",
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10))),
                                          // validator: (value) {
                                          //   if (value.isEmpty) {
                                          //     return 'Please enter an Interest';
                                          //   }
                                          // },
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            ValueListenableBuilder(
                                              valueListenable: _selectedVal,
                                              builder: (context, val, child) {
                                                return Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Radio(
                                                        value: "Hobby",
                                                        groupValue: val,
                                                        onChanged: (v) {
                                                          _selectedVal.value = v;
                                                        }),
                                                    Text("Interest"),
                                                    Radio(
                                                        value: "Interest",
                                                        groupValue: val,
                                                        onChanged: (v) {
                                                          _selectedVal.value = v;
                                                        }),
                                                    Text("Hobby"),
                                                    Radio(
                                                        value: "Passion",
                                                        groupValue: val,
                                                        onChanged: (v) {
                                                          _selectedVal.value = v;
                                                        }),
                                                    Text("Passion"),
                                                  ],
                                                );
                                              },
                                            )
                                          ],
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
                                                      border:
                                                      new Border.all(color: Colors.white)),
                                                  child: InkWell(
                                                      onTap: (){
                                                        create(context, interest, level);
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
                                      ]));

  }
}