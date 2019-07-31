import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './localdatafetch.dart' as lfetch;

class MyDesigns extends StatefulWidget {
  @override
  _MyDesigns createState() => new _MyDesigns();
}

class _MyDesigns extends State<MyDesigns> {
  PageController controller;
  int currentpage = 0;
  int _selectedIndex = 0;
  List data = [];
  var selected_capsule=1;
  bool isLoading = true;
  @override
  initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.7,
    );
    get();
  }

  void get() async {
    data = await lfetch.getallDesigns();
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
    void _onItemTapped(int index) {
      setState(() {
        //print(index);
        _selectedIndex = index;
      });
    }

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
            bottomNavigationBar: new Theme(
              data: Theme.of(context).copyWith(
                  // sets the background color of the `BottomNavigationBar`
                  canvasColor: Color(0xff232882),
                  // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                  primaryColor: Colors.red,
                  textTheme: Theme.of(context)
                      .textTheme
                      .copyWith(caption: new TextStyle(color: Colors.white))),
              // sets the inactive color of the `BottomNavigationBar`

              child: new BottomNavigationBar(
                elevation: 5.0,
                type: BottomNavigationBarType.fixed,
                currentIndex: 0,
                items: [
                  new BottomNavigationBarItem(
                    icon: new Icon(
                      Icons.add,
                      size: 15,
                    ),
                    title: new Text("Add"),
                  ),
                  new BottomNavigationBarItem(
                    icon: new Icon(
                      Icons.add,
                      size: 15,
                    ),
                    title: new Text("Add"),
                  ),
                  new BottomNavigationBarItem(
                    icon: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.pink),
                      child: new Icon(Icons.add),
                    ),
                    title: new Text("Add"),
                  ),
                  new BottomNavigationBarItem(
                    icon: new Icon(
                      Icons.add,
                      size: 15,
                    ),
                    title: new Text("Add"),
                  ),
                  new BottomNavigationBarItem(
                    icon: new Icon(
                      Icons.delete,
                      size: 15,
                    ),
                    title: new Text("Delete"),
                  )
                ],
              ),
            ),
            body: Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 25),
              child: Column(
                children: <Widget>[
                  StatefulBuilder(
                    builder: (context, setState) => Container(
                          margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  setState(() {
                                      selected_capsule=1;
                                  });
                                
                                  if (controller.hasClients) {
                                    controller.animateToPage(
                                      0,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 18,
                                  width:
                                      MediaQuery.of(context).size.width / 4.3,
                                  alignment: FractionalOffset.center,
                                  decoration: BoxDecoration(
                                      color: selected_capsule==1?Color(0xff232882):Colors.white,
                                      borderRadius: BorderRadius.circular(30.0),
                                      border:
                                          new Border.all(color: selected_capsule==1?Colors.white:Color(0xff232882),)),
                                  child: Text(
                                    "Attitude",
                                    style: TextStyle(
                                        color: selected_capsule==1?Colors.white:Color(0xff232882),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  selected_capsule=2;
                                  if (controller.hasClients) {
                                    controller.animateToPage(
                                      11,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 18,
                                  width:
                                      MediaQuery.of(context).size.width / 4.3,
                                  alignment: FractionalOffset.center,
                                  decoration: BoxDecoration(
                                      color: selected_capsule==2?Color(0xff232882):Colors.white,
                                      borderRadius: BorderRadius.circular(30.0),
                                      border:
                                          new Border.all(color:selected_capsule==2?Colors.white:Color(0xff232882))),
                                  child: Text(
                                    "Elegance",
                                    style: TextStyle(
                                       color:selected_capsule==2?Colors.white:Color(0xff232882),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  selected_capsule=3;
                                  if (controller.hasClients) {
                                    controller.animateToPage(
                                      19,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 18,
                                  width:
                                      MediaQuery.of(context).size.width / 4.3,
                                  alignment: FractionalOffset.center,
                                  decoration: BoxDecoration(
                                      color: selected_capsule==3?Color(0xff232882):Colors.white,
                                      borderRadius: BorderRadius.circular(30.0),
                                      border:
                                          new Border.all(color:selected_capsule==3?Colors.white:Color(0xff232882))),
                                  child: Text(
                                    "Creativity",textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color:selected_capsule==3?Colors.white:Color(0xff232882),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  selected_capsule=4;
                                  if (controller.hasClients) {
                                    controller.animateToPage(
                                      23,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 18,
                                  width:
                                      MediaQuery.of(context).size.width / 4.3,
                                  alignment: FractionalOffset.center,
                                  decoration: BoxDecoration(
                                     color: selected_capsule==4?Color(0xff232882):Colors.white,
                                      borderRadius: BorderRadius.circular(30.0),
                                      border:
                                          new Border.all(color:selected_capsule==4?Colors.white:Color(0xff232882))),
                                  child: Text(
                                    "Institutes",textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color:selected_capsule==4?Colors.white:Color(0xff232882),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    width: MediaQuery.of(context).size.width,
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
                ],
              ),
            ),
          );
  }

  builder(int index) {
    return new AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 0.9;
        print(data[index]['category'].toString());
        return new Center(
          child: new SizedBox(
            height: MediaQuery.of(context).size.height / 1.8,
            width: Curves.easeOut.transform(value) * 500,
            child: child,
          ),
        );
      },
      child: new Card(
        child: Image(
          image: new AssetImage("assets/resumeDesignsLarge/" +
              data[index]['designid'].toString() +
              ".jpg"),
          fit: BoxFit.fill,
        ),
        // child: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/resumeDesignsLarge/1.jpg"))),),
        elevation: 15.0,
        margin: const EdgeInsets.all(8.0),
        color: index % 2 == 0 ? Colors.blue : Colors.red,
      ),
    );
  }
}
