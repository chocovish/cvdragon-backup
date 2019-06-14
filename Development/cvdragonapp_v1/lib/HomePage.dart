import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }}

class _HomePageState extends State<HomePage> {

  List<charts.Series<Task, String>> _seriesPieData;

  _generateData() {
    var piedata = [
      new Task('Work', 35.8, Color(0xff3366cc)),
      new Task('Eat', 8.3, Color(0xff990099)),
      new Task('Commute', 10.8, Color(0xff109618)),
      new Task('TV', 15.6, Color(0xfffdbe19)),
      new Task('Sleep', 19.2, Color(0xffff9900)),
      new Task('Other', 10.3, Color(0xffdc3912)),
    ];

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Work',
        data: piedata,
      ),
    );
  }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _seriesPieData = List<charts.Series<Task, String>>();
      _generateData();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Time spent on daily tasks', style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),),
                          SizedBox(height: 10.0,),
                          Expanded(
                            child: charts.PieChart(
                                _seriesPieData,
                                animate: true,
                                animationDuration: Duration(seconds: 5),
                                defaultRenderer: new charts.ArcRendererConfig(
                                    arcWidth: 100,
                                    arcRendererDecorators: [
                                      new charts.ArcLabelDecorator(
                                          labelPosition: charts.ArcLabelPosition
                                              .inside)
                                    ])),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),



      );
    }
  }



class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}