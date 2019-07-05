import 'package:cvdragonapp_v1/form_card.dart';
import 'package:cvdragonapp_v1/home.dart';
import 'package:cvdragonapp_v1/sharedfetch.dart';
import 'package:cvdragonapp_v1/wizard.dart';
import 'package:flutter/material.dart';
import './fetch.dart'as fetch;
String mobileno;

class OtpPage extends StatefulWidget{
OtpPage(String mobile)
{
  mobileno=mobile;
 }
@override
  State<StatefulWidget> createState() {
        return _OtpPage();
  }

}

class _OtpPage extends State<OtpPage>{
 final myController2 = TextEditingController();
 bool _isLoading=true;
 String otp;
 List data;
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController2.dispose();
    super.dispose();
  }

  void get()  {
   fetch.getOtp(mobileno).then((List res){
      setState(() {
    data=res;
      _isLoading=false; 
      });
   });
  }
@override

  Widget build(BuildContext context) {
     verify() async
    {
        if(myController2.text.toString()==data[1]['OTP'].toString())
        {
         var data=await fetch.getverifyUser(mobileno);
         print(data);
         if(data==0)
          Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstTimeWizard()));
          else
          {
            Map<String,dynamic> basic_data=await fetch.getUserDetaisMobile(mobileno);
            await writeid(basic_data['id']);
            await writeauthKey(basic_data['authKey']);
            await writeloginstatus(1);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePagee()));
          }
        
        }
        
       else
        print("Wrong otp");
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
          TextField( controller: myController2),
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
