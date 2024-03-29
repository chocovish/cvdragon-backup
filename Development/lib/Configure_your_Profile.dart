import 'package:cvdragonapp_v1/datapush.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './topmenu.dart';
import './Congrats.dart';
String profile="";
List sections=[];

class ConfigureProfile extends StatefulWidget {
  @override
  ConfigureProfile(String p,List d)
  {
      profile=p;
      sections=d;
  }
  _ConfigureProfile createState() => new _ConfigureProfile();
}

bool _isLoading=false;
class _ConfigureProfile extends State<ConfigureProfile> {
@override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/cyp.jpeg'),fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: TopMenuBar(),
        
        body: Container(
          child: _isLoading
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
                  mainAxisSize: MainAxisSize.max,
                  
                  children:<Widget>[
                  //  Container(
                  //    margin: EdgeInsets.only(bottom: 50),
                  //     padding: EdgeInsets.only(bottom: 10),
                  //      decoration: BoxDecoration(
                  //   gradient: LinearGradient(
                  //     begin: Alignment.topCenter,
                  //     end: Alignment.bottomCenter,
                  //     colors: [
                  //       Color(0xFFf45d27),
                  //       Color(0xFFf5851f)
                  //     ],
                  //   ),
                  //   borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(90)
                  //   )
                  // ),
                  //     height: MediaQuery.of(context).size.height/2.2,
                  //     width: MediaQuery.of(context).size.width,
                  //     child: Column(
                  //       children: <Widget>[

                  //         Container(
                  //            padding: EdgeInsets.all(10),
                  //           child:Align(alignment: Alignment.topRight,
                  //           child: Text("Step 3/3",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.bold),),)),
                  //           Padding(padding: EdgeInsets.only(bottom: 10),),
                  //           Align(
                  //       alignment: Alignment.center,
                  //       child: Icon(Icons.person,
                  //         size: 90,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                     
                  //      Align(
                  //       alignment: Alignment.center,
                  //       child: Text("CONFIGURE YOUR PROFILE",
                  //       style: TextStyle(color: Colors.white,
                  //       fontWeight: FontWeight.bold,fontSize: 25),),
                  //     ),
                        
                  //       ],
                  //     )
                  //   ),
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2),
                  ),
                    Align(
                      alignment: Alignment.center,
                                          child: InkWell(
                        
                      onTap: ()async{
                        print(sections.toString());
                        Map<String,dynamic> secs={};
                        sections.forEach((f){
                          secs[f.toString()]=[];
                        });
                        String s=await createProfile(secs, profile);
                        print("Profile created - "+s);
                           Navigator.of(context).push(
                  MaterialPageRoute<Null>(builder: (BuildContext context) {return
                      Congrats();
                      }));
                      
                      
                      },
                                      child: Container(
                              height: 45,
                             
                              width: MediaQuery.of(context).size.width/1.2,
                              decoration: BoxDecoration(
                                // gradient: LinearGradient(
                                //   colors: [
                                //     Color(0xFFf45d27),
                                //     Color(0xFFf5851f)
                                //   ],
                                // ),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50)
                                )
                              ),
                              child: Center(
                                child: Text('CLICK TO CONFIGURE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                  ),
                    ),
                  ]
                ),
        )
      ),
    );
  }
}
