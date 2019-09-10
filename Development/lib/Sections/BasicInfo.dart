// import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import '../Custom_dialog.dart';
import '../localdatapush.dart';
import '../edit_section.dart';
Map<String, dynamic> faq;
int index = 0;
List databb3 = [];
List databb1 = [];
String database;
List keyPhrases;
String section;
String secName;


var data = [];
var cvFullName = data[index]['cvFullName'];
var nationality = data[index]['nationality'];
var gender = data[index]['gender'];
var maritalStatus = data[index]['maritalStatus'];
var dateBirth = data[index]['dateBirth'];
var facebookLink = data[index]['facebookLink'];
var linkedinLink = data[index]['linkedinLink'];
var twitterLink = data[index]['twitterLink'];
var blogLink = data[index]['blogLink'];
class BasicInfo extends StatelessWidget {
  BasicInfo(String d2, String i2, var data1) {
    section = d2;
    secName = i2;
    data = data1;
     index = 0;

  }

  update(BuildContext context, String n, String g, String db, String m, String fl, String ll, String tl, String bl, Map<String, dynamic> initial) {
   Map <String,dynamic> newdata={
  "nationality":n,
  "gender":g,
  "dateBirth":db,
  "maritalStatus":m,
  "facebookLink":fl,
  "linkedLink":ll,
  "twitterLink":tl,
  "blogLink":bl
};
    updateData(section,newdata,initial).then((int status) {

       Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> EditSection(section)));



    });
  }
  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> _value = ValueNotifier(data[index]['dateBirth']);


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
        padding: EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: <Widget>[
              Text( data[index]['cvFullName'],style: TextStyle(fontSize: 25.0),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                 controller: new TextEditingController.fromValue(
                                    new TextEditingValue(
                                        text: data[index]['nationality'],
                                        selection: new TextSelection.collapsed(
                                            offset: nationality.length))),
                                onChanged: (val) => nationality = val,
                style: TextStyle(color: Color(0xff232882)),
                scrollPadding: EdgeInsets.all(10.0),
                textAlign: TextAlign.start,
                
                decoration: InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelStyle: TextStyle(color: Color(0xffff1e50)),
                  hintText: 'Example - Indian',
                  labelText: 'Nationality',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                 controller: new TextEditingController.fromValue(
                                      new TextEditingValue(
                                          text: data[index]['gender'],
                                          selection: new TextSelection.collapsed(
                                              offset: gender.length))),
                                  onChanged: (val) => gender = val,
                                  
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                           labelStyle: TextStyle(color: Color(0xffff1e50)),
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
              Padding(
                padding: EdgeInsets.all(10),
              ),
                Container(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10),
                                                    child: Text(
                                                      "Date of Birth", style: TextStyle(color: Color(0xffff1e50)),
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
                                                        width: 150,
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
              Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                 controller: new TextEditingController.fromValue(
                                      new TextEditingValue(
                                          text: data[index]['maritalStatus'],
                                          selection: new TextSelection.collapsed(
                                              offset: maritalStatus.length))),
                                  onChanged: (val) => maritalStatus = val,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                           labelStyle: TextStyle(color: Color(0xffff1e50)),
                      labelText: "Marital Status",
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
                                          text: data[index]['facebookLink'],
                                          selection: new TextSelection.collapsed(
                                              offset: facebookLink.length))),
                                  onChanged: (val) => facebookLink = val,
                style: TextStyle(color: Color(0xff232882)),
                scrollPadding: EdgeInsets.all(10.0),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelStyle: TextStyle(color: Color(0xffff1e50)),
                  hintText: 'https://www.facebook.com/cvDragonIndia/',
                  labelText: 'Facebook Profile Link',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                 controller: new TextEditingController.fromValue(
                                      new TextEditingValue(
                                          text: data[index]['linkedinLink'],
                                          selection: new TextSelection.collapsed(
                                              offset: linkedinLink.length))),
                                  onChanged: (val) => linkedinLink = val,
                style: TextStyle(color: Color(0xff232882)),
                scrollPadding: EdgeInsets.all(10.0),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelStyle: TextStyle(color: Color(0xffff1e50)),
                  hintText: 'https://www.linkedin.com/in/XXX-XXX/',
                  labelText: 'LinkedIn Profile Link',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                 controller: new TextEditingController.fromValue(
                                      new TextEditingValue(
                                          text: data[index]['twitterLink'],
                                          selection: new TextSelection.collapsed(
                                              offset: twitterLink.length))),
                                  onChanged: (val) => twitterLink = val,
                style: TextStyle(color: Color(0xff232882)),
                scrollPadding: EdgeInsets.all(10.0),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelStyle: TextStyle(color: Color(0xffff1e50)),
                  hintText: 'https://twitter.com/cvDragonIndia/',
                  labelText: 'Twitter Profile Link',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                 controller: new TextEditingController.fromValue(
                                      new TextEditingValue(
                                          text: data[index]['blogLink'],
                                          selection: new TextSelection.collapsed(
                                              offset: blogLink.length))),
                                  onChanged: (val) => gender = val,
                style: TextStyle(color: Color(0xff232882)),
                scrollPadding: EdgeInsets.all(10.0),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelStyle: TextStyle(color: Color(0xffff1e50)),
                  labelText: 'Blog Link (if any)',
                ),
              ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                     // update(context, title, description, data[index]);
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
                                           update(context, nationality, gender, dateBirth, maritalStatus, facebookLink, linkedinLink, twitterLink, blogLink, data[index]);
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







