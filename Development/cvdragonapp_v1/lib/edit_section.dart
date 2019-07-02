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
        backgroundColor: Color(0xff232882),
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
        image: DecorationImage(
            image: AssetImage('assets/cover.png'), fit: BoxFit.fill)),
    child: ListView(
      padding: EdgeInsets.only(bottom: 30.0),
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.yellow),
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  data[ind]['sectionName'],
                  style: TextStyle(color: Color(0xff232882), fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 5,
                    margin: EdgeInsets.only(top: 60),
                    child: Image(image: AssetImage('assets/Basic Info.png')))
              ],
            )
          ],
        ),
        Container(
          height: 200,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: addeddata == null ? 0 : addeddata.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                  elevation: 5.0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          height: MediaQuery.of(context).size.height / 14,
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Text(
                            addeddata[index]['title'].toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 14,
                          width: MediaQuery.of(context).size.width / 8,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => (EditSection2(addeddata,index))));
                            },
                            child: Icon(Icons.mode_edit,
                                size: 30, color: Color(0xff232882)),
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
                            
                                size: 30, color: Color(0xff232882)),
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