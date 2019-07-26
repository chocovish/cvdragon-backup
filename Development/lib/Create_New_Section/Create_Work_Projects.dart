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
var organization = '';
var title = '';
var designation = '';
var duration = '';
 var location = '';
var description ='';


class CreateWorkProjects extends StatelessWidget {
  CreateWorkProjects(String d2, String i2, int i1, List d) {
  section = d2;
    secName = i2;
    index3 = i1;
    data = d;
  }

  create(BuildContext context,String o, String t, String des, String dur, String l, String d) {
    Map<String,dynamic> datatobecreated={
       "organization":o,
    "title":t,
    "designation":des,
    "duration":dur,
    "location":l,
    "description":d,
    "workid":""
    };
   lpush.pushData(section,datatobecreated).then((int status) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> EditSection(section)));

    });
  }

  @override
  Widget build(BuildContext context) {
    return  Form(
                                      child: Column(
                                        children: <Widget>[
                                          TextField(
                                             controller: new TextEditingController(),
                                  onChanged: (val) => organization = val,
                                            style: TextStyle(color: Color(0xff232882)),
                                            decoration: InputDecoration(
                                                labelStyle:
                                                TextStyle(color: Color(0xffff1e50)),
                                                labelText: 'Organization',
                                                hintText:
                                                "Your Current/Previous Organization",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10))),
                                            // validator: (value) {
                                            //   if (value.isEmpty) {
                                            //     return 'Please enter an Organization';
                                            //   }
                                            // },
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                                             controller: new TextEditingController(),
                                  onChanged: (val) => title = val,
                                            style: TextStyle(color: Color(0xff232882)),
                                            scrollPadding: EdgeInsets.all(10.0),
                                            textAlign: TextAlign.start,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10)),
                                                labelStyle:
                                                TextStyle(color: Color(0xffff1e50)),
                                                hintText: 'Name of the Project',
                                                labelText: 'Project Title'),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                                             controller: new TextEditingController(),
                                  onChanged: (val) => designation = val,
                                            style: TextStyle(color: Color(0xff232882)),
                                            scrollPadding: EdgeInsets.all(10.0),
                                            textAlign: TextAlign.start,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10)),
                                                labelStyle:
                                                TextStyle(color: Color(0xffff1e50)),
                                                hintText: 'Designation during the Project',
                                                labelText: 'Project Designation'),
                                          ),
                                         
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                                             controller: new TextEditingController(),
                                  onChanged: (val) => duration = val,
                                            style: TextStyle(color: Color(0xff232882)),
                                            scrollPadding: EdgeInsets.all(10.0),
                                            textAlign: TextAlign.start,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10)),
                                                labelStyle:
                                                TextStyle(color: Color(0xffff1e50)),
                                                hintText: 'Duration of the Project',
                                                labelText: 'Duration'),
                                          ),


                                          
                                           Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                                             controller: new TextEditingController(),
                                  onChanged: (val) => location = val,
                                            style: TextStyle(color: Color(0xff232882)),
                                            scrollPadding: EdgeInsets.all(10.0),
                                            textAlign: TextAlign.start,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10)),
                                                labelStyle:
                                                TextStyle(color: Color(0xffff1e50)),
                                                hintText: 'Location during the Project',
                                                labelText: 'Location'),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          TextField(
                                             controller: new TextEditingController(),
                                  onChanged: (val) => description = val,
                                            style: TextStyle(color: Color(0xff232882)),
                                            scrollPadding: EdgeInsets.all(10.0),
                                            textAlign: TextAlign.start,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10)),
                                                labelStyle:
                                                TextStyle(color: Color(0xffff1e50)),
                                                labelText: 'Brief Description'),
                                            maxLines: 15,
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
                                                      onTap: () {
                                                     create(context, organization, title, designation, duration, location, description);
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
                                          ),],
                                      ));
  }
}
