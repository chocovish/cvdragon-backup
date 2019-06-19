import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_design.dart';
import './topmenu.dart';
import './rightpreviewpane.dart';


class Designs extends StatefulWidget {

  @override
  _Designs  createState() => new _Designs();
}

class _Designs extends State<Designs> {

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
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: TopMenuBar(),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<Null>(builder: (BuildContext context) {
              return PreviewPane();
            },
            ),
          );
        },
        child: Icon(
          Icons.visibility,
          color: Colors.white,
        ),
        elevation: 0.0,
      ),
      bottomNavigationBar: FABBottomAppBar(
        notchedShape: CircularNotchedRectangle(),
        color: Colors.white30,
        centerItemText: "Preview",
        backgroundColor: Color(0xff232882),
        selectedColor: Colors.white,
        items: [
          FABBottomAppBarItem(
              iconData: Icons.import_contacts, text: 'Knowledge'),
          //FABBottomAppBarItem(iconData: Icons.edit, text: 'Sections'),
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          //FABBottomAppBarItem(iconData: Icons.visibility, text: 'Preview'),
        ],
      ),
      body: Container(
        child: new PageView.builder(
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
            //height: Curves.easeOut.transform(value) * 550,
            width: Curves.easeOut.transform(value) * 500,
            
            
            child: child,
          ),
        );
      },
      child: new Card(
        elevation: 15.0,
        margin: const EdgeInsets.all(8.0),
        color: index % 2 == 0 ? Colors.blue : Colors.red,
      ),
    );
  }
}