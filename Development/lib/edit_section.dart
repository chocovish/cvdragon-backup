import 'package:cvdragonapp_v1/localdatafetch.dart';
import 'package:cvdragonapp_v1/maps.dart';
import 'package:flutter/material.dart';
import './topmenu.dart';
import './sidemenu.dart';
import './rightpreviewpane.dart';
import './bottombar_createsection.dart';
import './Custom_dialog.dart';
import './Custom_dialog_KeyPhrases.dart';
import './create_section.dart';
import './fetch.dart';
import './edit_section2.dart';


List data;
int ind;
class EditSection extends StatefulWidget {
  @override
  EditSection(List d, int i) {
    data = d;
    ind = i;
  }
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditSection();
  }
}
bool isLoading = true;
//Map<String, dynamic> faq;
//List keyPhrases;
List addeddata;
class _EditSection extends State<EditSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  void get() {
    getAddedAcademicProject(data[ind]['section'].toString())
        .then((List res) {
      setState(() {
        addeddata = res;
        isLoading=false;
      });
    });
  }
  void _selectedTab(int index) {
    setState(() {
      print(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      isLoading
          ? DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/cover.png"), fit: BoxFit.fill)),
        child: Center(
            child: Image(
                image: AssetImage("assets/logocv.gif"),
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width / 6)),
      )
          :
      Scaffold(
        backgroundColor: Colors.black,
        appBar: TopMenuBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        endDrawer: PreviewPane(),
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
            FABBottomAppBarItem(iconData: Icons.swap_vert, text: 'Profiles'),
            FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          ],
        ),
        body: _buildCardView(context),
      );
  }
}
Widget _buildCardView(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white),
    child: ListView(
      padding: EdgeInsets.only(bottom: 30.0),
      children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height/4.4,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration( image: DecorationImage(
                  image: AssetImage('assets/Work Details.png'),alignment: Alignment.topCenter,fit: BoxFit.scaleDown )),
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/20),
                child: Column(
                  children: <Widget>[
                  Text(
                    data[ind]['sectionName'],
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                    textAlign: TextAlign.center,

                  ),

                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/16,right: 5),
                    //padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/20,right: MediaQuery.of(context).size.width/25),
                    alignment: Alignment.bottomRight,
                   // height: MediaQuery.of(context).size.height/8.3,
                    //padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
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
                                3.5,
//                              alignment: FractionalOffset.center,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                BorderRadius.circular(30.0),
                                border: new Border.all(
                                    color: Colors.white)),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context) => (CreateSection(addeddata,index, data,ind))));
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
                                    "Add Data",
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
                  ),

                ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 5),

            height: MediaQuery.of(context).size.height/1.8,
            width: MediaQuery.of(context).size.width,
            child:
         ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: addeddata == null ? 0 : addeddata.length,
              itemBuilder: (BuildContext context, int index) {

                return Card(
                  color: Colors.transparent,
                  margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                  elevation: 5.0,
                  child: Container(
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/Untitled-2.png"),fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10.0)),

                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: <Widget>[
                        Container(

                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          height: MediaQuery.of(context).size.height / 12,
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Text(
                            addeddata[index][AddedDataColumn[(data[ind]['section']).toString()]].toString(),
                            textAlign: TextAlign.center,style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 14,
                          width: MediaQuery.of(context).size.width / 8,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => (EditSection2(addeddata,index, data,ind))));
                            },
                            child: Icon(Icons.mode_edit,
                                size: 30, color: Colors.white70),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 14,
                          width: MediaQuery.of(context).size.width / 8,
                          child: InkWell(onTap: (){
                            print(index);
                            deleteFromProfile(data[ind]['section'], addeddata[index][columnName[data[ind]['section'].toString()]].toString());
                          },
                           // onTap: deletefromprofile,
                            child: Icon(Icons.delete,

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