import 'package:flutter/material.dart';

class DesignSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   
    return _DesignSection();
  }
}

class _DesignSection extends State<DesignSection> {

  //bool _isLoading=true;
  void _selectedTab(int index) {
    setState(() {
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      endDrawer: Drawer(
      elevation: 2,
      child:Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/cover.png"), fit: BoxFit.fill)),
      ),
      ),
    );

  }
}