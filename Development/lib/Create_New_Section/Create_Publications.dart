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
var category = '';
var publisher = '';
var publishDate = '';
var description = '';


class CreatePublications extends StatelessWidget {
  CreatePublications(String d2, String i2, int i1, List d) {
    section = d2;
    secName = i2;
    index3 = i1;
    data = d;
  }

   create(BuildContext context,String t, String c, String p, String pd, String d) {
    Map<String,dynamic> datatobecreated={
     "title":t,
  "category":c,
  "publisher":p,
  "publishDate":pd,
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
    ValueNotifier<String> _value = ValueNotifier("DD/MM/YYYY");

    Future _selectDate() async {
      DateTime picked = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(2016),
          lastDate: new DateTime(2030));
      if (picked != null) {
        String mydate = "${picked.day}/${picked.month}/${picked.year}";
        _value.value = mydate;
        print("Value is $mydate");
      }
    }

    return Form(
      child: Column(
          children: <Widget>[
            TextField(
               controller: new TextEditingController(),
                                  onChanged: (val) => title = val,
              style: TextStyle(color: Color(0xff232882)),
              decoration: InputDecoration(
                  labelStyle:
                  TextStyle(color: Color(0xffff1e50)),
                  labelText: 'Associated Organization',
                  hintText:
                  "Name of the Organization",
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
                                  onChanged: (val) => category = val,
              style: TextStyle(color: Color(0xff232882)),
              scrollPadding: EdgeInsets.all(10.0),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10)),
                  labelStyle:
                  TextStyle(color: Color(0xffff1e50)),
                  labelText: 'Position/Membership Level'),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            TextField(
               controller: new TextEditingController(),
                                  onChanged: (val) => publisher = val,
              style: TextStyle(color: Color(0xff232882)),
              scrollPadding: EdgeInsets.all(10.0),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10)),
                  labelStyle:
                  TextStyle(color: Color(0xffff1e50)),
                  labelText: 'Location'),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(
                                  bottom: 10),
                              child: Text(
                                "Publish Date",
                                textAlign: TextAlign.left,
                              )),
                          InkWell(
                              onTap: _selectDate,
                              child: Container(
                                  decoration:
                                  BoxDecoration(
                                      color:
                                      Colors.red),
                                  height: 40,
                                  width: 130,
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceEvenly,
                                      children: <Widget>[
                                        ValueListenableBuilder(
                                          valueListenable:
                                          _value,
                                          builder:
                                              (context,
                                              val,
                                              child) {
                                            return Text(
                                                val);
                                          },
                                        ),
                                        InkWell(
                                          child: Icon(Icons
                                              .arrow_drop_down_circle),
                                        ),
                                      ]))),
                        ]),
                  ),
             
                ]),
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
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 18,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3,
                      alignment: FractionalOffset.center,
                      decoration: BoxDecoration(
                          color: Color(0xff232882),
                          borderRadius: BorderRadius.circular(30.0),
                          border:
                          new Border.all(color: Colors.white)),
                      child: InkWell(
                        onTap: () {
                         create(context, title, category, publisher, publishDate, description);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.add_circle,
                                color: Colors.white,
                                size: MediaQuery
                                    .of(context)
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
          ]),
    );
  }

}
