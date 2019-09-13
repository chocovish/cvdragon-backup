import 'package:cvdragonapp_v1/Custom_dialog.dart';
import 'package:cvdragonapp_v1/maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './Custom_dialog.dart';
import './topmenu.dart';
import './localdatafetch.dart'as lfetch;
import 'dart:convert';
class Institutes extends StatefulWidget {
  Institutes({Key key}) : super(key: key);
  @override
  _Institutes createState() => new _Institutes();
}
class _Institutes extends State<Institutes> {
  List data=[];
   List items=[];
  bool _isLoading=true;
  PageController controller;
  int currentpage = 0;
  @override
  initState() {
    super.initState();
    get();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.9,
    );
  }
  void get()async{

 lfetch.getSections().then((List res) {
      setState(() {
        data=res;
        data.forEach((element){
          items.add(json.decode(element['section'].toString()));
        });
       
        _isLoading = false;
      });
    });
  }
  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        print(index);
        _selectedIndex = index;
      });
    }
    return 
     Container(
       decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/csoon.png'),fit: BoxFit.cover)),
       child: Scaffold(
         backgroundColor: Colors.transparent,
        appBar: TopMenuBar(),
        
       ),
     );
  }
}

     