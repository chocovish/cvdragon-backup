import 'package:cvdragonapp_v1/Configure_your_Profile.dart';
import 'package:cvdragonapp_v1/CustomDialogNewProfile.dart';
import 'package:cvdragonapp_v1/home.dart';
import './datapush.dart'as server;
import 'package:cvdragonapp_v1/maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './Custom_dialog.dart';
import './profile_sections.dart';
import './topmenu.dart';
import './maps.dart';
import './localdatafetch.dart'as lfetch;
import 'dart:convert';
  Map<String,dynamic> datatobesent={};
  List data=[];
 
class AddNewSection extends StatefulWidget {
 // CardProfiles({Key key}) : super(key: key);
  AddNewSection(List pdata) {
    data = pdata;
  }
  @override
  _AddNewSection createState() => new _AddNewSection();
}
class _AddNewSection extends State<AddNewSection> {
  TextEditingController con=new TextEditingController();
  
   Map<String,dynamic> totaldata={};
 
  bool _isLoading=false;
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
  List d3=[];
  void get()async{
  datatobesent={};
 List  data2=await lfetch.getSections();
 print("data="+data.toString());
 print("data2="+data2.toString());
  // List d4=[];
  
  // List d5=[];
  // data2.forEach((e){
  //   d5.add(e['section'].toString());

  // });
  
  // for (var element in d5){
  //   if (d4.contains(element)==false){
  //     d3.add(element);
  //   }
  // }
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
      
      body: Container(
        color: Colors.black,
        child: 
        // _isLoading
        //       ? DecoratedBox(
        //           decoration: BoxDecoration(
        //               image: DecorationImage(
        //                   image: AssetImage("assets/cover.png"),
        //                   fit: BoxFit.fill)),
        //           child: Center(
        //               child: Image(
        //                   image: AssetImage("assets/logocv.gif"),
        //                   height: MediaQuery.of(context).size.height/12,
        //                   width: MediaQuery.of(context).size.width/6)),
        //         )
        //       : 
              ListView(children:<Widget>[Column(
                
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
                    height: MediaQuery.of(context).size.height/2.5,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[

                        Container(
                           padding: EdgeInsets.all(10),
                          child:Align(alignment: Alignment.topRight,
                          child: Text("Step 2/3",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.bold),),)),
                          Padding(padding: EdgeInsets.only(bottom: 5),),
                          Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.person,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),
                   
                     Align(
                      alignment: Alignment.center,
                      child: Text("CHOOSE YOUR SECTIONS",
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
                 height: MediaQuery.of(context).size.height/3,
          child: new PageView.builder(
            
            itemCount: d3.length,
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
              ],
              ),
      ),
    );
  }
  builder(int index) {
  
    return new AnimatedBuilder(
      
      animation: controller,
      builder: (context, child) {
        double value = 0.9;
         var item = d3[index].toString();

         if(d3[index]=='Add a New Section'){
           return new Center(
            child: new SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: Curves.easeOut.transform(value) * 500,
              child: new Container(
                decoration: BoxDecoration(
               gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFf45d27),
                      Color(0xFFf5851f)
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                     Radius.circular(20)),
                ),
                margin: const EdgeInsets.all(8.0),
                child:
                  Center(
          
          child:InkWell(
              onTap: (){
                 Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (ProfileSections())));
              },
                      child: Container(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width/1.5,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.chevron_right,size: 40,color: Colors.white,)),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Continue".toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                ],
              ),
            ),
          ),
       
        
      ),
        
      ),
            ),
           );
         
      
      
         }

         else{
        return Dismissible(direction: DismissDirection.vertical, key: Key(item),     
        onDismissed: (direction ) {
          if (direction == DismissDirection.up){
                  // Removes that item the list on swipwe
                  setState(() {
               
                 d3.removeAt(index);
                 
                  });
                  // Shows the information on Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(" dismissed")));
                     
          }
          if (direction == DismissDirection.down){
            var secid ="";
                  // Removes that item the list on swipwe
                  setState(()  {
                    secid=d3[index].toString();
                 d3.removeAt(index);
                   
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
              child: Container(
                decoration: BoxDecoration(
               gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFf45d27),
                      Color(0xFFf5851f)
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                     Radius.circular(20)),
                ),
        child: Align(
          alignment: Alignment.center,
          child: Text( Sections[
                                                    d3[index].toString()]
                                                .toString(),style: TextStyle(fontSize: 25,color:Colors.white, fontWeight:FontWeight.bold),)),
        //elevation: 15.0,
        margin: const EdgeInsets.all(8.0),
        
        
      ),
            ),
          ),
        );
         }
         
      },
    
    );
  }
}




