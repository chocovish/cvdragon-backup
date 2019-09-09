import 'package:flutter/material.dart';
import '../Custom_dialog.dart';
import '../Custom_dialog_KeyPhrases.dart';
import '../Custom dialog database.dart';
import '../localdatapush.dart';
import '../edit_section.dart';
Map<String, dynamic> faq;
int index;
List databb3 = [];
List databb1 = [];
String database;
List keyPhrases;
String section;
String secName;


var data = [];
var technical = data[index]['technical'];
var type = data[index]['type'];
var level = data[index]['level'];
var description = data[index]['description'];

class TechnicalKnowledge extends StatelessWidget {
  TechnicalKnowledge(String d2, String i2, int i1, List d, List k2, List d1, List d3) {
    section = d2;
    secName = i2;
    index = i1;
    data = d;
    databb1 = d3;
    databb3 = d1;
    keyPhrases = k2;
  }

  update(BuildContext context,String t, String type, String l, String d, Map<String, dynamic> initial) {
   Map <String,dynamic> newdata={
  "technical":t,
  "type":type,
  "level":l,
  "description":d
};
    updateData(section,newdata,initial).then((int status) {

       Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> EditSection(section)));



    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/FormSection/'+section+'-02.png'), fit: BoxFit.fill)),
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
                child:
                ListView(padding: EdgeInsets.only(bottom: 30.0), children: <Widget>[
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
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) => CustomDialogDatabase("Database",data, databb3,section
                                //   ),
                                // );
                                Navigator.pop(context);
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
          child: Column(
            children: <Widget>[
              TextField(
                 controller: new TextEditingController.fromValue(
                                      new TextEditingValue(
                                          text: data[index]['technical'],
                                          selection: new TextSelection.collapsed(
                                              offset: technical.toString().length))),
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
                 controller: new TextEditingController.fromValue(
                                      new TextEditingValue(
                                          text: data[index]['type'],
                                          selection: new TextSelection.collapsed(
                                              offset: type.toString().length))),
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
                 controller: new TextEditingController.fromValue(
                                      new TextEditingValue(
                                          text: data[index]['level'],
                                          selection: new TextSelection.collapsed(
                                              offset: level.toString().length))),
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
                 controller: new TextEditingController.fromValue(
                                      new TextEditingValue(
                                          text: data[index]['description'],
                                          selection: new TextSelection.collapsed(
                                              offset: description.length))),
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
                                      width: MediaQuery.of(context).size.width / 2.2,
                                      alignment: FractionalOffset.center,
                                      decoration: BoxDecoration(
                                          color: Color(0xff232882),
                                          borderRadius: BorderRadius.circular(30.0),
                                          border:
                                          new Border.all(color: Colors.white)),
                                      child: InkWell(
                                        onTap: () {
                                          update(context, technical, type, level, description, data[index]);
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
                                              "Update Section",
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
                      ),
                       ),
                    ],
                  ),
                ])),
          ),
        ),
      ),
    );
  }

}




