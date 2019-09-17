import 'package:cvdragonapp_v1/layerbeforeHP.dart';
import 'package:flutter/material.dart';
import './topmenu.dart';
import 'package:cvdragonapp_v1/rightpreviewpane.dart';
import 'package:flutter/painting.dart';
import 'package:animator/animator.dart';
import './sidemenu.dart';
import './rightpreviewpane.dart';

class Congrats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container(
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage("assets/congrat.jpeg"),fit: BoxFit.cover),
             ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: TopMenuBar(),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.pinkAccent,
        //   onPressed: () {
        //     Navigator.of(context).push(
        //       MaterialPageRoute<Null>(
        //         builder: (BuildContext context) {
        //           return CVView();
        //         },
        //       ),
        //     );
        //   },
        //   child: Icon(
        //     Icons.visibility,
        //     color: Colors.white,
        //   ),
        //   elevation: 0.0,
        // ),
        drawer: SideMenu(),
        endDrawer: PreviewPane(),
        // bottomNavigationBar: FABBottomAppBar(
        //   //onTabSelected: _selectedTab,
        //   notchedShape: CircularNotchedRectangle(),
        //   color: Colors.white30,
        //   centerItemText: "Preview",
        //   backgroundColor: Color(0xff232882),
        //   selectedColor: Colors.white,
        //   items: [
        //     FABBottomAppBarItem(
        //         iconData: Icons.import_contacts, text: 'Knowledge'),
        //     FABBottomAppBarItem(iconData: Icons.edit, text: 'Sections'),
        //     FABBottomAppBarItem(iconData: Icons.swap_vert, text: 'Profiles'),
        //     FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
        //   ],
        // ),
       // bottomNavigationBar: MybottomNav(-1),

         body:Center(
                    child:   Container(
                         //padding: EdgeInsets.only(top: 40.0),
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
                         child: RaisedButton(child: Text("Go To Home"),onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>LayerBeforeHP()));
                         },),
                       )
           ),
         ),
              
 

                  // Container(alignment: Alignment.center,   
                  // comments
                  //  child: Column(
                  //    children: <Widget>[
                  //      Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),),
                  //      Animator(
                  //        duration: Duration(seconds: 1),
                  //        cycles: 1,
                  //        builder: (anim) => Transform.scale(
                  //          scale: anim.value,
                  //          child: Text("Congratulations !!\nYour Profile has been created :)",style: TextStyle(fontSize: 25),) ,
                  //        ),
                  //      ),

                      //  Container(
                      //    padding: EdgeInsets.only(top: 20),
                      //    child: RaisedButton(child: Text("Go To Home"),onPressed: (){
                      //      Navigator.push(context, MaterialPageRoute(builder: (context)=>LayerBeforeHP()));
                      //    },),
                      //  )
                  //    ],
                  //  )
                  // to here!
                  //Animator(
                  //           tweenMap: {
                  //             "opacity": Tween<double>(begin: 0, end: 1),
                  //             "translation": Tween<Offset>(begin: Offset.zero, end: Offset(4, 0)),
                  //             "rotation": Tween<double>(begin: 0, end: 4 * (22/7)),

                  //           },
                  //           cycles: 1,
                  //           duration: Duration(seconds: 3),
                  //           builderMap: (anim) => FadeTransition(
                  //                 opacity: anim["opacity"],
                  //                 child: FractionalTranslation(
                  //                   translation: anim["translation"].value,
                  //                   child: Transform.rotate(
                  //                     angle: anim["rotation"].value,
                  //                     child: Text("Congratulations !!\n Your Profile has been created :)",
                  //                               style: TextStyle(
                  //                               fontSize: 20,
                  //                               color: Colors.black,
                  //                               fontWeight: FontWeight.bold,
                  //                               fontStyle: FontStyle.italic),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //           ),
                            // ),
                  // Text("Congratulations !!\n Your Profile has been created :)",
                  // style: TextStyle(
                  //   fontSize: 20,
                  //   color: Colors.black,
                  //   fontWeight: FontWeight.bold,
                  //   fontStyle: FontStyle.italic),
                  //   ),
                
          // ),
          
       //  ),
   // ),
       
       
    
    
    );

    
  }
  }

  

