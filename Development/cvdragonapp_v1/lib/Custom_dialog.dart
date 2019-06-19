import 'package:flutter/material.dart';
import './const.dart';


class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
  Widget dialogContent(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.5,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: Consts.padding,
        bottom: Consts.padding,
        left: Consts.padding,
        right: Consts.padding,
      ),
      margin: EdgeInsets.only(top: Consts.avatarRadius),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Consts.padding),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: ListView(
        children:<Widget>[
        Container(
          child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ],
    ),


    ),
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              ),

          Container(
            height: 50,
            width: 40,

            alignment: FractionalOffset.center,
            child: RaisedButton(color: Color(0xff232882),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                buttonText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
              ],
        ),

    );
  }
}