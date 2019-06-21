import 'package:cvdragonapp_v1/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './fetch.dart'as fetch;
String mobileno;
class OtpPage extends StatefulWidget{
OtpPage(String mobile)
{
  mobileno=mobile;
 }
@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OtpPage();
  }

}

class _OtpPage extends State<OtpPage>{
 final myController = TextEditingController();
 bool _isLoading=true;
 String otp;
 List data;
  void get()  {
   // fetch.getOtp(mobileno).then((List res){
      setState(() {
      // data=res;
      _isLoading=false; 
      });
   // });
  }
@override

  Widget build(BuildContext context) {
     verify()
    {
      //  if(myController.text.toString()==data[1]['OTP'].toString())
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePagee()));
       // else
       // print("Wrong otp");
    }
    // TODO: implement build
    return Scaffold(
      
      body:_isLoading?DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/cover.png"), fit: BoxFit.fill)),
              child: Center(
                  child: Image(
                      image: AssetImage("assets/logocv.gif"),
                      height: MediaQuery.of(context).size.height/12,
                      width: MediaQuery.of(context).size.width/6)),
            ):Column(
        children: <Widget>[
          TextField( controller: myController),
          RaisedButton(
            child: Text("Submit OTP"),
            onPressed:verify,
            )

        ],
      )
      );
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    this.get();
  }
}