import 'package:cvdragonapp_v1/localdatapush.dart' as local;
import 'package:cvdragonapp_v1/otppage.dart';
import 'package:flutter/material.dart';

final myController = TextEditingController();

class LoginFormCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginFormCardState();
  }
}

/// place: "/"
class LoginFormCardState extends State<LoginFormCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 200.0,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          _buildMobileForm(),
          _buildHorizontalLine(),
          _buildVerifyButton(),
        ],
      ),
    );
  }

  Widget _buildMobileForm() {
    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myController.dispose();
      super.dispose();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextField(
          controller: myController,
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
    );
  }

  Widget _buildHorizontalLine() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.0,
          height: 1.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildVerifyButton() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: InkWell(
          onTap: () {
           // local.push().then((int status) {
             // if (status == 1)
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OtpPage(myController.text.toString())));
          //  });
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
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPage(myController.text.toString())));
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
    );
  }
}
