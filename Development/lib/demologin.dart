import 'package:cvdragonapp_v1/Sections/BasicInfo.dart';
import 'package:cvdragonapp_v1/home.dart';
import 'package:cvdragonapp_v1/otppage.dart';
import 'package:cvdragonapp_v1/sharedfetch.dart';
import 'package:flutter/material.dart';
import 'package:cvdragonapp_v1/form_card.dart';
import 'package:cvdragonapp_v1/social_login.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:http/http.dart' as http;

final String redirectUrl = 'https://cvdragon.com/loginRedirect';
final String clientId = '81jxugmo6b2dop';
final String clientSecret = 'cZFQqJV6IdgPsBpv';

class DemoLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DemoLogin();
  }
}

class _DemoLogin extends State<DemoLogin> {
  PageController controller;
  int currentpage = 0;
  var hcont = 0;
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
    var facebookLogin = FacebookLogin();
    var result = await facebookLogin.logInWithReadPermissions(['email']);
    var token = result.accessToken.token;
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        var r = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=id&access_token=$token');
        var id = json.decode(r.body);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => OtpPage("", id['id'].toString(), 2)));
        print("Logged Inn..");
        break;
      case FacebookLoginStatus.cancelledByUser:
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Error Login,Try Again"),
        ));
        print("Login cancelled");
        break;
      case FacebookLoginStatus.error:
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Error Login,Try Again"),
        ));
        print("Another error..");
        break;
    }
  }

  final mycontroller = TextEditingController();
  var status = 0;
  bool _isLoading = true;
  @override
  void dispose() {
    mycontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    get();

    mycontroller.text = "";
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  get() async {
    status = await readloginstatus();
    setState(() {
      print(status);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? DecoratedBox(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/cover.png"), fit: BoxFit.fill)),
            child: Center(
                child: Image(
                    image: AssetImage("assets/logocv.gif"),
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width / 6)),
          )
        : status == 1
            ? HomePagee()
            : Scaffold(
                //resizeToAvoidBottomInset: true,
                //resizeToAvoidBottomPadding: true,
                body: Container(
                  //height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,

                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(90),

                                  //borderRadius: BorderRadius.only(bottomLeft:  const  Radius.circular(30.0),
                                  //bottomRight:  const  Radius.circular(30.0),
                                )),
                            height: MediaQuery.of(context).size.height / 1.9,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  width: MediaQuery.of(context).size.width,
                                  child: new PageView.builder(
                                      itemCount: 3,
                                      onPageChanged: (value) {
                                        setState(() {
                                          currentpage = value;
                                        });
                                      },
                                      controller: controller,
                                      itemBuilder: (context, index) =>
                                          builder(index)),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: MediaQuery.of(context).size.width / 1.15,
                            height: 45,
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: mycontroller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                ),
                                hintText: 'Phone',
                              ),
                            ),
                          ),
//               Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Align(
//           alignment: Alignment.centerRight,
//           child: TextField(
//             controller: mycontroller,
//             style: TextStyle(color: Colors.white, fontSize: 18),
//             maxLength: 10,
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(
//               counterText: '',
//               hintText: "+91 Enter Phone Number",
//               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//               hintStyle: TextStyle(color: Colors.white54),
//               icon: Icon(
//                 Icons.phone,
//                 size: 22,
//                 color: Colors.white,
//               ),
// //            labelText: '+91',
// //            labelStyle: TextStyle(
// //              fontSize: 22,
// //              color: Colors.white,
//             ),
//             //border: InputBorder.none,
//           ),
//       ),
//     ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OtpPage(
                                              mycontroller.text.toString(),
                                              "",
                                              1)));
                                },
                                child: Container(
                                  height: 40.0,
                                  width: 150.0,
                                  alignment: FractionalOffset.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(30.0),
                                      border:
                                          new Border.all(color: Colors.white)),
                                  child: InkWell(
                                    onTap: () {
                                      // local.pushAcademicProject().then((int status){
                                      //   if(status==1)
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => OtpPage(
                                                  mycontroller.text.toString(),
                                                  "",
                                                  1)));
                                      // });
                                    },
                                    child: Text(
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

                          _buildTextSocialLogin(),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Row(
//            crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      print("FB");
                                      fbb(context);
                                    },
                                    child: Container(
                                      //padding: EdgeInsets.only(left: 10),
                                      child: CircleAvatar(
                                        backgroundImage: ExactAssetImage(
                                            'assets/facebook.jpg'),
                                        minRadius: 20,
                                        maxRadius: 20,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _handleSignIn()
                                          .then((GoogleSignInAccount acc) {
                                        if (acc != null) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => OtpPage(
                                                      "",
                                                      acc.id.toString(),
                                                      3)));
                                        }
                                      });
                                    },
                                    child: Container(
                                      //padding: EdgeInsets.only(left: 20),
                                      child: CircleAvatar(
                                        backgroundImage: ExactAssetImage(
                                            'assets/google.png'),
                                        minRadius: 20,
                                        maxRadius: 20,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  buildLinkedIn(context)));
                                    },
                                    child: Container(
                                      //padding: EdgeInsets.only(left: 20),

                                      child: CircleAvatar(
                                        backgroundImage: ExactAssetImage(
                                            'assets/linkedin.jpg'),
                                        minRadius: 20,
                                        maxRadius: 20,
                                      ),
                                    ),
                                  ),
                                ]),
                          )

                          // RaisedButton(child: Text("Facebook"),onPressed: (){
                          //       fbb(context);
                          // },),
                          // RaisedButton(child: Text("LinkedIn"),onPressed: (){
                          //     Navigator.of(context)
                          //     .push(MaterialPageRoute(builder: (context) => buildLinkedIn(context)));
                          // }),
                          // RaisedButton(child: Text("Google"),onPressed: (){
                          //     _handleSignIn().then((GoogleSignInAccount acc){
                          //       if(acc!=null)
                          //       {
                          //         Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPage("",acc.id.toString(),3)));
                          //       }
                          //     });
                          // }),
                        ],
                      ),
                    ],
                  ),
                ),
              );
  }

  builder(int index) {
    return new AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 0.9;
        return new Center(
          child: new SizedBox(
            height: MediaQuery.of(context).size.height / 2.2,
            width: Curves.easeOut.transform(value) * 500,
            child: child,
          ),
        );
      },
      child: new Card(
        child: Text("Card"),
        // child: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/resumeDesignsLarge/1.jpg"))),),
        elevation: 15.0,
        margin: const EdgeInsets.all(8.0),
        color: index % 2 == 0 ? Colors.blue : Colors.red,
      ),
    );
  }
}

Widget _buildTextSocialLogin() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      _buildHorizontalLine(),
      Text(
        "Social Login",
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
      _buildHorizontalLine(),
    ],
  );
}

Widget _buildHorizontalLine() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      width: 60.0, //context wala problem
      height: 1.0,
      color: Colors.white,
    ),
  );
}

Widget _buildSocialMediaIcon() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SocialIcon(
          onPressed: () {},
        )
      ],
    ),
  );
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

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              OtpPage("", linkedInUser.userId.toString(), 4)));
    },
    catchError: (LinkedInErrorObject error) {
      print('Error description: ${error.description},'
          ' Error code: ${error.statusCode.toString()}');
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Error Login,Try Again"),
      ));
    },
  );
}
