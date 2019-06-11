import 'package:flutter/material.dart';
import './bottombar_preview.dart';
class PreviewPane extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      backgroundColor: Color(0xff232882),
      body: Center(child: Text('Preview Page'),),
      bottomNavigationBar: BottomBar(),
    );
  }
}