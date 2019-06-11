import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TopMenuBar extends StatelessWidget with PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      automaticallyImplyLeading: true,
        title: Text("cvDragon",style: TextStyle(fontSize: 30),),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[IconButton(icon: Icon(Icons.sync,color: Colors.white,),tooltip: 'Sync',)],
        
    );
  }
    
   Size get preferredSize => Size.fromHeight(60.0);

}