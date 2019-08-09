import 'package:cvdragonapp_v1/vishBottomBar.dart';
import './localdatafetch.dart' as lfetch;
import 'package:cvdragonapp_v1/sharedfetch.dart';
import 'package:flutter/material.dart';
import './Create_new_profile_Name.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import "./sharedfetch.dart";

String id="";
String authkey="";
List data2;
List data;
int pgindex;
bool isLoading=true;
class Pimage extends StatefulWidget {
  @override
  _Pimage createState() => new _Pimage();
}

class _Pimage extends State<Pimage> {
  PageController controller;
  int currentpage = 0;

  @override
  initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.9,
    );
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return
    Scaffold(
      appBar: TopMenuBar(),
      bottomNavigationBar: MybottomNav(2,"Set"),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.done_outline),onPressed: (){},),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        child: new PageView.builder(
          itemCount: 5,
            onPageChanged: (value) {
                currentpage = value;
                pgindex = currentpage;
                print("Page Index $pgindex");
              
            },
            controller: controller,
            itemBuilder: (context, index) => builder(index)),
            
      ),
    );
  }

  builder(int index) {
    return new AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 0.9;
        if(index==4)
        {
           return new Center(
          child: new SizedBox(
            height: MediaQuery.of(context).size.height / 1.4,
            width: Curves.easeOut.transform(value) * 500,
            child: new Card(
         elevation: 15.0,
        margin: const EdgeInsets.all(8.0),
        color: Colors.black,
        child: 
       
        Center(
          
          child:InkWell(
            onTap: (){
              
            },
                      child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width/1.5,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add_circle,size: 60,color: Colors.white,),
                  Text("Add New Profile",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
       
        
      ),
          ),
          ),
        );
        }
        return new Center(
          child: new SizedBox(
            height: MediaQuery.of(context).size.height / 1.4,
            width: Curves.easeOut.transform(value) * 500,
            child: new Card(
        
        child: 
       
        Center(
          child: Text(index.toString(),style: TextStyle(fontSize: 50),)),
        elevation: 15.0,
        margin: const EdgeInsets.all(8.0),
        color: Colors.red,
        
      ),
          ),
        );
        
      
      },

      
      
    
    );
  }
}
