import 'package:cvdragonapp_v1/CustomDialogNewProfile.dart';
import 'package:cvdragonapp_v1/home.dart';
import './datapush.dart'as server;
import 'package:cvdragonapp_v1/maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './Custom_dialog.dart';
import './topmenu.dart';
import './localdatafetch.dart'as lfetch;
import 'dart:convert';
  Map<String,dynamic> datatobesent={};
class CardProfiles extends StatefulWidget {
  CardProfiles({Key key}) : super(key: key);
  @override
  _CardProfiles createState() => new _CardProfiles();
}
class _CardProfiles extends State<CardProfiles> {
  TextEditingController con=new TextEditingController();
  List data=[];
   List items=[];
   Map<String,dynamic> totaldata={};
 
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
datatobesent={};
 List data=await lfetch.getSections();
        for(var element in data)
        {
          String it=element['section'].toString();
          if(it!="51100"&&it!="51101"&&it!="51102"&&it!="51103"&&it!="51109")
         {
          items.add(json.decode(it));
          List d1= await lfetch.getDefaultSection(element['section'].toString());
          totaldata[element['section'].toString()]=d1;
        }
        }
       setState(() {
         totaldata={};
        _isLoading = false;
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
                Column(
                  children: <Widget>[
                    Container(
                      
                      decoration: BoxDecoration(color: Colors.deepPurple),
                      height: MediaQuery.of(context).size.height/2.5,
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: Text("CHOOSE YOUR SECTIONS !",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),))
                    ),
                    RaisedButton(child: Text("click to create"),
                  
                    onPressed: ()async{
                      print(datatobesent.toString());
                      String x=await server.createProfile(datatobesent,con.text.toString());
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePagee()));


                    },),
                    TextField(controller: con,)
                  ],
                ),
            
            
            
            Container(
               height: MediaQuery.of(context).size.height/2,
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
                                    builder: (BuildContext context) => CustomDialogNewProfile(
                                      title:Sections[secid],
                                      description: totaldata[secid],
                                      buttonText: "Submit",
                                      sectionId: secid,
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