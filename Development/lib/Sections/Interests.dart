import 'package:flutter/material.dart';
import '../Custom_dialog.dart';
import '../Custom_dialog_KeyPhrases.dart';

Map<String, dynamic> faq;
List keyPhrases;
String section;
String secName;

class Interests extends StatelessWidget {
  Interests(String d2, String i2) {
    section = d2;
    secName = i2;
  }
  final _selectedVal = ValueNotifier("No Interest selected");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg.png'), fit: BoxFit.fill)),
          child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
                                          builder: (BuildContext context) => CustomDialog(
                                            title: "FAQs",
                                            description: "You ask, we answer !",
                                            buttonText: "Okay",
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: MediaQuery.of(context).size.height / 18,
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
                                              CustomDialogKeyPhrases(
                                                  "Key Phrases", keyPhrases),
                                        );
                                      },
                                      child: Container(
                                        height: MediaQuery.of(context).size.height / 18,
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
                                            description:
                                            "Data Aaoo, Hum Darte Hai Kya ?",
                                            buttonText: "Okay",
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: MediaQuery.of(context).size.height / 18,
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
                              Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Form(
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
                                      ]))),

                            ])
                          ])))),
        ));
  }
}