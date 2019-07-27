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
class _CardProfilesName extends State<CardProfilesName> {
@override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TopMenuBar(),
      
      body: _isLoading
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
            : Column(
              
              children:<Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(color: Colors.deepPurple),
                  height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: Text("NAME YOUR PROFILE !",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),))
                ),

               Container(
                 padding: EdgeInsets.only(bottom: 10),
                // height: MediaQuery.of(context).size.height/2.8,
                 child: Align(alignment:Alignment.center, child: myTextField("Enter Your Profile Name",))),

              OutlineButton(
                onPressed: (){
                   Navigator.of(context).push(
              MaterialPageRoute<Null>(builder: (BuildContext context) {
                return CardProfiles();
                }));
                },
                textColor: Colors.black,splashColor: Colors.yellow,
                color: Colors.orange,
              child: Text("  Continue  "),)
              ]
            )
    );
  }
}
