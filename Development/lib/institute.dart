import 'package:cvdragonapp_v1/Colors.dart' as prefix0;
import 'package:cvdragonapp_v1/Create_New_Section/Create_Achievments.dart';
import 'package:cvdragonapp_v1/Custom_dialog.dart';
import 'package:cvdragonapp_v1/Sections/Work_Projects.dart';
import 'package:cvdragonapp_v1/maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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

  String _date = "Not set";
  List data=[];
   List items=[];
  Map<String, List<DropdownMenuItem<String>>> listData = {};
   Map d={
     "department":['cse','ece'],
     "gender":['male','female'],
     
     "year":['2020','2021'],

   };
  //  List<String> data1 = [
  //    'item 1' , 'item 1' , 'item 1' , 'item 1'
  //  ];
    String selected = null;
     
   void lodData(){
   // listData =[];
   d.forEach((k,e){
     listData[k] = e.map((val)=>DropdownMenuItem<String>(
     child: Text(val),value: val,
  )).toList();
   
   });
   }
  
   TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
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
    lodData();
    void _onItemTapped(int index) {
      setState(() {
        print(index);
        _selectedIndex = index;
      });
    }
    return 
     Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: TopMenuBar(),
        
      body:SingleChildScrollView (
              child: Container(
          
         // width:MediaQuery.of(context).size.width/4,
         padding: EdgeInsets.all(15.0),
      //  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.5,),
        
         margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/5),
     //  height: MediaQuery.of(context).size.height/10,
         // width: MediaQuery.of(context).size.height/2,
        
          color: Colors.white,
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                   labelText: 'Name',
                  hintText: 'Name'
                ),
                keyboardType: TextInputType.text,
                controller: nameController,
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/30),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    
                  ),
                  labelText: 'Email',
                  hintText: 'Email'
                ),
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                
              ),
               Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/35),
              ),
               Container(
                 alignment: Alignment.centerLeft,
                      child:DropdownButtonHideUnderline(
                     child: DropdownButton(
              value: selected,
            items:listData['gender'],
         // icon: Icon(Icons.arrow_downward),
             iconSize: 40,
          //elevation: 16,
         // style: TextStyle(
          //  color: Colors.deepPurple
        //  ),
        hint: Text('Select Gender',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        ),
          onChanged: (value) {
             value= listData['gender'][index];
            setState(() {
             
                     });
                     },
                   ),
                      ),
                    ),
                    Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/60),
                    ),
                   Container(

                       alignment: Alignment.centerLeft,
                     padding: EdgeInsets.all(10.0),
                      child:DropdownButtonHideUnderline(
                     child: DropdownButton<String>(
              value: selected,
             items:listData['year'],
         // icon: Icon(Icons.arrow_downward),
             iconSize: 40,
          //elevation: 16,
         // style: TextStyle(
          //  color: Colors.deepPurple
        //  ),
                     hint: Text('Select years',
                    textAlign: TextAlign.left,
                   style: TextStyle(
                      fontSize: 20.0,
                    color: Colors.black,
                    ),
                    ),
          onChanged: (value) {
            // selected= value;
          
           }
           
        ),
                      ),
                   ),
              Container(
                
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/80),
              ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                    // padding: EdgeInsets.all(5.0),
                      child:DropdownButtonHideUnderline(
                     child: DropdownButton<String>(
              value: selected,
             items:listData['gender'],
         // icon: Icon(Icons.arrow_downward),
             iconSize: 40,
          //elevation: 16,
         // style: TextStyle(
          //  color: Colors.deepPurple
        //  ),
                     hint: Text('Select gender',
                   // textAlign: TextAlign.left,
                   style: TextStyle(
                      fontSize: 20.0,
                  color: Colors.black,
                    ),
                    ),
          onChanged: (value) {
           //  selected= value;
            setState(() {
            
            });
             print(d['gender']);
          },
        ),
        ),
        ),
                //          RaisedButton(
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(5.0)),
                //   elevation: 4.0,
                //   onPressed: () {
                //    DatePicker.showDatePicker(context,
                //         theme: DatePickerTheme(
                //           containerHeight: 210.0,
                //         ),
                //         showTitleActions: true,
                //         minTime: DateTime(2000, 1, 1),
                //         maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                //       print('confirm $date');
                //       _date = '${date.year} - ${date.month} - ${date.day}';
                //       setState(() {});
                //     }, currentTime: DateTime.now(), locale: LocaleType.en);
                //   },
                //   child: Container(
                //     alignment: Alignment.center,
                //     height: 50.0,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: <Widget>[
                //         Row(
                //           children: <Widget>[
                //             Container(
                //               child: Row(
                //                 children: <Widget>[
                //                   Icon(
                //                     Icons.date_range,
                //                     size: 18.0,
                //                     color: Colors.teal,
                //                   ),
                //                   Text(
                //                     " $_date",
                //                     style: TextStyle(
                //                         color: Colors.teal,
                //                         fontWeight: FontWeight.bold,
                //                         fontSize: 18.0),
                //                   ),
                //                 ],
                //               ),
                //             )
                //           ],
                //         ),
                //         Text(
                //           "  Change",
                //           style: TextStyle(
                //               color: Colors.teal,
                //               fontWeight: FontWeight.bold,
                //               fontSize: 18.0),
                //         ),
                //       ],
                //     ),
                //   ),
                //   color: Colors.white,
                // ),
                RaisedButton(
                child: Text('Submit'),
                  onPressed: (){},
                ),
    ],
    ),
  ),
      ),
      
      
  );
  }
}

     