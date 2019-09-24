//import 'package:cvdragonapp_v1/Sections/BasicInfo.dart' as BI;
import 'package:cvdragonapp_v1/sync.dart';
import 'package:flutter/cupertino.dart';
import 'package:cvdragonapp_v1/localdatafetch.dart';
import 'package:cvdragonapp_v1/maps.dart';
import 'package:cvdragonapp_v1/vishal/ProfileImage.dart';
import 'package:cvdragonapp_v1/vishal/sections/ContactDetailsForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/IntroductionForm.dart';
import './Notifiers.dart';

import 'package:flutter/material.dart';
import './topmenu.dart';
import './vishal/ProfileImage.dart';
import './sidemenu.dart';
import './rightpreviewpane.dart';

import './create_section.dart';

import './edit_section2.dart';

import './maps.dart';
import './vishBottomBar.dart';
import './cvwebview.dart';
import './Edit_Section_Educational_Background.dart';

import './vishal/sections/BasicInfo.dart';

String section = '';

class EditSection extends StatefulWidget {
  //EditSection({Key key}) : super(key: key);
  @override
  EditSection(String sectionid) {
    section = sectionid;
  }
  State<StatefulWidget> createState() {
    return _EditSection();
  }
}
Map colors={
'51099':{'c1':0xffd1ca46,'c2':0xffecec9e},
'51100':{'c1':0xffef6c3e,'c2':0xff530d27},
'51101':{'c1':0xffe11f2a,'c2':0xffb6295e},
'51102':{'c1':0xfffcaa20,'c2':0xff583861},
'51103':{'c1':0xff32b547,'c2':0xff4b8ab5},
'51104':{'c1':0xff111d37,'c2':0xff3b86a6},
'51105':{'c1':0xffee438f,'c2':0xfffdb723},
'51106':{'c1':0xffb1d66f,'c2':0xff95d3bc},
'51107':{'c1':0xffe0365d,'c2':0xff9093b2},
'51108':{'c1':0xff51286a,'c2':0xff1c0f29},
'51109':{'c1':0xff283890,'c2':0xff7fa7da},
'51110':{'c1':0xfff8e690,'c2':0xfff36865},
'51111':{'c1':0xff47397d,'c2':0xffef4c61},
'51112':{'c1':0xff005e91,'c2':0xffebcd17},
'51113':{'c1':0xff5158a8,'c2':0xff00491e},
'51114':{'c1':0xfff05326,'c2':0xfff7ad30},
'51115':{'c1':0xffef383c,'c2':0xff145745},
'51116':{'c1':0xffd2d61f,'c2':0xff2d7f4f},
'51117':{'c1':0xfff6aa30,'c2':0xff854337},
'51118':{'c1':0xff17b7ab,'c2':0xffeb4752},
'51119':{'c1':0xff492e41,'c2':0xffc35352},
'51120':{'c1':0xffee5e82,'c2':0xff7e7ab5},
'51121':{'c1':0xffb2202d,'c2':0xfff7cfac},
'51122':{'c1':0xffbd3567,'c2':0xff3a2e6e},
'51123':{'c1':0xff1c6473,'c2':0xff569f67},
'51125':{'c1':0xffffda47,'c2':0xffe7193f},
'51126':{'c1':0xffaabade,'c2':0xff473694},
};

List addeddata ;
List databb ;
ValueNotifier<List> db0 = ValueNotifier(null);
List key;
List faq;
class _EditSection extends State<EditSection> {
  everythingSynced(BuildContext context) {
    CupertinoAlertDialog d = CupertinoAlertDialog(
      content: Text("Everything is synchronized properly"),
      actions: <Widget>[
        CupertinoButton(
          child: Text("Great!"),
          onPressed: Navigator.of(context).pop,
        )
      ],
    );

    showCupertinoDialog(context: context, builder: (_) => d);
  }
  bool pageLoading = true;
  
  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    // databb = [];
    // addeddata = [];
    // db0.value = [];
    
    key = await getKeyPhrases(section);
    faq=await getFAQ(section);
    databb =  await getDatabase(section); // DataBase me jo hai vo aa rha hai
    
    print("DB0 IS ${db0.value}");

    addeddata = await getAddedData(section);
    db0.value =  addeddata;
  db0.value+=databb;
    print("NOW DB0 IS ${db0.value}");

    setState(() {
     pageLoading = false; 
    });
  
    // await getAddedData(section) // Profile me jo hai voh aa rha hai
    //     .then((List res) {
    //   setState(() {
    //     addeddata = res;
    //     db0.value += addeddata;
    //     isLoading = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    print(pageLoading);
    return pageLoading
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
        :Container(
          decoration: BoxDecoration(
           image: DecorationImage(image: AssetImage('assets/allsecbg.png'),fit: BoxFit.cover)
            // gradient: LinearGradient(colors: 
            // [
            //   Color(colors[section]['c1']),
            //   Color(colors[section]['c2']),

            // ])
          ),
          child: 
            Scaffold(
            backgroundColor: Colors.transparent,
            // appBar:(section != "51100")&&(section != "51101")&&(section != "51102")&&
            // (section != "51103")? TopMenuBar():null,
            
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.pinkAccent,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return CVView();
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
            drawer: SideMenu(),
           
          
            
            bottomNavigationBar: MybottomNav(-1),
            body:(section != "51100")&&(section != "51101")&&(section != "51102")&&
             (section != "51103")? NestedScrollView(
        headerSliverBuilder: (context,bool ibs)=>[
          SliverAppBar( 
       
            backgroundColor: Colors.transparent,
            actions: <Widget>[
        ValueListenableBuilder(
          valueListenable: syncOnGoing,
          builder: (context, loading, child) => loading
              ? Padding(
                  padding: EdgeInsets.only(right: 14),
                  child: CupertinoActivityIndicator(),
                )
              : ValueListenableBuilder(
                  valueListenable: syncNotifier,
                  builder: (context, shouldUpdate, child) => !shouldUpdate
                      ? IconButton(
                          onPressed: () {
                            everythingSynced(context);
                          },
                          icon: Icon(
                            Icons.done_outline,
                            color: Colors.white,
                            size: 14,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            syncthedata(context);
                          },
                          icon: Icon(
                            Icons.sync,
                            color: Colors.white,
                          ),
                          tooltip: 'Sync',
                        ),
                ),
        )
      ],
            //backgroundColor: Colors.blue,
            expandedHeight: 150.0,
            floating: false,
            pinned: true,
            flexibleSpace: Container(decoration: BoxDecoration(
          //     gradient: LinearGradient( 
              
          // colors: 
          //   [    
          //     // Colors.black,
          //     // Colors.black,  
          //     Color(colors[section]["c1"]),
          //     Color(colors[section]["c2"]),
          //       ]
          //       )
                ),
              child: Container(
                color: Colors.white.withOpacity(0.25),
                child: FlexibleSpaceBar(
                  title:
                 Text(
                   Sections[section],
                   style: TextStyle(
                     fontWeight: FontWeight.w300,
                     fontSize: 16,
                     letterSpacing: 1.5),
                     ),
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    // Icon(Icons.work,size: 50,color: Colors.white,)
                    Image.asset('assets/idk2.png',height:80,width:80)
                  ],),
                centerTitle: true,
                )
                )
                ),
          )
        
          
        ],
          body:  ValueListenableBuilder(
                  valueListenable: db0,
                  builder: (context, data, child) {
                  //   if (section == "51102")
                  //     return ProfileImageUpload();
                  //   else if (section == "51100")
                  //   return BasicInfo(i: db0.value[0]);
                    
                  //   else if (section == "51109") //return EducationalBackgroundForm(i: db0.value[1]);
                  //     return EditSectionEB(section);
                  //   else if (section=="51101") return ContactDetailsForm(i: db0.value[0]);
                  //   else if(section=="51103") return IntroductionForm(i: db0.value[0]);
                    
                  //   else
                      return _buildCardView(context);
                  }),
            ): ValueListenableBuilder(
                valueListenable: db0,
                  builder: (context, data, child) {
                    if (section == "51102")
                      return ProfileImageUpload();
                    if (section == "51100")
                    return BasicInfo(i: db0.value[0]);
                    if (section == "51109") //return EducationalBackgroundForm(i: db0.value[1]);
                      return EditSectionEB(section);
                     if (section=="51101") return ContactDetailsForm(i: db0.value[0]);
                     if(section=="51103") return IntroductionForm(i: db0.value[0]);
                  }
            ),
 )
        );
          
  }
}

Widget _buildCardView(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/20,right:  MediaQuery.of(context).size.width/20),
    decoration: BoxDecoration(color: Colors.transparent),
    child: ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top:10)),
                Container(
                  margin: EdgeInsets.only(right: 8,left: 5),
                 //     top: MediaQuery.of(context).size.height /25, right: 5),
                  //padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/20,right: MediaQuery.of(context).size.width/25),
                  alignment: Alignment.centerRight,
                   height: MediaQuery.of(context).size.height/20,
                 // padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 2.5,
//                              alignment: FractionalOffset.center,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5.0),
                              border: new Border.all(color: Colors.transparent)),
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => (CreateSection(
                              //             db0.value,
                              //             index,
                              //             section,
                              //             key,
                                          
                              //             databb,
                              //             addeddata,
                              //             faq))));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.help,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                Text(
                                  "Know More",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 2.5,
//                              alignment: FractionalOffset.center,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5.0),
                              border: new Border.all(color: Colors.transparent)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (CreateSection(
                                          db0.value,
                                          index,
                                          section,
                                          key,
                                          
                                          databb,
                                          addeddata,
                                          faq))));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.add_circle,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                Text(
                                  "Add New Data",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
//               ],
//             ),
//           ),
//         ),
        Container(
          
          margin: EdgeInsets.only(top: 0),
          color: Colors.transparent,
          height: MediaQuery.of(context).size.height / 1.8,
          width: MediaQuery.of(context).size.width/2,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: db0 == null ? 0 : db0.value.length,
              itemBuilder: (BuildContext context, int index) {
                return  Card(
                        color: addeddata.contains(db0.value[index])?Colors.white.withOpacity(0.42):Colors.white.withOpacity(0.25),
                        margin: EdgeInsets.only(top: 15, left: 5, right: 5),
                        elevation: 15.0,
                        child: Container(
                          
                            width: MediaQuery.of(context).size.width/3,
                        
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                InkWell(

                                 splashColor: Colors.pink,
                
                 onTap: (){
                              Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (CreateSection(
                          db0.value,
                          index,
                          section,
                          key,
                          databb,
                          addeddata,
                          faq))));
                           
                            },

                            child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  // height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width /1.5,
                  child: Text(
                      db0.value[index][AddedDataColumn[section]]
                          .toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),
                    ),
                ),
                                ),
                                Padding(padding:EdgeInsets.only(right:10),),
                                addeddata.contains(db0.value[index])
                  ? Row(children: <Widget>[
                      InkWell(
                        onTap: () async {
                          print(index);
                          await deleteFromProfile(
                          section,
                          db0.value[index][columnName[section]]
                              .toString());
                          addeddata.remove(db0.value[index]);
                          databb.add(db0.value[index]);
                          db0.value = addeddata+databb;
                        },
                        // onTap: deletefromprofile,
                        child: Icon(Icons.delete,
                        size: 30, color: Colors.black),
                      )
                    ])
                  : InkWell(
                    onTap: () async {
                      await addintoProfile(
                        section,
                        db0.value[index][columnName[section]]
                            .toString());
                      databb.remove(db0.value[index]);
                      addeddata.add(db0.value[index]);
                      db0.value =  addeddata+databb;
                    },
                    child: Row(
                      mainAxisAlignment:
                        MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.add_circle,
                          size: 30, color: Colors.green),
                     
                      ],
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
