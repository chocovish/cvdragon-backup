import 'package:cvdragonapp_v1/demologin.dart';
import 'package:cvdragonapp_v1/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class FirstTimeWizard extends StatefulWidget{
@override
State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstTimeWizard();
  }
}

class _FirstTimeWizard extends State <FirstTimeWizard>{
var nameController = TextEditingController();
var emailController = TextEditingController();
var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Color(0xff232882),
      body:Container(decoration: BoxDecoration
      (
        image: DecorationImage(image: AssetImage("assets/cover.png"),
        fit: BoxFit.cover
        )
        ),
        child:Column(children: <Widget>[
        TextField(decoration: InputDecoration(labelText: "Name"),controller: nameController,),
        TextField(decoration: InputDecoration(labelText: "Email"),controller: emailController,),
        TextField(decoration: InputDecoration(labelText: "Phone"),controller: phoneController,),
        RaisedButton(child: Text("Click Me"),onPressed: (){
          print(nameController.text);
          print(emailController.text);
          print(phoneController.text);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePagee())

        );},),

        Row(children: <Widget>[Text("Already have an account "),InkWell(child: Text("Login"),onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>new DemoLogin()));
        },)])
      ],))
    );
}


}