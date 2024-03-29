import 'package:cvdragonapp_v1/sharedfetch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './localdatafetch.dart' as lfetch;

double value = 0.9;
List colors = [];
bool isLoading = true;

class Colorset extends StatefulWidget {
  @override
  _Colorset createState() => new _Colorset();
}

class _Colorset extends State<Colorset> {
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

  void get() async {
    colors = await lfetch.getColors();
    setState(() {
      isLoading = false;
    });
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? DecoratedBox(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/cover.png"), fit: BoxFit.fill)),
            child: Center(
                child: Image(
                    image: AssetImage("assets/logocv.gif"),
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width / 6)),
          )
        : Scaffold(
            appBar: TopMenuBar(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.pinkAccent,
              onPressed: () {
                //var c = colors[currentpage];
                //print(c);
                //String s = "${c['color1']}_${c['color2']}_${c['color3']}_${c['color4']}";
                //print(s);
                writecolor(currentpage.toString());
                readcolor().then((v) {
                  print(v);
                });

                showCupertinoDialog(
                  context: context,
                  builder: (c) => CupertinoAlertDialog(
                    title: Text("Colour Selected!"),
                    actions: <Widget>[
                      CupertinoButton(
                        child: Text("OK!"),
                        onPressed: Navigator.of(context).pop,
                      ),
                    ],
                  ),
                );
              },
              child: Icon(
                Icons.color_lens,
                color: Colors.white,
              ),
              elevation: 0.0,
            ),
            bottomNavigationBar: FABBottomAppBar(
              notchedShape: CircularNotchedRectangle(),
              color: Colors.white30,
              centerItemText: "Change",
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
                  itemCount: colors == null ? 0 : colors.length,
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
            height: MediaQuery.of(context).size.height / 1.4,
            width: Curves.easeOut.transform(value) * 500,
            child: child,
          ),
        );
      },
      child: new Card(
        elevation: 15.0,
        margin: const EdgeInsets.all(8.0),
        color: index % 2 == 0 ? Colors.white : Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 1.4,
              width: 160,
              //color: Colors.black,
              decoration: BoxDecoration(
                  color: Color(int.parse("0xff" +
                      colors[index]['color1'].toString().substring(1))),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      topLeft: Radius.circular(5.0))),
              alignment: Alignment.topLeft,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.4,
              width: 148,
              //color: Colors.black,
              //decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.only(bottomRight: Radius.circular(5.0),topRight: Radius.circular(5.0))),
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 2.91,
                    width: 148,
                    decoration: BoxDecoration(
                        color: Color(int.parse("0xff" +
                            colors[index]['color2'].toString().substring(1))),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(5.0))),
                    //color: Colors.red,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.895,
                    width: 148,
                    //color: Colors.blueGrey,
                    decoration: BoxDecoration(
                        color: Color(int.parse("0xff" +
                            colors[index]['color3'].toString().substring(1))),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5.0))),
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
