import 'package:cvdragonapp_v1/layerbeforeHP.dart';
import 'package:cvdragonapp_v1/otppage.dart';
import 'package:cvdragonapp_v1/sharedfetch.dart';
import 'package:flutter/material.dart';
import 'package:cvdragonapp_v1/social_login.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
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
            ? LayerBeforeHP()
            : Scaffold(

                //resizeToAvoidBottomInset: true,
                //resizeToAvoidBottomPadding: true,
                body: Container(
                  //height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,

                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/loginbg.jpeg'),
                    fit: BoxFit.cover)
                  ),
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[



                          Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.5),

                          ),
                        Container(
                          height: MediaQuery.of(context).size.height/13,
                          width: MediaQuery.of(context).size.width/1.1,
                     decoration:BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.all(
                           Radius.circular(5.0),
                          ),
                        ),
                          
                          child: Row(
                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Expanded(
                                child: TextField(
                                    keyboardType: TextInputType.number,
                                        controller: mycontroller,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          
                                       
                                          // icon: Icon(
                                          
                                          //   Icons.arrow_right,
                                          //   color: Colors.grey,
                                          // ),
                                          hintText: 'Mobile Number',
                                           //counterText: "",
                                           contentPadding: EdgeInsets.only(left: 10),
                                           
                                         
                                          hintStyle: TextStyle(letterSpacing: 0 ),
                                        
                                          // suffixIcon: Padding(
                                          
                                          //   padding: const EdgeInsetsDirectional.only(end: 12.0),
                                          //   child:Icon(Icons.arrow_right,
                                          
                                          //   ),
                                          // )
                                      
                                      ),
                                  ),
                                ),
                              ),
                          //  Padding(
                          //    // width:MediaQuery.of(context).size.width/3),
                          //   // margin: EdgeInsets.only(left:MediaQuery.of(context).size.width/3),
                            
                          //   ),
                             
                              Container(
                                //width:70,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.pink),
                                width:MediaQuery.of(context).size.width/4,
                                //color: Colors.orange,
                                child: IconButton(
                               icon: new Icon(Icons.arrow_forward,color: Colors.white,
                               
                               ),
                              onPressed: (){
                                  // local.pushAcademicProject().then((int status){
                          //             //   if(status==1)
                                 Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => OtpPage(
                                                  mycontroller.text.toString(),
                                                  "",
                                                  1)));
                                      // });
                                    },
                              //{ /* Your code */ },
                                ),
                              )
                              
                            ],
                          ),

                        ),

                          // Container(
                          //   padding: EdgeInsets.only(bottom: 10),
                          //   decoration: BoxDecoration(
                          //       color: Colors.yellow,
                          //       borderRadius: BorderRadius.only(
                          //         bottomLeft: Radius.circular(90),

                          //         //borderRadius: BorderRadius.only(bottomLeft:  const  Radius.circular(30.0),
                          //         //bottomRight:  const  Radius.circular(30.0),
                          //       )),
                          //   height: MediaQuery.of(context).size.height / 1.9,
                          //   width: MediaQuery.of(context).size.width,
                          //   child: Column(
                          //     children: <Widget>[
                          //       Container(
                          //         height:
                          //             MediaQuery.of(context).size.height / 2,
                          //         width: MediaQuery.of(context).size.width,
                          //         child: new PageView.builder(
                          //             itemCount: 3,
                          //             onPageChanged: (value) {
                          //               setState(() {
                          //                 currentpage = value;
                          //               });
                          //             },
                          //             controller: controller,
                          //             itemBuilder: (context, index) =>
                          //                 builder(index)),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2),
                          // ),
                          // Align(
                          //   alignment: Alignment.center,
                            // child: Padding(
                            //   padding:
                            //       const EdgeInsets.only(top: 10, bottom: 10),
                            //   child: Container(
                            //     height: 35.0,
                            //     width: 100.0,
                            //     alignment: FractionalOffset.center,
                            //     decoration: BoxDecoration(
                            //         color: Colors.transparent,
                            //         borderRadius: BorderRadius.circular(10.0),
                            //         border:
                            //             new Border.all(color: Colors.white)),
                            //    // child: CircleAvatar(backgroundImage: AssetImage('assets/'),),
                            //   ),
                            // ),
                          //   child: ClipOval(
                          //     child: Opacity(opacity: 0.8,
                          //       child: Image.asset('assets/loginlogo.png',fit: BoxFit.cover,height: 200,width: 200,)),
                          //   ),
                          // ),
                          
                          //  Container(
                              
                            //  padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height/40),
                            //   color: Colors.white,
                              //  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/9),
                              //     width: MediaQuery.of(context).size.width /1.5,
                              //     height: 45,

                            //   child: Row(
                            //    mainAxisAlignment: MainAxisAlignment.center,
                            //     children: <Widget>[
                            //       Container(            //  comments from here
                            //       margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/9),
                            //       width: MediaQuery.of(context).size.width /1.5,
                            //       height: 45,
                            //       padding: EdgeInsets.only(
                            //           top: 4, left: 30, right: 30, bottom: 4),
                            //       decoration: BoxDecoration(
                            //           borderRadius:
                            //               BorderRadius.all(Radius.circular(10)),
                            //          color: Colors.white,
                            //           boxShadow: [
                            //             BoxShadow(
                            //                 color: Colors.black12, blurRadius: 5)
                            //           ]
                            //           ),
                            //       child: TextField(
                                    
                                    
                            //         keyboardType: TextInputType.number,
                            //         controller: mycontroller,
                            //         decoration: InputDecoration(
                            //           border: InputBorder.none,
                                      
                                   
                            //           // icon: Icon(
                                      
                            //           //   Icons.arrow_right,
                            //           //   color: Colors.grey,
                            //           // ),
                            //           hintText: 'TYPE YOUR PHONE NUMBER HERE',
                            //           hintStyle: TextStyle(letterSpacing: 0 ),
                                    
                            //           suffixIcon: Padding(
                                      
                            //             padding: const EdgeInsetsDirectional.only(end: 12.0),
                            //             child:Icon(Icons.arrow_right,
                                      
                            //             ),
                            //           )
                                      
                            //         ),
                                  
                            //       ),
                            //       ),
                            //       //   ),
                            //       // )
                                  
                            //     ],
                            //   ),
                            // ),
                         
                           
                            
                         // ),
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
                          // Align(
                          //   alignment: Alignment.center,
                          //   child: Padding(
                          //     padding:
                          //         const EdgeInsets.only(top: 60, bottom: 20),
                          //     child: InkWell(
                          //       onTap: () {
                          //         Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //                 builder: (context) => OtpPage(
                          //                     mycontroller.text.toString(),
                          //                     "",
                          //                     1)));
                          //       },
                          //       child: Container(
                          //         height: 35.0,
                          //         width: 100.0,
                          //         alignment: FractionalOffset.center,
                          //         decoration: BoxDecoration(
                          //             color: Colors.transparent,
                          //             borderRadius: BorderRadius.circular(10.0),
                          //             border:
                          //                 new Border.all(color: Colors.white)),
                          //         child: InkWell(
                          //           onTap: () {
                          //             // local.pushAcademicProject().then((int status){
                          //             //   if(status==1)
                          //             Navigator.push(
                          //                 context,
                          //                 MaterialPageRoute(
                          //                     builder: (context) => OtpPage(
                          //                         mycontroller.text.toString(),
                          //                         "",
                          //                         1)));
                          //             // });
                          //           },
                          //           child: Text(
                          //             "VERIFY",
                          //             style: TextStyle(
                          //                 color: Colors.white,
                          //                 fontSize: 15.0,
                          //                 // fontWeight: FontWeight.bold,
                          //                 letterSpacing: 1.0),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                           Padding(
                             padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/25),
                           ),
                          _buildTextSocialLogin(),
                          Padding(padding: EdgeInsets.only(top: 15)),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.3,
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
                                    child: ClipOval(
                                      
                                       // backgroundColor: Colors.black,
                                      child: Image.asset(
                                          'assets/fbcvd.png',fit: BoxFit.cover,height:40,width: 40,),
                                      // minRadius: 20,
                                     // maxRadius: 20,
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
                                    child: ClipOval(
                                      
                                       // backgroundColor: Colors.black,
                                      child: Image.asset(
                                          'assets/googlecvd.png',fit: BoxFit.cover,height:40,width: 40,),
                                      // minRadius: 20,
                                     // maxRadius: 20,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  buildLinkedIn(context)));
                                    },
                                    child: ClipOval(
                                      
                                       // backgroundColor: Colors.black,
                                      child: Image.asset(
                                          'assets/incvd.png',fit: BoxFit.cover,height:40,width: 40,),
                                      // minRadius: 20,
                                     // maxRadius: 20,
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
        //child: Text("Card"),
        child: Container(decoration: BoxDecoration(image: DecorationImage(image: 
        AssetImage("assets/cv"+index.toString()+".jpg"),fit: BoxFit.cover)
        ),),
        elevation: 15.0,
        margin: const EdgeInsets.all(8.0),
        //color: index % 2 == 0 ? Colors.blue : Colors.red,
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
