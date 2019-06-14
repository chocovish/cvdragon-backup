import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import './sidemenu.dart';
import './rightpreviewpane.dart';
//import './donut.dart';
import './HomePage.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

//final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();

class HomePagee extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePagee();
  }
}

class _HomePagee extends State <HomePagee> {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(appBar: TopMenuBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () { },
          tooltip: 'Increment',
          child: Icon(Icons.add),
          elevation: 3
      ),
      bottomNavigationBar: BottomBar(),
      endDrawer: PreviewPane(),
      drawer: SideMenu(),
      body: _buildCardView(),

    );
  }
}

Widget _buildCardView() {
  return Scaffold(
    body: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.account_circle,size: 30,),
            title: Text('Hello User',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w500),),
            subtitle: Text('Your Subscription: ',style: TextStyle(fontSize: 14.0),),
          ),
        ],
      ),
    ),
  );
}
