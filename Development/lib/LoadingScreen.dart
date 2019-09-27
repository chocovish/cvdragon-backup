import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/cover.png"), fit: BoxFit.fill)),
      child: Center(
          child: Image(
              image: AssetImage("assets/logocv.gif"),
              height: MediaQuery.of(context).size.height / 12,
              width: MediaQuery.of(context).size.width / 6)),
    );
  }
}
