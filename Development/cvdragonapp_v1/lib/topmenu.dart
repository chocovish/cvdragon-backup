import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class TopMenuBar extends StatelessWidget with PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      automaticallyImplyLeading: true,
        title: Text("cvDragon",style: TextStyle(fontSize: 30),),
        backgroundColor: Color(0xff232882),

        actions: <Widget>[

    InkWell(

      //padding: EdgeInsets.only(right: 20),
    child: Container(
      height: 50.0,
      width: 80.0,

      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
          border: new Border.all(color: Colors.green)
      ),
      child: InkWell(
        onTap: () {

          //Navigator.push(context, MaterialPageRoute(builder: (context)=>(HomePage())));
        },
        child: Center(
          child: Text(
            "SYNC",
            style: TextStyle(
                color: Colors.green,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0),
          ),
        ),
      ),
    ),
    ),

              //RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.sync,color: Colors.green,),label: null,)],
    ],      //IconButton(onPressed:(){},icon: Icon(Icons.sync,color: Colors.green,),tooltip: 'Sync',padding: EdgeInsets.only(right: 10),)],
    );
  }
   Size get preferredSize => Size.fromHeight(60.0);

}