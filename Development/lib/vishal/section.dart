import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Custom_dialog.dart';
import './Custom_dialog_KeyPhrases.dart';
import './UploadPage.dart';
import './TN.dart';
import 'Introduction.dart';
import 'BasicInfo.dart';
import 'PositionOfResponsibility.dart';
import 'ProfileImage.dart';

String secName = "MySection";
List<String> keyPhrases = ["hello", "World"];

Widget SectionBase(BuildContext context) {
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
                  //Image.asset('assets/final structure-02.png'),
                )),
          ];
        },
        body: Card(
          elevation: 5.0,
          child: Container(
            child: ListView(
              padding: EdgeInsets.only(bottom: 10.0),
              children: <Widget>[
                Column(
                  children: <Widget>[
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
                    ProfileImageUpload(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

