import 'package:cvdragonapp_v1/Custom_dialog.dart';
import 'package:cvdragonapp_v1/edit_section.dart' as prefix0;
import 'package:cvdragonapp_v1/maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './Custom_dialog.dart';
import './topmenu.dart';
import './maps.dart';
import './localdatafetch.dart'as lfetch;
import 'dart:convert';

String section='';
class CardProfiles extends StatefulWidget {
  CardProfiles({Key key}) : super(key: key);
  @override
  _CardProfiles createState() => new _CardProfiles();
}

bool isLoading = true;
 List data=[];
  List databb = [];
  var db0 = [];
  List addeddata=[];
   List items=[];
  bool _isLoading=true;
  PageController controller;
  int currentpage = 0;

class _CardProfiles extends State<CardProfiles> {
 
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
     addeddata=[];

  lfetch.getDatabase(section)  // DataBase me jo hai vo aa rha hai
        .then((List dd) {
      setState(() {
        databb = dd;
        db0 += databb;
      });
    });

lfetch.getAddedData(section)  // Profile me jo hai voh aa rha hai
        .then((List res) {
      setState(() {
        addeddata = res;
        db0 += addeddata;
        isLoading=false;
      });
    });

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
     Scaffold(
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
                  
                  decoration: BoxDecoration(color: Colors.deepPurple),
                  height: MediaQuery.of(context).size.height/2.5,
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: Text("CHOOSE YOUR SECTIONS !",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),))
                ),
            
            
            
            Container(
               height: MediaQuery.of(context).size.height/3,
        child: new PageView.builder(
          
          itemCount: items.length,
            onPageChanged: (value) {
              setState(() {
                currentpage = value;
              });
            },
            controller: controller,
            itemBuilder: (context, index) => builder(index)),
            
      ),
              ],
            ),
    );
  }
  builder(int index) {
  
    return new AnimatedBuilder(
      
      animation: controller,
      builder: (context, child) {
        double value = 0.9;
         var item = items[index].toString();
        return Dismissible(direction: DismissDirection.vertical, key: Key(item),     
        onDismissed: (direction ) {
          if (direction == DismissDirection.up){
                  // Removes that item the list on swipwe
                  setState(() {
               
                 items.removeAt(index);
                 
                  });
                  // Shows the information on Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(" dismissed")));
                     
          }
          if (direction == DismissDirection.down){
            var secid ="";
                  // Removes that item the list on swipwe
                  setState(()  {
                    secid=items[index].toString();
                 items.removeAt(index);
                   
                  });
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("dismissed")));
                      return showDialog(
                                    context: context,
                                    builder: (BuildContext context) => CustomDialog(
                                      title:Sections[secid],
                                      description: "Hello Moto",
                                      buttonText: "Submit",
                                    ),
                                  );
                  // Shows the information on Snackbar
                  
          }
                      },
                      
                      
                  child: 
          new Center(
            child: new SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: Curves.easeOut.transform(value) * 500,
              child: child,
            ),
          ),
        );
      },
      child: new Card(
        child: Text(items[index].toString()),
        elevation: 15.0,
        margin: const EdgeInsets.all(8.0),
        color: Colors.blueGrey,
        
      ),
    );
  }
}