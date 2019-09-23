import 'package:cvdragonapp_v1/faq.dart';
import 'package:cvdragonapp_v1/help_submit.dart';
import 'package:cvdragonapp_v1/more_inquiry.dart';
import 'package:flutter/material.dart';



class Help extends StatefulWidget {
 // Help({Key key, this.title}) : super(key: key);

  
 // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Help> with SingleTickerProviderStateMixin {
//TabController tabCont = TabController(vsync: ,length: 3);
TabController controller;
@override
void initState(){
  super.initState();
  controller = new TabController(vsync: this,length: 3);

}
@override
void dispose(){
  controller.dispose();
  super.dispose();
}
  TextEditingController name = TextEditingController();
 TextEditingController email = TextEditingController();
 TextEditingController phone = TextEditingController();
 TextEditingController query = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
 
    return Scaffold(
      
      appBar: AppBar(
        
       title: Text('CvDragon Help Center'),
       
       bottom: TabBar(
         controller: controller,
         tabs:<Tab> [
                //Tab(icon: Icon(Icons.directions_car)),
                Tab(child: Text('FAQ')),
               // Tab(icon: Icon(Icons.directions_transit)),
                 Tab(child: Text(
                   'Submit',style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold),
                   )
                   ),
                Tab(icon: Icon(Icons.add)),
              ],
            ),
            ),
            
          body: TabBarView(
            controller: controller,
            children: [
              Faq(),
              HelpSubmit(),
              MoreInquiry(),

              // Icon(Icons.directions_car),
              // Icon(Icons.directions_transit),
              // Icon(Icons.directions_bike),
            ],
     )
    );
  }
}