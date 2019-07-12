import 'package:cvdragonapp_v1/localdatafetch.dart';
import 'package:cvdragonapp_v1/maps.dart';
import 'package:flutter/material.dart';
import './topmenu.dart';
import './sidemenu.dart';
import './rightpreviewpane.dart';
import './bottombar_createsection.dart';
import './create_section.dart';
import './fetch.dart';
import './edit_section2.dart';


List data = [];
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
List addeddata = [];
List databb = [];
var db0 = ValueNotifier([]);
List key = [];
class _EditSection extends State<EditSection> {
  @override
  void initState() {
    super.initState();
    get();

  }
  void get() async{
    db0.value = [];
    key = [];
    await getKeyPhrases(data[ind]['section'].toString())
        .then((List k) {
      setState(() {
        key = k;
      });
    });

    await getDatabaseAcademicProject(data[ind]['section'].toString())  // DataBase me jo hai vo aa rha hai
        .then((List dd) {
      setState(() {
        databb = dd;
        db0.value += databb;
      });
    });


   await  getAddedAcademicProject(data[ind]['section'].toString())  // Profile me jo hai voh aa rha hai
        .then((List res) {
      setState(() {
        addeddata = res;
        db0.value += addeddata;
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
        body: ValueListenableBuilder(valueListenable: db0, builder: (context,data,child){
          return _buildCardView(context);
        }),
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
                                Navigator.push(context,MaterialPageRoute(builder: (context) => (CreateSection(db0.value,index, data,ind,key, databb,addeddata))));
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
              color: Colors.transparent,
            height: MediaQuery.of(context).size.height/1.8,
            width: MediaQuery.of(context).size.width,
            child:
         ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount:  db0 == null ? 0 : db0.value.length,
              itemBuilder: (BuildContext context, int index) {

                return Card(
                  //color: Colors.transparent,
                  margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                  elevation: 5.0,
                  child: Container(
                    decoration: addeddata.contains(db0.value[index]) ? BoxDecoration(image: DecorationImage(image: AssetImage("assets/Untitled-2.png"),fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(8.0)): BoxDecoration(color: Colors.blue,
                        borderRadius: BorderRadius.circular(4.0)),

                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: <Widget>[
                        Container(

                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          height: MediaQuery.of(context).size.height / 12,
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Text(
                            db0.value[index][AddedDataColumn[(data[ind]['section']).toString()]].toString(),
                            textAlign: TextAlign.center,style: TextStyle(color: Colors.white),
                          ),
                        ),

                        addeddata.contains(db0.value[index]) ? Row(children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 14,
                          width: MediaQuery.of(context).size.width / 8,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => (EditSection2(db0.value,index, data,ind,key, databb,addeddata))));
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

                              addeddata.remove(db0.value[index]);
                              databb.add(db0.value[index]);
                              db0.value = databb+addeddata;

                            deleteFromProfile(data[ind]['section'], addeddata[index][columnName[data[ind]['section'].toString()]].toString());
                          },
                           // onTap: deletefromprofile,
                            child: Icon(Icons.delete,

                                size: 30, color: Colors.white70),
                          ),

                        )])

                            :

                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0),color: Colors.green),
                height: MediaQuery.of(context).size.height / 18,
                width: MediaQuery.of(context).size.width / 4.5,
                child: InkWell(
                onTap: () {

                    databb.remove(db0.value[index]);
                    addeddata.add(db0.value[index]);
                    db0.value = databb+addeddata;

                },
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                  Icon(Icons.add_circle,
                  size: 20, color: Colors.white70),
                   Text("Add",style:TextStyle(color: Colors.white,
                       fontSize: 15.0,
                       fontWeight:
                       FontWeight.bold)),

                ],
                ),
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