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
    
  
    return  Container(
       decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/csoon.png'),fit: BoxFit.cover)),
       child: Scaffold(
         backgroundColor: Colors.transparent,
        appBar: TopMenuBar(),
        
       ),
     );
  }
}