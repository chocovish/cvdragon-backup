import 'package:flutter/material.dart';
import '../Custom_dialog.dart';
import '../Custom_dialog_KeyPhrases.dart';

Map<String, dynamic> faq;
//List keyPhrases;
String section;
String secName;

class CreateBasicInfo extends StatelessWidget {
  CreateBasicInfo(String d2, String i2) {
    section = d2;
    secName = i2;
  }
  @override
  Widget build(BuildContext context) {
    return  Form(
      child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Full Name : ",
                                  style: TextStyle(
                                      fontSize: 22.0, color: Color(0xffff1e50)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Somesh Dave",
                                  style: TextStyle(
                                      fontSize: 22.0, color: Color(0xff232882)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Form(
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                style: TextStyle(color: Color(0xff232882)),
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Color(0xffff1e50)),
                                    labelText: 'Nationality',
                                    hintText: "Example : Indian",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter a nationality';
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
                                        borderRadius: BorderRadius.circular(10)),
                                    labelStyle: TextStyle(color: Color(0xffff1e50)),
                                    labelText: 'Gender',
                                    hintText: "Male / Female / Other"),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter a gender';
                                  }
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                              ),
                              TextFormField(
                                style: TextStyle(color: Color(0xff232882)),
                                keyboardType: TextInputType.datetime,
                                scrollPadding: EdgeInsets.all(10.0),
                                maxLength: 10,
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                    counterText: '',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    labelStyle: TextStyle(color: Color(0xffff1e50)),
                                    labelText: 'Date Of Birth',
                                    hintText: "dd-mm-yyyy"),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter a Date of Birth';
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
                                        borderRadius: BorderRadius.circular(10)),
                                    labelStyle: TextStyle(color: Color(0xffff1e50)),
                                    labelText: 'Marital Status',
                                    hintText:
                                    "Married / Unmarried / Engaged / In a Relationship"),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your Marital Status';
                                  }
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                              ),
                              TextFormField(
                                style: TextStyle(color: Color(0xff232882)),
                                keyboardType: TextInputType.url,
                                scrollPadding: EdgeInsets.all(10.0),
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    labelStyle: TextStyle(color: Color(0xffff1e50)),
                                    labelText: 'Facebook Profile',
                                    hintText:
                                    "https://www.facebook.com/cvDragonIndia/"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                              ),
                              TextFormField(
                                style: TextStyle(color: Color(0xff232882)),
                                keyboardType: TextInputType.url,
                                scrollPadding: EdgeInsets.all(10.0),
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    labelStyle: TextStyle(color: Color(0xffff1e50)),
                                    labelText: 'LinkedIn Profile',
                                    hintText: "https://www.linkedin.com/in/xxx-xxx/"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                              ),
                              TextFormField(
                                style: TextStyle(color: Color(0xff232882)),
                                keyboardType: TextInputType.url,
                                scrollPadding: EdgeInsets.all(10.0),
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    labelStyle: TextStyle(color: Color(0xffff1e50)),
                                    labelText: 'Twitter Profile',
                                    hintText: "https://twitter.com/cvDragonIndia/"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                              ),
                              TextFormField(
                                style: TextStyle(color: Color(0xff232882)),
                                keyboardType: TextInputType.url,
                                scrollPadding: EdgeInsets.all(10.0),
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    labelStyle: TextStyle(color: Color(0xffff1e50)),
                                    labelText: 'Blog Link (If Any)'),
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
                              )
                            ],
                          ),
                        )
                      ],
                    ),
    );
  }
}