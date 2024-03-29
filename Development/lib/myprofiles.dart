import 'package:cvdragonapp_v1/home.dart';
import 'package:cvdragonapp_v1/vishBottomBar.dart';
import './localdatafetch.dart' as lfetch;
import 'package:cvdragonapp_v1/sharedfetch.dart';
import 'package:flutter/material.dart';
import './Create_new_profile_Name.dart';
import 'package:flutter/painting.dart';
import 'package:cvdragonapp_v1/donut.dart';
import './bottombar_home.dart';
import 'GaugeChart.dart';
import './topmenu.dart';
import "./sharedfetch.dart";

String id="";
String authkey="";
List data2;
int filled=14,total=27;
List data;
int pgindex;
bool isLoading=true;
class MyProfiles extends StatefulWidget {
  @override
  _MyProfiles createState() => new _MyProfiles();
}

class _MyProfiles extends State<MyProfiles> {
  PageController controller;
  int currentpage = 0;

  @override
  initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.9,
    );
    get();
  }
void get() async
{
  data=[];
  id=await readid();
  authkey=await readauthKey();
data2 =await lfetch.getProfiles(id, authkey);
data2.forEach((element){
data.add({'cvid':element['cvid'].toString(),'profileName':element['profileName'].toString(),'sections':element['sections'].toString(),});
});
data.add({"Add Profile":"1"});
setState(() {
 isLoading=false;
});
}
  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    onFloatPressed() async {
      var sd = data[currentpage];
      print("sd is $sd");
      Dialog dlg = Dialog(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Selected Profile ${sd['profileName']}"),
      ));
      writeprofile(sd["cvid"]).then((_){
        showDialog(context: context,builder: (_)=>dlg);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePagee()));
      });
    }

    return isLoading?DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/cover.png"), fit: BoxFit.fill)),
              child: Center(
                  child: Image(
                      image: AssetImage("assets/logocv.gif"),
                      height: MediaQuery.of(context).size.height/12,
                      width: MediaQuery.of(context).size.width/6)),
            )
    : Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/homebg.png'),fit: BoxFit.cover)
      ),
      child: Scaffold(
        
        appBar: TopMenuBar(),
       backgroundColor: Colors.black.withOpacity(0.4),
        bottomNavigationBar: MybottomNav(2,"Set"),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.done_outline),onPressed: onFloatPressed,),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
          padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/3.5),
          child: new PageView.builder(
            itemCount: data == null ? 0 : data.length,
              onPageChanged: (value) {
                  currentpage = value;
                  pgindex = currentpage;
                  print("Page Index $pgindex");
                
              },
              controller: controller,
              itemBuilder: (context, index) => builder(index)),
              
        ),
      ),
    );
  }

  builder(int index) {
    return new AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 0.9;
         if (data[index]['Add Profile']=='1'){
          return new Center(
          child: new SizedBox(
            height: MediaQuery.of(context).size.height / 1.4,
            width: Curves.easeOut.transform(value) * 500,
            child: new Card(
         elevation: 15.0,
        margin: const EdgeInsets.all(8.0),
        color: Colors.black,
        child: 
       
        Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:AssetImage('assets/add_new_profile.jpeg'),fit: BoxFit.cover ),
              ),
          child: Center(
            
            child:InkWell(
              onTap: (){
                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => (CardProfilesName())));
              },
                        child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width/1.5,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add_circle,size: 60,color: Colors.white,),
                    Text("Add New Profile",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
      ),
        ),
          ),
          ),
        );
         }
         else
        

        return Container(
          height: MediaQuery.of(context).size.height/4,
          child: new SizedBox(
            height: MediaQuery.of(context).size.height /4 ,
            width: Curves.easeOut.transform(value) * 500,
            child: new Card(
          
          child: 
          Container(
          margin: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
          //color: Colors.white,
    child: Center(child: Text(data[index]['profileName'].toString(),style: TextStyle(fontSize: 25,color: Colors.white),)),),
          // GaugeChart.fromValue(value: 0.34, color: Colors.black),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height / 4,
          //   width: MediaQuery.of(context).size.width,
          //   child: DonutPieChart.withSampleData(total,filled),
          // ),
      
          //Text(data[index].toString()),
          elevation: 15.0,
          margin: const EdgeInsets.all(8.0),
          color: Colors.white.withOpacity(0.5),
          
      ),
          ),
        );
        
      
      },

      
      
    
    );
  }
}
