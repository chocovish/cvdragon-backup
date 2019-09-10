import 'package:cvdragonapp_v1/sharedfetch.dart';
import 'package:cvdragonapp_v1/wizard.dart';
import 'package:flutter/material.dart';
import 'package:code_input/code_input.dart';
import './fetch.dart' as fetch;
import 'layerbeforeHP.dart';

String mobileno = "";
String socialid = "";
int typeoflogin;
int otp;

/*
1   Mobile
2 Facebook
3   Google
4   Linkedin
*/
class OtpPage extends StatefulWidget {
  OtpPage(String mobile, String social, int type) {
    mobileno = mobile;
    socialid = social;
    typeoflogin = type;
  }
  @override
  State<StatefulWidget> createState() {
    return _OtpPage();
  }
}
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
class _OtpPage extends State<OtpPage> {
  final myController2 = TextEditingController();
  bool _isLoading = true;
  String otp;
  List data;
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController2.dispose();
    super.dispose();
  }

  void get() async {
    if (typeoflogin == 1) {
      fetch.getOtp(mobileno).then((List res) {
        setState(() {
          print(res.toString());
          data = res;
          _isLoading = false;
        });
      });
    } else {
      await verify();
      setState(() {
        _isLoading = false;
      });
    }
  }

  verify() async {

    print(typeoflogin);
    if (typeoflogin == 1) {
      if (otp == data[1]['OTP'].toString()) {
        var data = await fetch.getverifyUser(mobileno);
        print(data);
        if (data == 0)
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FirstTimeWizard(typeoflogin, mobileno)),
                      (r)=>false);
        else {
          Map<String, dynamic> basic_data =
              await fetch.getUserDetaisMobile(mobileno);
          await writeid(basic_data['id']);
          await writeauthKey(basic_data['authKey']);
          await writeloginstatus(1);
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => LayerBeforeHP()),(r)=>false); 
        }
      } else
      {
         _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text("Wrong Otp")
         ,action: SnackBarAction(label: "Try Again",onPressed: (){},),));
          print("wrong otp");
      }
        
    } else {
      print(socialid);
      var data = await fetch.getverifyUserSocial(socialid);
      print(data);
      if (data == 0)
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FirstTimeWizard(typeoflogin, socialid)));
      else {
        Map<String, dynamic> basic_data =
            await fetch.getUserDetailsSocial(socialid);
        await writeid(basic_data['id']);
        await writeauthKey(basic_data['authKey']);
        await writeloginstatus(1);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LayerBeforeHP()));
      }
    }
  }

  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(image:  DecorationImage(image: AssetImage('assets/otppage.png'),fit: BoxFit.cover)),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
          body: _isLoading
              ? DecoratedBox(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/cover.png"),
                          fit: BoxFit.fill)),
                  child: Center(
                      child: Image(
                          image: AssetImage("assets/logocv.gif"),
                          height: MediaQuery.of(context).size.height / 12,
                          width: MediaQuery.of(context).size.width / 6)),
                )
              : Container(
                  //color: Colors.purple,
                  alignment: Alignment.center,
                  child: Center(
                 
                       child
                       : Container(
                          padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/2.2),
                         child: Column(
                           children: <Widget>[
                             Text("Enter OTP",style: TextStyle(color: Colors.white,fontSize: 20),),
                           //  AutoSizeText("Enter OTP",style: TextStyle(color: Colors.white),),
                             Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/40),),
                             CodeInput(
                                length: 4,
                                keyboardType: TextInputType.number,
                                builder: CodeInputBuilders.lightCircle(),
                                onFilled: (String val) {
                                  otp = val;
                                  verify();
                                },
                              ),
                           ],
                         ),
                       ),
                
                  ),
                )
                ),
    );
  }

  void initState() {
    super.initState();
    this.get();
  }
}
