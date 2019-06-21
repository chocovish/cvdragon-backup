import 'package:cvdragonapp_v1/topmenu.dart';
import 'package:flutter_reactive_button/flutter_reactive_button.dart';
import 'package:flutter/material.dart';
import './bottombar_preview.dart';
import './cvwebview.dart';
import 'package:photo_view/photo_view.dart';
import './Design_Sections.dart';


class PreviewPane extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PreviewPane();
  }
}

class _PreviewPane extends State<PreviewPane> {
  //String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {

      print(index);
    });
  }

  List<ReactiveIconDefinition> _facebook = <ReactiveIconDefinition>[
    ReactiveIconDefinition(
      assetIcon: 'assets/like.gif',
      code: 'like',
    ),
    ReactiveIconDefinition(
      assetIcon: 'assets/haha.gif',
      code: 'haha',
    ),
    ReactiveIconDefinition(
      assetIcon: 'assets/love.gif',
      code: 'love',
    ),

  ];

  String facebook;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            heroTag: "btn1",
            backgroundColor: Colors.pinkAccent,
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  

                  child: ReactiveButton(

                    iconPadding: 40,
                    iconGrowRatio: 1.2,
                    padding: EdgeInsets.only(right: 83),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: null,
                        backgroundBlendMode: BlendMode.colorDodge,
                        boxShadow: null),
                    child: Container(child: Icon(Icons.arrow_downward,color: Colors.white,),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.pinkAccent),
                      width: 48.0,
                      height: 48.0,
                    ),
                    icons: _facebook,
                    //containerPadding: 20,

                    //_flags,
                    onTap: () {
                      print('TAP');
                    },
                    onSelected: (ReactiveIconDefinition button) {
                      setState(() {
                        facebook = button.code;
                      });
                    },
                    iconWidth: MediaQuery.of(context).size.width / 9.7,
                  ),
                ),
              ],
            ),
          ),
          appBar: TopMenuBar(),
          backgroundColor: Colors.black,
          body: CVView(),
          // body: PhotoView(
          //   imageProvider: AssetImage("assets/cv.png"),
          //   minScale: PhotoViewComputedScale.contained * 0.9,
          //   maxScale: PhotoViewComputedScale.covered * 1.8,
          //   customSize: MediaQuery.of(context).size,
          //   initialScale: PhotoViewComputedScale.contained * 0.9,
          // ),
          bottomNavigationBar: FABBottomAppBar(
            notchedShape: CircularNotchedRectangle(),
            color: Colors.white30,
            centerItemText: "Download",
            backgroundColor: Color(0xff232882),
            selectedColor: Colors.white,
            items: [
              FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
              FABBottomAppBarItem(iconData: Icons.edit, text: 'Designs'),
              FABBottomAppBarItem(iconData: Icons.edit, text: 'Sections'),
              FABBottomAppBarItem(iconData: Icons.more, text: 'More'),
            ],
            onTabSelected: _selectedTab,
          )),
    );
  }
}
