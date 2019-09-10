import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:animator/animator.dart';
import 'package:cvdragonapp_v1/form_card.dart';
import 'package:cvdragonapp_v1/social_login.dart';
final myController = TextEditingController();
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  void initState() {
   
    super.initState();
    myController.text="";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      // resizeToAvoidBottomPadding: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/cover.png'), fit: BoxFit.fill)),
        padding: EdgeInsets.only(top: 100),
        alignment: Alignment.bottomCenter,
        child: ListView(
          children: <Widget>[
            Container(
              child: animate(),
            ),
            Container(
              child: animate1(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget animate() {
  return Animator(
      tween: Tween<Offset>(begin: Offset(0, 0.5), end: Offset(0, -0.3)),
      duration: Duration(milliseconds: 1200),
      cycles: 1,
      builder: (anim) => FractionalTranslation(
          translation: anim.value,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: new AssetImage(
                'assets/logocv.gif',
              ),
            )),
          )));
}

Widget animate1() {
  return Animator(
    duration: Duration(milliseconds: 2500),
    repeats: 1,
    builder: (anim) => FadeTransition(
          opacity: anim,
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  LoginFormCard(),
                  _buildTextSocialLogin(),
                  _buildSocialMediaIcon(),
                ]),
          ),
        ),
  );
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

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
