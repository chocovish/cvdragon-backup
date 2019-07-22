import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';

double value = 0.9;


class Colorset extends StatefulWidget {
  @override
  _Colorset  createState() => new _Colorset();
}

class _Colorset extends State<Colorset> {
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
        onPressed: () {},
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
              iconData: Icons.account_circle, text: 'Profiles'),
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
        //double value = 0.9;

        return new Center(
          child: new SizedBox(
            height: MediaQuery.of(context).size.height/1.4,
            width: Curves.easeOut.transform(value) * 500,


            child: child,
          ),
        );
      },
      child: new Card(
        elevation: 15.0,
        margin: const EdgeInsets.all(8.0),
        color: index % 2 == 0 ? Colors.white : Colors.white,
        child: Row(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height/1.4,
            width: 160,
            //color: Colors.black,
            decoration: BoxDecoration(color: Colors.deepOrange,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.0),topLeft: Radius.circular(5.0))),
            alignment: Alignment.topLeft,


          ),
          Container(
            height: MediaQuery.of(context).size.height/1.4,
             width: 148,
            //color: Colors.black,
            //decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.only(bottomRight: Radius.circular(5.0),topRight: Radius.circular(5.0))),
            alignment: Alignment.topLeft,
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height/2.91,
                  width: 148,
                  decoration: BoxDecoration(color: Color(0xff000580),borderRadius: BorderRadius.only(topRight: Radius.circular(5.0))),
                  //color: Colors.red,
                ),
                Container(
                  height: MediaQuery.of(context).size.height/2.895,
                  width: 148,
                  //color: Colors.blueGrey,
                  decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.only(bottomRight: Radius.circular(5.0))),
                )
              ],
            ),


          ),
      ],
      ),
      ),
    );
  }
}



