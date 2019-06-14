import 'package:flutter/material.dart';
import './bottombar_preview.dart';
import './topmenu.dart';
class PreviewPane extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: TopMenuBar(),
      backgroundColor: Colors.white,
      body: Center(child: Text('Preview Page'),),
      bottomNavigationBar: BottomBar(),
    );
  }
}