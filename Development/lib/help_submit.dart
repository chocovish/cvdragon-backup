import 'package:flutter/material.dart';

class HelpSubmit extends StatefulWidget{

@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Tab();
  }

}
class _Tab extends State< HelpSubmit>{

    TextEditingController name = TextEditingController();
 TextEditingController email = TextEditingController();
 TextEditingController phone = TextEditingController();
 TextEditingController query = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
 
    return
    SingleChildScrollView(child: Container(
        // width: 100,
        // height: 100,
        padding: EdgeInsets.all(20.0),
         color: Colors.transparent,
        child: Column(
          children: <Widget>[
          Container(
            child: Align(
              alignment: Alignment.topLeft,
           child: Text('Name',
            style: TextStyle(
         fontSize: 20.0,
         fontWeight: FontWeight.bold,
              

              ),   
              ),
            ),
          ),
             // 
             TextField(
               controller: name,
               keyboardType: TextInputType.text,
               decoration: InputDecoration(
                 border:OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)) ,
                 )
               ),
             ),
           SizedBox(height: 20.0,),
          
            Container(
            child: Align(
              alignment: Alignment.topLeft,
           child: Text('Email',
            style: TextStyle(
         fontSize: 20.0,
         fontWeight: FontWeight.bold,
              

              ),   
              ),
            ),
          ),
           TextField(
             controller: email,
             keyboardType: TextInputType.emailAddress,
             decoration: InputDecoration(
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
               )
             ),
           ),
           SizedBox(height: 20.0,),
           
        Container(
            child: Align(
              alignment: Alignment.topLeft,
           child: Text('Phone',
            style: TextStyle(
         fontSize: 20.0,
         fontWeight: FontWeight.bold,
              

              ), 
                ),
            ),
          ),
          TextField(
            controller: phone,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border:OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              )
            ),
          ),
           SizedBox(height: 20.0,),
       Container(
      
        // width: 50.0,
            child: Align(
              alignment: Alignment.topLeft,
           child: Text('Quries',
            style: TextStyle(
         fontSize: 20.0,
         fontWeight: FontWeight.bold,
              

              ),         
                   ),
            ),
          ),
          TextFormField(
            controller: query,
            
            keyboardType: TextInputType.multiline,
                  maxLines: null,
          decoration:InputDecoration (
             contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
           border: OutlineInputBorder(
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
          //style: Theme.of(context).textTheme.display1,
          //   ),
          //    SizedBox(height: 15.0,),
          //    Text('Phone'),
          //    TextField(),
          //   //  SizedBox(height: 15.0,),
          //    TextField(),
          //  //  SizedBox(height: 15.0,),
          //    Text('Quries'),
          //    TextField(),
          
          
          ],
        ),
    ),
    );
  }
   void _reset(){
        name.text = '';
        email.text= '';
         phone .text = '';
         query.text = '';
  }

  
  }


