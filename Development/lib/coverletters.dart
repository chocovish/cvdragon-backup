import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './topmenu.dart';
import './sidemenu.dart';
class CoverLetters extends StatefulWidget{

@override
  State<StatefulWidget> createState() {
    
    return _CoverLetters();
  }
}

class _CoverLetters extends State <CoverLetters> {
  @override
  Widget build(BuildContext context) {
    
  
    return Scaffold(appBar: TopMenuBar(),
        //bottomNavigationBar: BottomBar(),
        drawer: SideMenu(),
      body: Center(child: Text("Cover Letters",style: TextStyle(fontSize: 50.0),)),
    );
  }
}
