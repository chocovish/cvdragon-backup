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
            :Container(
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
                                      buttonText: "Okay",
                                    ),
                                  );
                  // Shows the information on Snackbar
                  
          }
                      },
                      
                      
                  child: 
          new Center(
            child: new SizedBox(
              height: MediaQuery.of(context).size.height / 1.4,
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