import 'package:cvdragonapp_v1/home.dart';
import 'package:cvdragonapp_v1/sync.dart';
import 'package:flutter/material.dart';
import './earlyfetch.dart' as efetch;

class LayerBeforeHP extends StatefulWidget{
  @override
  _LayerBeforeHPState createState() => _LayerBeforeHPState();
}

class _LayerBeforeHPState extends State<LayerBeforeHP> {
  bool isLoading=true;
  int val=0;
  void g() async
  {

    
    print("Entered Here");
    print("Syncing the file");
    await syncthedata(context);
    int val = await efetch.get();
    if(val==1)
    {
      setState(() {
       isLoading=false; 
      });
    }
     
  }
@override
  void initState()
  {
  
      g();
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePagee()));
  }
  Widget build(BuildContext context) {
    // return HomePagee();
   
    return  isLoading?DecoratedBox(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/cover.png"), fit: BoxFit.fill)),
            child: Center(
                child: Image(
                    image: AssetImage("assets/logocv.gif"),
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width / 6)),
          ):HomePagee();
  }
}