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

var organization = data[index]['organization'];
var title = data[index]['title'];
var designation = data[index]['designation'];
var duration = data[index]['duration'];
var location = data[index]['location'];
var description = data[index]['description'];



class Internships extends StatelessWidget {
  Map<String, dynamic> formData = {};
  List<String> accountNames = <String>[
    'Article Clerk',
    'Winter Trainee',
    'Summer Trainee',
    'Apprentice',
    'Industrial Trainee'
  ];

  //String accountname = data[index]['designation'].toString();
  Internships(String d2, String i2, int i1, List d, List k2, List d1, List d3) {
    section = d2;
    secName = i2;
    index = i1;
    data = d;
    databb1 = d3;
    databb3 = d1;
    keyPhrases = k2;
    print(data[index].toString());
    formData = {
      'accountname': data[index]['designation'].toString(),
    };
    //print("data is $data");
  }
  update(BuildContext context,String o, String t, String des, String dur, String loc, String d, Map<String, dynamic> initial) {
   Map <String,dynamic> newdata={
     "organization":o,
  "title":t,
  "designation":des,
  "duration":dur,
  "location":loc,
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
    // TODO: implement build
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
                    //Image.asset('assets/final structure-02.png'),
                  )),
            ];
          },
          body: Card(
            elevation: 5.0,
            child: Container(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  padding: EdgeInsets.only(bottom: 20.0),
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
                                    builder: (BuildContext context) =>
                                        CustomDialog(
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
                                      border:
                                      new Border.all(color: Colors.white)),
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
                                      border:
                                      new Border.all(color: Colors.white)),
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
                                    builder: (BuildContext context) =>
                                        CustomDialogDatabase("Database",data, databb3,section
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
                                      border:
                                      new Border.all(color: Colors.white)),
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
                            child: Column(
                              children: <Widget>[
                                Form(
                                  child: Column(
                                    children: <Widget>[
                                      TextField(
                                        controller: new TextEditingController.fromValue(
                                            new TextEditingValue(
                                                text: data[index]['organization'].toString(),
                                                selection: new TextSelection.collapsed(
                                                    offset: organization.length))),
                                        onChanged: (val) => organization = val,
                                        style: TextStyle(color: Color(0xff232882)),
                                        decoration: InputDecoration(
                                            labelStyle:
                                            TextStyle(color: Color(0xffff1e50)),
                                            labelText: 'Organization',
                                            hintText: "Name of the organization",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(10))),
//                                        validator: (value) {
//                                          if (value.isEmpty) {
//                                            return 'Please enter the name of the organization';
//                                          }
//                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                      ),
                                      TextField(
                                        controller: new TextEditingController.fromValue(
                                            new TextEditingValue(
                                                text: data[index]['title'].toString(),
                                                selection: new TextSelection.collapsed(
                                                    offset: title.length))),
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
                                            labelText: 'Internship Title',
                                            hintText: "Name of the project"),
//                                        validator: (value) {
//                                          if (value.isEmpty) {
//                                            return 'Please enter an Internship Title';
//                                          }
//                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                      ),
                                TextField(
                 controller: new TextEditingController.fromValue(
                                      new TextEditingValue(
                                          text: data[index]['designation'],
                                          selection: new TextSelection.collapsed(
                                              offset: designation.toString().length))),
                                  onChanged: (val) => designation = val,
                                  style: TextStyle(color: Color(0xff232882)),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                          labelStyle: TextStyle(color: Color(0xffff1e50)),
                      labelText: "Designation",
                      
                      suffix: IconButton(
                        icon: Icon(Icons.arrow_drop_down_circle),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog(
                                    buttonText: "Set",
                                    title: "Set",
                                    description: "Dummy Data");
                              });
                        },
                      ))),

//                                      DropDownField(
//                                          value: formData['accountname'],
//                                          required: true,
//                                          labelText: 'Account Name *',
//                                          icon: Icon(Icons.account_balance),
//                                          items: accountNames,
//                                          setter: (dynamic newValue) {
//                                            formData['accountname'] = newValue;
//                                          }),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                      ),
                                      TextField(
                                        controller: new TextEditingController.fromValue(
                                            new TextEditingValue(
                                                text: data[index]['location'].toString(),
                                                selection: new TextSelection.collapsed(
                                                    offset: location.length))),
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
                                            labelText: 'Location',
                                            hintText: "City"),
//                                        validator: (value) {
//                                          if (value.isEmpty) {
//                                            return 'Please enter Internship Location';
//                                          }
//                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                      ),
                                      TextField(
                                        controller: new TextEditingController.fromValue(
                                            new TextEditingValue(
                                                text: data[index]['duration'],
                                                selection: new TextSelection.collapsed(
                                                    offset: duration.length))),
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
                                            labelText: 'Duration',
                                            hintText: "Ex - 1 Month / 2 Weeks"),
                                      ),
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
                                        textAlign: TextAlign.start,
                                        maxLines: 10,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          labelStyle:
                                          TextStyle(color: Color(0xffff1e50)),
                                          labelText:
                                          'Brief Description about the Internship',
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            InkWell(
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                    18,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    2.5,
                                                alignment: FractionalOffset.center,
                                                decoration: BoxDecoration(
                                                    color: Color(0xff232882),
                                                    borderRadius:
                                                    BorderRadius.circular(30.0),
                                                    border: new Border.all(
                                                        color: Colors.white)),
                                                child: InkWell(
                                                  onTap: () {
                                                     update(context, organization, title, designation, duration, location, description, data[index]);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Container(
                                                        padding:
                                                        EdgeInsets.only(right: 5),
                                                        child: Icon(
                                                          Icons.add_circle,
                                                          color: Colors.white,
                                                          size: 20,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Update Internship",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                            FontWeight.bold),
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
                            )),
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
  }