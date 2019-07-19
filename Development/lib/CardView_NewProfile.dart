import 'package:cvdragonapp_v1/Custom_dialog.dart';
import 'package:cvdragonapp_v1/edit_section.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './Custom_dialog.dart';
import './topmenu.dart';
import './localdatafetch.dart'as lfetch;

class CardProfiles extends StatefulWidget {
  CardProfiles({Key key}) : super(key: key);
  @override
  _CardProfiles createState() => new _CardProfiles();
}

class _CardProfiles extends State<CardProfiles> {
   final items = List<String>.generate(5, (i) => "Item ${i + 1}");
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

    return 
     Scaffold(
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
      body: Container(
              child: Column(
                children:<Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.deepPurple),
                    height: MediaQuery.of(context).size.height/2.5,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: Text("CHOOSE YOUR SECTIONS !",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),))
                  ),
                  
                   Container(
                     height: MediaQuery.of(context).size.height/2,
            child: new PageView.builder(
              
              itemCount: items.length,
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
         var item = items[index];
        return Dismissible(direction: DismissDirection.vertical, key: Key(item),     
        onDismissed: (direction ) {
          if (direction == DismissDirection.up){
                  // Removes that item the list on swipwe
                  setState(() {
                    items.removeAt(index);
                  });
                  // Shows the information on Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("$item dismissed")));
                     
          }
          if (direction == DismissDirection.down){
                  // Removes that item the list on swipwe
                  setState(() {
                    items.removeAt(index);
                  });
                  // Shows the information on Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("$item dismissed")));
                      return showDialog(
                                    context: context,
                                    builder: (BuildContext context) => CustomDialog(
                                      title: "Sections",
                                      description: "Hello Moto",
                                      buttonText: "Okay",
                                    ),
                                  );
          }
                      },
                      
                      
                  child: 
          new Center(
            child: new SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: Curves.easeOut.transform(value) * 500,
              child: child,
            ),
          ),
        );
      },
      child: new Card(
        child: Text("SECTION"),
        elevation: 15.0,
        margin: const EdgeInsets.all(8.0),
        color: Colors.blueGrey,
      ),
    );
  }
}
