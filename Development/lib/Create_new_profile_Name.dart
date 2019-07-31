import 'package:cvdragonapp_v1/Custom_dialog.dart';
import 'package:cvdragonapp_v1/edit_section.dart' as prefix0;
import 'package:cvdragonapp_v1/maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './Custom_dialog.dart';
import './topmenu.dart';
import './maps.dart';
import './vishal/myFormFields.dart';
import './localdatafetch.dart'as lfetch;
import './CardView_NewProfile.dart';
import 'dart:convert';


class CardProfilesName extends StatefulWidget {
  @override
  _CardProfilesName createState() => new _CardProfilesName();
}

bool _isLoading=false;
String pname = "";
class _CardProfilesName extends State<CardProfilesName> {
   var pnameController = TextEditingController();
@override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TopMenuBar(),
      
      body: Container(
        color: Colors.black,
        child: _isLoading
              ? DecoratedBox(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/cover.png"),
                          fit: BoxFit.fill)),
                  child: Center(
                      child: Image(
                          image: AssetImage("assets/logocv.gif"),
                          height: MediaQuery.of(context).size.height/12,
                          width: MediaQuery.of(context).size.width/6)),
                )
              : ListView(children:<Widget>[Column(
                
                children:<Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                     decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFf45d27),
                      Color(0xFFf5851f)
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(90)
                  )
                ),
                    height: MediaQuery.of(context).size.height/2.2,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[

                        Container(
                           padding: EdgeInsets.all(10),
                          child:Align(alignment: Alignment.topRight,
                          child: Text("Step 1/3",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.bold),),)),
                          Padding(padding: EdgeInsets.only(bottom: 10),),
                          Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.person,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),
                   
                     Align(
                      alignment: Alignment.center,
                      child: Text("NAME YOUR PROFILE",
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,fontSize: 25),),
                    ),
                        // Container(
                        //   height: MediaQuery.of(context).size.height/3,
                        //   child: Center(
                        //     child: Text("NAME YOUR PROFILE !",
                        //     style: TextStyle(color: Colors.white,
                        //     fontWeight: FontWeight.bold,fontSize: 25),))),
                      ],
                    )
                  ),

                Container(
                      margin: EdgeInsets.only(top: 30,bottom: 30),
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50)
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5
                          )
                        ]
                      ),
                      child: TextField(
                         controller: pnameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.person_outline,
                              color: Colors.grey,
                          ),
                            hintText: 'Name',
                        ),
                      ),
                    ),


                InkWell(
                  onTap: (){
                    if(pnameController.text=="")
                        {
                          showDialog(context: context,
                          child:Dialog(backgroundColor: Colors.transparent,elevation: 20,
                          child: Text("Please Enter Your Profile Name",style: TextStyle(color: Colors.red)),));
                        }
                        else{
                     Navigator.of(context).push(
                MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return CardProfiles();
                  }));
                  }
                  
                  },
                                  child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width/1.2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFf45d27),
                                Color(0xFFf5851f)
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50)
                            )
                          ),
                          child: Center(
                            child: Text('Continue'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                ),
                // OutlineButton(
                //   onPressed: (){
                //      if(pname=="")
                //         {
                //           showDialog(context: context,
                //           child:Dialog(backgroundColor: Colors.transparent,elevation: 20,
                //           child: Text("Please Enter Your Profile Name",style: TextStyle(color: Colors.red)),));
                //         }
                //         else{
                //      Navigator.of(context).push(
                // MaterialPageRoute<Null>(builder: (BuildContext context) {
                //   return CardProfiles();
                //   }));
                //   }
                //   },
                //   textColor: Colors.black,splashColor: Colors.yellow,
                //   color: Colors.orange,
                // child: Text("  Continue  "),)
                ]
              ),
              ],
              ),
      )
    );
  }
}
