import 'package:cvdragonapp_v1/demologin.dart';
import 'package:cvdragonapp_v1/home.dart';
import 'package:flutter/material.dart';
import './urlgenerator.dart'as urlgenerator;
import 'package:flutter/painting.dart';
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
   // TODO: implement createState
   return _FirstTimeWizard();
 }
}
final _selectedVal = ValueNotifier("None Selected");
class _FirstTimeWizard extends State<FirstTimeWizard> {
 var nameController = TextEditingController();
 var emailController = TextEditingController();
 var phoneController = TextEditingController(text: mobile);

 @override
 Widget build(BuildContext context) {
   return Scaffold(
       backgroundColor: Color(0xff232882),
       body: Container(
           decoration: BoxDecoration(
               image: DecorationImage(
                   image: AssetImage("assets/cover.png"), fit: BoxFit.cover)),
           child: Column(
             children: <Widget>[
               TextField(
                 decoration: InputDecoration(labelText: "Name"),
                 controller: nameController,
               ),
               TextField(
                 decoration: InputDecoration(labelText: "Email"),
                 controller: emailController,
               ),
               TextField(
                 decoration: InputDecoration(labelText: "Phone"),
                 controller: phoneController,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   ValueListenableBuilder(
                     valueListenable: _selectedVal,
                     builder: (context, val, child) {
                       return Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           Radio(
                               value: "1",
                               groupValue: val,
                               onChanged: (v) {
                                 _selectedVal.value = v;
                               }),
                           Text("Basic"),
                           Radio(
                               value: "2",
                               groupValue: val,
                               onChanged: (v) {
                                 _selectedVal.value = v;
                               }),
                           Text("Fresher"),
                           Radio(
                               value: "3",
                               groupValue: val,
                               onChanged: (v) {
                                 _selectedVal.value = v;
                               }),
                           Text("Experience"),
                         ],
                       );
                     },
                   )
                 ],
               ),
               RaisedButton(
                 child: Text("Click Me"),
                 onPressed: () {
                   print(urlgenerator.usercreate(nameController.text, emailController.text, "91", phoneController.text, typelogin.toString(), socialid, _selectedVal.value));
                   print(nameController.text);
                   print(emailController.text);
                   print(phoneController.text);
                   print(_selectedVal.value);
                  //  Navigator.push(context,
                  //      MaterialPageRoute(builder: (context) => HomePagee()));
                 },
               ),
               Row(children: <Widget>[
                 Text("Already have an account "),
                 InkWell(
                   child: Text("Login"),
                   onTap: () {
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) => new DemoLogin()));
                   },
                 )
               ]),
               

             ],
           )));
 }
}
