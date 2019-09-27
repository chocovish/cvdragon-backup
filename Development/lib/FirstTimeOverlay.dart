import 'package:flutter/material.dart';
import 'sharedfetch.dart' show readFirstTime,writeFirstTime;

class FirstTimeOverlay extends StatefulWidget {
  @override
  _FirstTimeOverlayState createState() => _FirstTimeOverlayState();
}

class _FirstTimeOverlayState extends State<FirstTimeOverlay> {

  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
    //isFirstTime = await readFirstTime();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
                  !isFirstTime ? SizedBox() : Positioned(
                    child: Image.asset(
                  "assets/overlay-small.png",
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover ,
                )),
                !isFirstTime ? SizedBox() : Positioned(
                  top: 100,
                  left: 100,
                  child: MaterialButton(
                    color: Colors.purple,
                    child: Text("Gotcha!"),
                    onPressed: () {
                      print("clicking");
                      writeFirstTime(false);
                      setState(() {
                       isFirstTime = false; 
                      });
                      print("Done.setting State");
                    },
                  ),
                )
                ],);
  }
}