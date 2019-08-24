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
    : Scaffold(
      appBar: TopMenuBar(),
      // bottomNavigationBar: new Theme(
      //   data: Theme.of(context).copyWith(
      //       // sets the background color of the `BottomNavigationBar`
      //       canvasColor: Color(0xff232882),
      //       // sets the active color of the `BottomNavigationBar` if `Brightness` is light
      //       primaryColor: Colors.red,
      //       textTheme: Theme.of(context)
      //           .textTheme
      //           .copyWith(caption: new TextStyle(color: Colors.white))),
      //   // sets the inactive color of the `BottomNavigationBar`
      //   child: new BottomNavigationBar(
          
      //     elevation: 5.0,
      //     type: BottomNavigationBarType.fixed,
      //     currentIndex: 0,
      //     items: [
      //       new BottomNavigationBarItem(
      //         icon: new Icon(Icons.add,size: 15,),
      //         title: new Text("Add"),
      //       ),
      //       new BottomNavigationBarItem(
      //         icon: new Icon(Icons.add,size: 15,),
      //         title: new Text("Add"),
      //       ),
      //       new BottomNavigationBarItem(
      //         icon: Container(
      //           padding: EdgeInsets.all(10.0),
      //           decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.pink),
      //           child: new Icon(Icons.add),
      //         ),
      //         title: new Text("Add"),
      //       ),
      //       new BottomNavigationBarItem(
      //         icon: new Icon(Icons.add,size: 15,),
      //         title: new Text("Add"),
      //       ),
      //       new BottomNavigationBarItem(
      //         icon: new Icon(Icons.delete,size: 15,),
      //         title: new Text("Delete"),
      //       )
      //     ],
      //   ),
      // ),
      bottomNavigationBar: MybottomNav(2,"Set"),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.done_outline),onPressed: onFloatPressed,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
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
       
        Center(
          
          child:InkWell(
            onTap: (){
              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (CardProfilesName())));
            },
                      child: Container(
              height: MediaQuery.of(context).size.height / 3,
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
        );
         }
         else
        

        return new Center(
          child: new SizedBox(
            height: MediaQuery.of(context).size.height / 1.4,
            width: Curves.easeOut.transform(value) * 500,
            child: new Card(
        
        child: 
        Container(
          margin: EdgeInsets.only(top: 20,bottom: 200,left: 20,right: 20),
          //color: Colors.white,
    child: Stack(children: [
         GaugeChart.fromValue(value: 0.40, color: Colors.green),
        Center(
            child: Text(
        '${(0.4*100).toInt()}%',
        ))
    ])),
        // GaugeChart.fromValue(value: 0.34, color: Colors.black),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height / 4,
        //   width: MediaQuery.of(context).size.width,
        //   child: DonutPieChart.withSampleData(total,filled),
        // ),
      
        //Text(data[index].toString()),
        elevation: 15.0,
        margin: const EdgeInsets.all(8.0),
        color: Colors.white,
        
      ),
          ),
        );
        
      
      },

      
      
    
    );
  }
}
