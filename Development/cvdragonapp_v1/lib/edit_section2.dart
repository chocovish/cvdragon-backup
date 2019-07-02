import 'package:flutter/material.dart';
import './topmenu.dart';
import './sidemenu.dart';
import './rightpreviewpane.dart';
import './bottombar_createsection.dart';
import './Custom_dialog.dart';
import './Custom_dialog_KeyPhrases.dart';
import './fetch.dart';
import './localdatapush.dart';

int index;
String database;
String y;
var data=[];
class EditSection2 extends StatefulWidget {
  @override

  EditSection2(List d,int i)
  {
    data=d;
    index=i;
  }
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditSection2();
  }
}

//bool isLoading = true;
Map<String, dynamic> faq;
List keyPhrases;

class _EditSection2 extends State<EditSection2> {


  @override


  void _selectedTab(int index) {
    setState(() {
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var title =  data[index]['title'];
    var description = data[index]['description'];
    // TODO: implement build
    update(String t,String d,Map<String,dynamic> initial) {

      updateAcademicProject(t,d,initial).then((int status){
        setState(() {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      });

    }
    return
      Scaffold(
        backgroundColor: Colors.white,
        appBar: TopMenuBar(),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<Null>(
                builder: (BuildContext context) {
                  return PreviewPane();
                },
              ),
            );
          },
          child: Icon(
            Icons.visibility,
            color: Colors.white,
          ),
          elevation: 0.0,
        ),
        // bottomNavigationBar: BottomBar(),
        drawer: SideMenu(),
       // endDrawer: PreviewPane(),
        bottomNavigationBar: FABBottomAppBar(
          onTabSelected: _selectedTab,
          notchedShape: CircularNotchedRectangle(),
          color: Colors.white30,
          centerItemText: "Preview",
          backgroundColor: Color(0xff232882),
          selectedColor: Colors.white,
          items: [
            FABBottomAppBarItem(
                iconData: Icons.import_contacts, text: 'Knowledge'),
            FABBottomAppBarItem(iconData: Icons.edit, text: 'Sections'),
            FABBottomAppBarItem(
                iconData: Icons.swap_vert, text: 'Profiles'),
            FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          ],
        ),
    body: NestedScrollView(
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
    SliverAppBar(automaticallyImplyLeading: false,backgroundColor: Colors.black,


    expandedHeight: 140.0,
    floating: false,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
    centerTitle: true,
    title: Text("Academic Projects",
    style: TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    )),
    background:
      Image.asset('assets/final structure-02.png'),

    )
    ),
    ];
    },
body:
        Container(

            child: ListView(
                padding:
                EdgeInsets.only(bottom: 30.0),
                children: <Widget>[


                  Card(
                    elevation: 5.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only( top: 5.0,bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
//                            showDialog(
//                              context: context,
//                              builder: (BuildContext context) => CustomDialog(
//                                title: "FAQs",
//                                description: faq['faq'].toString(),
//                                buttonText: "Okay",
//                              ),
//                            );
                                },
                                child: Container(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 18,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 4,
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
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 18,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 4,
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
                                    builder: (BuildContext context) =>
                                        CustomDialog(
                                          title: "DataBase",
                                          description: "Data Aaoo, Hum Darte Hai Kya ?",
                                          buttonText: "Okay",
                                        ),
                                  );
                                },
                                child: Container(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 18,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 4,
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


                          child: Column(
                            children: <Widget>[
                              Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 1.2,
                                  child: TextField(
                                    //initialValue: myController.text,
                                    controller: new TextEditingController.fromValue(new TextEditingValue(text: title,selection: new TextSelection.collapsed(offset: title.length-2))),
                                    onChanged: (val) => title = val,
                                    //autofocus: true,
                                    style: TextStyle(color: Color(0xff232882)),
                                    decoration: InputDecoration(
                                        labelStyle: TextStyle(
                                            color: Color(0xffff1e50)),
                                        labelText: 'Academic Project Title',

                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                10))),
//                                  validator: (value) {
//                                    if (value.isEmpty) {
//                                      return 'Please enter a name';
//                                    }
//                                  },
                                  )),
                              Padding(
                                padding: EdgeInsets.all(10),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: TextField(
                                  controller: new TextEditingController.fromValue(new TextEditingValue(text: description,selection: new TextSelection.collapsed(offset: description.length-2))),
                                  onChanged: (val) => description = val,
                                  //autofocus: true,
                                  // initialValue: myController2.text,
                                  style: TextStyle(color: Color(0xff232882)),
                                  scrollPadding: EdgeInsets.all(10.0),
                                  maxLines: 15,
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10)),
                                      labelStyle: TextStyle(
                                          color: Color(0xffff1e50)),
                                      labelText: 'Brief Description about the project'),
//                                validator: (value) {
//                                  if (value.isEmpty) {
//                                    return 'Please enter a name';
//                                  }
//                                },
                                ),
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
                                            borderRadius: BorderRadius.circular(
                                                30.0),
                                            border: new Border.all(
                                                color: Colors.white)),
                                        child: InkWell(
                                          onTap: () {
                                            update(title,description,data[index]);
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(
                                                    right: 5),
                                                child: Icon(
                                                  Icons.add_circle,
                                                  color: Colors.white,
                                                  size: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .aspectRatio * 40,
                                                ),
                                              ),
                                              Text(
                                                "Add Section",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight
                                                        .bold),
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
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4, right: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white),
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 3,
                    //width: MediaQuery.of(context).size.width/1.4,
                    //child: Scrollbar(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      //itemCount: data == null ? 0 : data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2,
                          child:

                          Card(
                            margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                            elevation: 5.0,

                            child:
                            Container(
                              alignment: Alignment.bottomCenter,
                              // width: MediaQuery.of(context).size.width/1.6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0)),
                              padding: EdgeInsets.only(left: 10),
                              //child: Align(alignment: Alignment.center,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 14,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width / 1.7,
                                    child: Text(
                                      "First Data", textAlign: TextAlign.center,),
                                  ),
                                  Container(

                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 14,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width / 8,
                                    child: InkWell(
                                      onTap: () {
                                        //Navigator.push(context,MaterialPageRoute(builder: (context) => (CreateSection('section'))));
                                      },
                                      child:
                                      Icon(Icons.mode_edit, size: 30,
                                          color: Color(0xff232882)),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 14,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width / 8,
                                    child: InkWell(
                                      onTap: () {},
                                      child:
                                      Icon(Icons.delete, size: 30,
                                          color: Color(0xff232882)),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ),


                        );
//
//
                      },

                    ),
                  ),


                ])),
    ),
      );
  }


}