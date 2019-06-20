import 'package:cvdragonapp_v1/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './fetch.dart' as fetch;

String mobileno;

class OtpPage extends StatefulWidget {
  OtpPage(String mobile) {
    mobileno = mobile;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OtpPage();
  }
}

class _OtpPage extends State<OtpPage> {
  final myController = TextEditingController();
  bool _isLoading = true;
  String otp;
  List data;

  void get() {
    fetch.getOtp(mobileno).then((List res) {
      setState(() {
        data = res;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
    verify() {
      if (myController.text.toString() == data[1]['OTP'].toString())
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePagee()));
      else
        Scaffold.of(context).showSnackBar(snackBar);
      }

    // TODO: implement build
    return Scaffold(
        body: _isLoading
            ? DecoratedBox(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/cover.png"),
                        fit: BoxFit.fill)),
                child: Center(
                    child: Image(
                        image: AssetImage("assets/logocv.gif"),
                        height: 75.0,
                        width: 75.0)),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/cover.png'),
                        fit: BoxFit.fill)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 7,
                      child: Text(
                        "Verification Code",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 16,
                      child: Text(
                        "Please type the verification code sent to your mobile",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: TextField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            controller: myController,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30, color: Colors.white),
                            autofocus: true,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        _buildHorizontalLine()
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: InkWell(
                        child: Container(
                          height: 50.0,
                          width: 150.0,
                          alignment: FractionalOffset.center,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30.0),
                              border: new Border.all(color: Colors.white)),
                          child: InkWell(
                            onTap: () {
                              verify();
                            },
                            child: Text(
                              "Submit OTP",
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
                  ],
                )));
  }

  Widget _buildHorizontalLine() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 2.0,
          height: 1.0,
          color: Colors.white,
        ),
      ),
    );
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    this.get();
  }
}
