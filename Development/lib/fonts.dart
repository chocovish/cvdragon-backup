import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_design.dart';
import './topmenu.dart';
import './localdatafetch.dart' as lfetch;
import './rightpreviewpane.dart';
List font=[];
bool isLoading=true;
class CVFont extends StatefulWidget {

  _CVFont  createState() => new _CVFont();
}

class _CVFont extends State<CVFont> {

  PageController controller;
  int currentpage = 0;


  @override
  initState() {
    super.initState();
    get();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.9,
    );
  }

  void get()async{
font=await lfetch.getFonts();
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
    :Scaffold(
      appBar: TopMenuBar(),
      //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.pinkAccent,
      //   onPressed: () {
      //     Navigator.of(context).push(
      //       MaterialPageRoute<Null>(builder: (BuildContext context) {
      //         return PreviewPane();
      //       },
      //       ),
      //     );
      //   },
      //   child: Icon(
      //     Icons.visibility,
      //     color: Colors.white,
      //   ),
      //   elevation: 0.0,
      // ),
      // bottomNavigationBar: FABBottomAppBar(
      //   notchedShape: CircularNotchedRectangle(),
      //   color: Colors.white30,
      //   centerItemText: "Preview",
      //   backgroundColor: Color(0xff232882),
      //   selectedColor: Colors.white,
      //   items: [
      //     FABBottomAppBarItem(
      //         iconData: Icons.import_contacts, text: 'Knowledge'),
      //     //FABBottomAppBarItem(iconData: Icons.edit, text: 'Sections'),
      //     FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
      //     //FABBottomAppBarItem(iconData: Icons.visibility, text: 'Preview'),
      //   ],
      // ),
      body: Container(
        child: new PageView.builder(
           itemCount: font == null ? 0 : font.length,
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
            height: MediaQuery.of(context).size.height/1.4,
            width: Curves.easeOut.transform(value) * 500,
            child: child,
          ),
        );
      },
      child: new Card(
        child: Center(child: Text(font[index]['fontType'].toString(),style: TextStyle(fontSize: 50,fontFamily: "RobotoItalic"),)),
        elevation: 15.0,
        margin: const EdgeInsets.all(8.0),
        color: Colors.white,
      ),
    );
  }
}