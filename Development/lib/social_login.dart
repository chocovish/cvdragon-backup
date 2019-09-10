import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final Function onPressed;

  SocialIcon({this.onPressed});

  @override
  Widget build(BuildContext context) {
   
    return Container(

        width: 250.0,
        height: 45.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Row(
//            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Container(padding: EdgeInsets.only(left: 20,right: 20),child: CircleAvatar(

                  backgroundImage: ExactAssetImage('assets/facebook.jpg'),
                  minRadius: 90,
                  maxRadius: 150,
                ),
                ),
              ),
              Expanded(child: Container(padding: EdgeInsets.only(left: 20,right: 20),child:  CircleAvatar(
                backgroundImage: ExactAssetImage('assets/google.png'),
                minRadius: 90,
                maxRadius: 150,
              ),),),

              Expanded(child: Container(padding: EdgeInsets.only(left: 20,right: 20),child: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/linkedin.jpg'),
                minRadius: 90,
                maxRadius: 150,
              ),
              ),
              ),
            ]));
  }
}
