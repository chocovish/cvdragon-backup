import 'package:cvdragonapp_v1/vishal/sections/EducationalBackgroundForm.dart';
import 'package:flutter/material.dart';
import 'package:cvdragonapp_v1/maps.dart';
import './edit_section2.dart';
import './maps.dart';
import './edit_section.dart';
import 'edit_section2.dart';

String section = '';

class EditSectionEB extends StatelessWidget {
  EditSectionEB(String sectionid) {
    section = sectionid;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListView(
        padding: EdgeInsets.only(bottom: 30.0),
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 4.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/Edit Section/' + section + '-03.png'),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.scaleDown)),
            child: Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
              child: Column(
                children: <Widget>[
                  Text(
                    Sections[section],
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            color: Colors.transparent,
            height: MediaQuery.of(context).size.height / 1.8,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: db0 == null ? 0 : db0.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    //color: Colors.transparent,
                    margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                    elevation: 5.0,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/Untitled-2.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(8.0)),
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            height: MediaQuery.of(context).size.height / 12,
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Text(
                              db0.value[index][AddedDataColumn[section]]
                                  .toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 14,
                            width: MediaQuery.of(context).size.width / 8,
                            child: InkWell(
                              onTap: () {
                                //print(db0.value[index][AddedDataColumn[section]]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EducationalBackgroundForm(
                                              i: db0.value[index],
                                            )));
                              },
                              child: Icon(Icons.mode_edit,
                                  size: 30, color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
