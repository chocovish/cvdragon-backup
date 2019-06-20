//import 'package:flutter_reactive_button/flutter_reactive_button.dart';
//import 'package:flutter/material.dart';
//
//class PageReactiveButton extends StatefulWidget {
//  @override
//  _PageReactiveButtonState createState() => _PageReactiveButtonState();
//}
//
//class _PageReactiveButtonState extends State<PageReactiveButton> {
//
//  List<ReactiveIconDefinition> _facebook = <ReactiveIconDefinition>[
//    ReactiveIconDefinition(
//      assetIcon: 'assets/like.gif',
//      code: 'like',
//    ),
//    ReactiveIconDefinition(
//      assetIcon: 'assets/haha.gif',
//      code: 'haha',
//    ),
//    ReactiveIconDefinition(
//      assetIcon: 'assets/love.gif',
//      code: 'love',
//    ),
//    ReactiveIconDefinition(
//      assetIcon: 'assets/sad.gif',
//      code: 'sad',
//    ),
//    ReactiveIconDefinition(
//      assetIcon: 'assets/wow.gif',
//      code: 'wow',
//    ),
//    ReactiveIconDefinition(
//      assetIcon: 'assets/angry.gif',
//      code: 'angry',
//    ),
//  ];
//
//
//  String facebook;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(child:
//        //scrollDirection: Axis.vertical,
//        Column(
//          children: <Widget>[
//            Container(
//              height: 850.0,
//              color: Colors.blueGrey,
//            ),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Text('Here is some text'),
//            ),
//            ReactiveButton(
//              child: Container(
//                decoration: BoxDecoration(
//                  border: Border.all(
//                    color: Colors.black,
//                    width: 1.0,
//                  ),
//                  color: Colors.white,
//                ),
//                width: 80.0,
//                height: 40.0,
//                child: Center(
//                  child: facebook == null
//                      ? Text('click')
//                      : Image.asset(
//                    'images/$facebook.png',
//                    width: 32.0,
//                    height: 32.0,
//                  ),
//                ),
//              ),
//              icons: _facebook, //_flags,
//              onTap: () {
//                print('TAP');
//              },
//              onSelected: (ReactiveIconDefinition button) {
//                setState(() {
//                  facebook = button.code;
//                });
//              },
//              iconWidth: 32.0,
//            ),
//            Container(
//              height: 800.0,
//              color: Colors.blueGrey,
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
