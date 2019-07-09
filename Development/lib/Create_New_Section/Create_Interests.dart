import 'package:flutter/material.dart';
import '../Custom_dialog.dart';
import '../Custom_dialog_KeyPhrases.dart';

Map<String, dynamic> faq;
//List keyPhrases;
String section;
String secName;

class CreateInterests extends StatelessWidget {
  CreateInterests(String d2, String i2) {
    section = d2;
    secName = i2;
  }
  final _selectedVal = ValueNotifier("No Interest selected");

  @override
  Widget build(BuildContext context) {
    return  Form(
                                      child: Column(children: <Widget>[
                                        TextFormField(
                                          style: TextStyle(color: Color(0xff232882)),
                                          decoration: InputDecoration(
                                              labelStyle: TextStyle(color: Color(0xffff1e50)),
                                              labelText: 'Interest',
                                              //hintText: "Heading",
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10))),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter an Interest';
                                            }
                                          },
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
                                                  width: MediaQuery.of(context).size.width / 3,
                                                  alignment: FractionalOffset.center,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff232882),
                                                      borderRadius: BorderRadius.circular(30.0),
                                                      border:
                                                      new Border.all(color: Colors.white)),
                                                  child: InkWell(
//                                                    onTap: () {
//                                                      update(context, title, description, data[index]);
//                                                    },

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