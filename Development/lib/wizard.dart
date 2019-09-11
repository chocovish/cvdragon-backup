import 'package:cvdragonapp_v1/demologin.dart';
import 'package:cvdragonapp_v1/layerbeforeHP.dart';
import 'package:cvdragonapp_v1/otppage.dart';
import 'package:flutter/material.dart';
import './urlgenerator.dart'as urlgenerator;
import 'package:flutter/painting.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import './sharedfetch.dart';
// import './vishal/myFormFields.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/cupertino.dart';
int typelogin;
String mobile="";
String socialid="";
class FirstTimeWizard extends StatefulWidget {
 @override
 FirstTimeWizard(type,details){
   typelogin=type;
   if(type==1)
  mobile=details;
  else
  socialid=details;
 }
 State<StatefulWidget> createState() {
   
   return _FirstTimeWizard();
 }
}
final _selectedVal = ValueNotifier("None Selected");
class _FirstTimeWizard extends State<FirstTimeWizard> {
 var nameController = TextEditingController(text: "");
 var emailController = TextEditingController(text:  "");
 var phonecodeController = TextEditingController(text: "");
 var phoneController = TextEditingController(text: typeoflogin==1?mobile:"");
 var category;

 @override
 Widget build(BuildContext context) {
   return Container(
     decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/wizard_bg.jpeg'),fit: BoxFit.cover)),
     child: Scaffold(
         backgroundColor: Colors.transparent,
          body: Container(
          child: ListView(
                    children: <Widget>[
                      Column(
              children: <Widget>[
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height/5,
                //   decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //       begin: Alignment.topCenter,
                //       end: Alignment.bottomCenter,
                //       colors: [
                //        Colors.pinkAccent,
                //        Colors.purple
                //       ],
                //     ),
                //     borderRadius: BorderRadius.only(
                //       bottomLeft: Radius.circular(40)
                //     )
                //   ),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: <Widget>[
                //       Spacer(),
                //       Align(
                //         alignment: Alignment.center,
                //         child: Icon(Icons.person,
                //           size: 90,
                //           color: Colors.white,
                //         ),
                //       ),
                //       //Spacer(),
                //       Text("Register Here" ,style: TextStyle(color: Colors.white,fontSize: 20),),
                //       Spacer()

                //       // Align(
                //       //   alignment: Alignment.bottomRight,
                //       //     child: Padding(
                //       //       padding: const EdgeInsets.only(
                //       //         bottom: 32,
                //       //         right: 32
                //       //       ),
                //       //       child: Text('Login',
                //       //         style: TextStyle(
                //       //           color: Colors.white,
                //       //           fontSize: 18
                //       //         ),
                //       //       ),
                //       //     ),
                //       // ),
                //     ],
                //   ),
                // ),
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.4),),
                Container(
                  height: MediaQuery.of(context).size.height/1.5,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                       Container(
                        width: MediaQuery.of(context).size.width/1.2,
                        height: 45,
                        padding: EdgeInsets.only(
                          top: 4,left: 16, right: 16, bottom: 4
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10)
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5
                            )
                          ]
                        ),
                        child: TextField(
                         
                           controller: nameController,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            border: InputBorder.none,
                            // icon: Icon(Icons.person_outline,
                            //     color: Colors.pinkAccent,
                            // ),
                              hintText: 'Name'.toUpperCase(),
                              
                              hintStyle: TextStyle(letterSpacing: 6 ),
                          ),
                        ),
                      ),
                      
                      Container(
                        width: MediaQuery.of(context).size.width/1.2,
                        height: 45,
                        margin: EdgeInsets.only(top: 32),
                        padding: EdgeInsets.only(
                          top: 4,left: 16, right: 16, bottom: 4
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10)
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5
                            )
                          ]
                        ),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            // icon: Icon(Icons.email,
                            //     color: Colors.pinkAccent,
                            // ),
                              hintText: 'EMAIL',
                              hintStyle: TextStyle(letterSpacing: 6)
                          ),
                        ),
                      ),
                      
                       Container(
                       
                        width: MediaQuery.of(context).size.width/1.2,
                        height: 45,
                        margin: EdgeInsets.only(top: 32,bottom: 10),
                        padding: EdgeInsets.only(
                            top: 4,left: 16, right: 16, bottom: 4
                        ),
                        decoration: BoxDecoration(
                          
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)
                            ),
                            color: typeoflogin==1?Colors.white.withOpacity(0.6):Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5
                              )
                            ]
                        ),
                        child: Row(
                            
                          children: <Widget>[
                          //  typeoflogin==1? SizedBox(
                          //     height: 50,
                          //     width: 60,
                          //                               child: TextField(
                          //       controller: phonecodeController,
                          //       decoration: InputDecoration(
                          //         border: InputBorder.none,
                          //         // icon: Icon(Icons.phone,
                          //         //   color: Colors.pink,
                          //         // ),
                          //         hintText: '91',

                          //       ),
                          //     ),
                          //   ),
                            Flexible(
                              flex: 2,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                
                                enabled: typeoflogin==1?false:true,
                                controller: phoneController,
                                decoration: InputDecoration(
                               
                                  border: InputBorder.none,
                                  
                                  hintText: 'Phone'.toUpperCase(),
                                  hintStyle: TextStyle(letterSpacing: 6)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),

                      child:
                       FormBuilderSegmentedControl(
                         unselectedColor: Colors.transparent,
                         borderColor: Colors.white,
                        pressedColor: Colors.pink[400],
                         selectedColor: Colors.pink[400],

                         initialValue: "Fresher",
                         onChanged: (s){
                           category = s;
                           print (category);
                         },
                        decoration: InputDecoration( 
                       
                        //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                      //  border: Border
                        ),
                        attribute: "Form",
                        options: [
                        FormBuilderFieldOption(value: "Basic", child: Text("BASIC",style: TextStyle(color: Colors.white,),),),
                        FormBuilderFieldOption(value: "Fresher",child: Text("FRESHER",style: TextStyle(color: Colors.white,)),),
                        FormBuilderFieldOption(value: "Experience",child: Text("EXPERIENCE",style: TextStyle(color: Colors.white,)),)],
                      ),
                    ),
                      Padding(padding: EdgeInsets.only(bottom: 20),),

                      InkWell(
                        onTap: ()
                          async{
                            var cat=0;
                            if(category=="Basic")
                            cat=1;
                            if(category=="Fresher")
                            cat=2;
                            if(category=="Experience")
                            cat=3;
                    String url=urlgenerator.usercreate(nameController.text, emailController.text, phonecodeController.text, phoneController.text, typelogin.toString(), socialid, cat.toString());
                    print(url);
                     http.Response res=await http.get(url);
                       print(res.body.toString());
                     List data=json.decode(res.body);
                     //print(res.body.toString());
                     await writeid(data[0]['id']);
                     await writeauthKey(data[0]['authkey']);
                      await writeloginstatus(1);
                    //  print(nameController.text);
                    //  print(emailController.text);
                    //  print(phoneController.text);
                    //  print(_selectedVal.value);
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) => LayerBeforeHP()));
                   
                        },
                                            child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width/2,
                          decoration: BoxDecoration(
                            // gradient: LinearGradient(
                            //   colors: [
                            //    Colors.pinkAccent,
                            //    Colors.purple
                            //   ],
                            // ),
                              color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10)
                            )
                          ),
                          child: Center(
                            child: Text('Create Account'.toUpperCase(),
                              style: TextStyle(letterSpacing: 4,
                                color: Colors.black,
                                
                              ),
                            ),
                          ),
                        ),
                      ),
                       Padding(padding: EdgeInsets.only(bottom: 15),),
                    GestureDetector(
                        onTap: (){
                           Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => new DemoLogin()));
                        },
                                            child: Align(
                          alignment: Alignment.center,
                         
                            child: Text('Already have an account ? Login',
                              style: TextStyle(
                                color: Colors.grey
                              ),
                            ),
                          ),
                        
                      ),
                     
                    ],
                  ),
                )
              ],
            ),
          ],
         ),
        ),
        //Container(
        //      decoration: BoxDecoration(
        //          image: DecorationImage(
        //              image: AssetImage("assets/cover.png"), fit: BoxFit.cover)),
        //      child: Column(
        //        children: <Widget>[
        //          TextField(
        //            decoration: InputDecoration(labelText: "Name"),
        //            controller: nameController,
        //          ),
        //          TextField(
        //            decoration: InputDecoration(labelText: "Email"),
        //            controller: emailController,
        //          ),
        //          TextField(
        //            decoration: InputDecoration(labelText: "Phone"),
        //            controller: phoneController,
        //          ),
        //          Row(
        //            mainAxisAlignment: MainAxisAlignment.center,
        //            children: <Widget>[
        //              ValueListenableBuilder(
        //                valueListenable: _selectedVal,
        //                builder: (context, val, child) {
        //                  return Row(
        //                    mainAxisAlignment: MainAxisAlignment.center,
        //                    children: <Widget>[
        //                      Radio(
        //                          value: "1",
        //                          groupValue: val,
        //                          onChanged: (v) {
        //                            _selectedVal.value = v;
        //                          }),
        //                      Text("Basic"),
        //                      Radio(
        //                          value: "2",
        //                          groupValue: val,
        //                          onChanged: (v) {
        //                            _selectedVal.value = v;
        //                          }),
        //                      Text("Fresher"),
        //                      Radio(
        //                          value: "3",
        //                          groupValue: val,
        //                          onChanged: (v) {
        //                            _selectedVal.value = v;
        //                          }),
        //                      Text("Experience"),
        //                    ],
        //                  );
        //                },
        //              )
        //            ],
        //          ),
        //          RaisedButton(
        //            child: Text("Click Me"),
        //            onPressed: () async{
        //             String url=urlgenerator.usercreate(nameController.text, emailController.text, "91", phoneController.text, typelogin.toString(), socialid, _selectedVal.value);
        //             print(url);
        //              http.Response res=await http.get(url);
        //              List data=json.decode(res.body);
        //              print(res.body.toString());
        //              await writeid(data[0]['id']);
        //              await writeauthKey(data[0]['authkey']);
        //               await writeloginstatus(1);
        //             //  print(nameController.text);
        //             //  print(emailController.text);
        //             //  print(phoneController.text);
        //             //  print(_selectedVal.value);
        //              Navigator.push(context,
        //                  MaterialPageRoute(builder: (context) => HomePagee()));
        //            },
        //          ),
        //          Row(children: <Widget>[
        //            Text("Already have an account "),
        //            InkWell(
        //              child: Text("Login"),
        //              onTap: () {
        //                Navigator.push(
        //                    context,
        //                    MaterialPageRoute(
        //                        builder: (context) => new DemoLogin()));
        //              },
        //            )
        //          ]),
                 

        //        ],
        //      ))
        ),
   );
 }
}
