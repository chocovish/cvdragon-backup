import 'package:cvdragonapp_v1/home.dart';
import 'package:cvdragonapp_v1/otppage.dart';
import 'package:cvdragonapp_v1/sharedfetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
final String redirectUrl = 'https://cvdragon.com/loginRedirect';
final String clientId = '81jxugmo6b2dop';
final String clientSecret = 'cZFQqJV6IdgPsBpv';
class DemoLogin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DemoLogin();
  }
}
class _DemoLogin extends State<DemoLogin>
{
  GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ['email'],
);

Future<GoogleSignInAccount> _handleSignIn() async {
 GoogleSignInAccount acc;
 try {
   acc = await _googleSignIn.signIn();
   print(acc);
  
 } catch (error) {
    //Scaffold.of(context).showSnackBar(SnackBar(content: Text("Error Login,Try Again"),));
   print("within catch block...");
   print(error);
 }
  return acc;
}
   Future<void> fbb(BuildContext context) async {
    var facebookLogin = FacebookLogin() ;
    var result = await facebookLogin.logInWithReadPermissions(['email']);
    var token = result.accessToken.token;
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        var r = await http.get(
       'https://graph.facebook.com/v2.12/me?fields=id&access_token=$token');
        var id=json.decode(r.body);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPage("",id['id'].toString(),2)));
        print("Logged Inn..");
        break;
      case FacebookLoginStatus.cancelledByUser:
       Scaffold.of(context).showSnackBar(SnackBar(content: Text("Error Login,Try Again"),));
        print("Login cancelled");
        break;
      case FacebookLoginStatus.error:
       Scaffold.of(context).showSnackBar(SnackBar(content: Text("Error Login,Try Again"),));
        print("Another error..");
        break;
    }
  }
    final mycontroller = TextEditingController();
    var  status=0;
    bool _isLoading=true;
  @override
  void dispose() {
    mycontroller.dispose();
    super.dispose();
  }
  @override
  void initState()  {
    // TODO: implement initState
    get();
        
    mycontroller.text="";
    super.initState();
    
  }
   get()async{
 status=await readloginstatus();
 setState(() {
   print(status);
  _isLoading=false; 
 });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _isLoading?DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/cover.png"), fit: BoxFit.fill)),
              child: Center(
                  child: Image(
                      image: AssetImage("assets/logocv.gif"),
                      height: MediaQuery.of(context).size.height/12,
                      width: MediaQuery.of(context).size.width/6)),
            ):
    status==1?
    HomePagee():
    Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/cover.png"),
        fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextField(
          controller: mycontroller,
          style: TextStyle(color: Colors.white, fontSize: 18),
          maxLength: 10,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            counterText: '',
            hintText: "+91 Enter Phone Number",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white54),
            icon: Icon(
              Icons.phone,
              size: 22,
              color: Colors.white,
            ),
//            labelText: '+91',
//            labelStyle: TextStyle(
//              fontSize: 22,
//              color: Colors.white,
          ),
          //border: InputBorder.none,
        ),
      ),
    ),
           Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPage(mycontroller.text.toString(),"",1)));
          },
          child: Container(
            height: 50.0,
            width: 150.0,
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30.0),
                border: new Border.all(color: Colors.white)),
            child: InkWell(
              onTap: (){
              // local.pushAcademicProject().then((int status){
              //   if(status==1)
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPage(mycontroller.text.toString(),"",1)));
              // });
              }
              ,child: Text(
                "Verify",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0),
              ),
            ),
          ),
        ),
      ),
    ),

    RaisedButton(child: Text("Facebook"),onPressed: (){
          fbb(context);
    },),
    RaisedButton(child: Text("LinkedIn"),onPressed: (){
        Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => buildLinkedIn(context)));
    }),
    RaisedButton(child: Text("Google"),onPressed: (){
        _handleSignIn().then((GoogleSignInAccount acc){
          if(acc!=null)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPage("",acc.id.toString(),3)));
          }
        });
    }),
          ],
        ),
      ),
    );
  }
}


Widget buildLinkedIn(BuildContext context) {
  return LinkedInUserWidget(
    redirectUrl: redirectUrl,
    clientId: clientId,
    clientSecret: clientSecret,
    onGetUserProfile: (LinkedInUserModel linkedInUser) {
      //print('Access token ${linkedInUser.token.accessToken}');
      //print('First name: ${linkedInUser.firstName.localized.label}');
      //print('Last name: ${linkedInUser.lastName.localized.label}');

      Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => OtpPage("",linkedInUser.userId.toString(),4)));
    },
    catchError: (LinkedInErrorObject error) {
      print('Error description: ${error.description},'
          ' Error code: ${error.statusCode.toString()}');
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Error Login,Try Again"),));
    },
  );
}
