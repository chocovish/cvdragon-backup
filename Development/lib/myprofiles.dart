import 'package:cvdragonapp_v1/vishBottomBar.dart';

import './localdatafetch.dart' as lfetch;
import 'package:cvdragonapp_v1/sharedfetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
String id="";
String authkey="";
List data;
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
  id=await readid();
  authkey=await readauthKey();
data =await lfetch.getProfiles(id, authkey);
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
    void _onItemTapped(int index) {
      setState(() {
        print(index);
        _selectedIndex = index;
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
      bottomNavigationBar: MybottomNav(2),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.done_outline),onPressed: (){},),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        child: new PageView.builder(
          itemCount: data == null ? 0 : data.length,
            onPageChanged: (value) {
              setState(() {
                currentpage = value;
              });
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

        return new Center(
          child: new SizedBox(
            height: MediaQuery.of(context).size.height / 1.4,
            width: Curves.easeOut.transform(value) * 500,
            child: child,
          ),
        );
      },
      child: new Card(
        child: Text(data[index].toString()),
        elevation: 15.0,
        margin: const EdgeInsets.all(8.0),
        color: index % 2 == 0 ? Colors.blue : Colors.red,
      ),
    );
  }
}
