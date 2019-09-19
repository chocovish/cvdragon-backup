import 'package:flutter/material.dart';

class MoreInquiry extends StatefulWidget{
 
@override
  _Third createState() {
    // TODO: implement createState
    return _Third();
  }

}
class _Third extends State<MoreInquiry>{
  TextEditingController name = TextEditingController();

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child:  Container(
      padding: EdgeInsets.all(20.0),
      color: Colors.transparent,
    child: Column(
      children: <Widget>[
        // Text('If any miss Write here!'),
           Container(
             padding: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topLeft,
           child: Text('If any miss Write here!',
            style: TextStyle(
         fontSize: 20.0,
         fontWeight: FontWeight.bold,
              

              ), 
                ),
            ),
          ),
          TextField(
            
           // controller: phone,
            keyboardType: TextInputType.multiline,
            controller: name,
            maxLines: null,
            decoration: InputDecoration(
              
              contentPadding: const EdgeInsets.symmetric(vertical: 100.0),
              border:OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              )
            ),
          ),
             SizedBox(height: 20.0,),
          Container(
            height: 30.0,
            
            child: RaisedButton(
              onPressed: (){
                setState(() {
                  _reset();
                });
              },
              child: Text('Submit',
               style: TextStyle(
         fontSize: 20.0,
         color: Colors.blueGrey,
         fontWeight: FontWeight.bold,
              

              ),   
             ),
            ),
          )
 

      ],
      
    ),
    ),
    );
  }
   void _reset(){
        name.text = '';
   }    
  }


