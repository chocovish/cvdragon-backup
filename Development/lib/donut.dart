import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();
var f=0,t=0;
class Donut extends StatelessWidget{
Donut(var a,var b){
 f=a;t=b;
}
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new AnimatedCircularChart(
  key: _chartKey,
  size: Size(300,300),
  initialChartData: <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(
         (f/t)*100.floor(),
          Colors.pink,
          rankKey: 'completed',
        ),
        new CircularSegmentEntry(
       (100-(f/t)*100),
          Colors.purple,
          rankKey: 'remaining',
        ),
      ],
      rankKey: 'progress',
    ),
  ],
  chartType: CircularChartType.Radial,
  percentageValues: true,
  holeLabel: f.floor().toString()+"/"+t.floor().toString(),
  labelStyle: new TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 24.0,
  ),
);
  }

}









// class DonutPieChart extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   final bool animate;
// int a1,b1;
//   DonutPieChart(this.seriesList,this.a1,this.b1,{this.animate});

//   /// Creates a [PieChart] with sample data and no transition.
//   factory DonutPieChart.withSampleData(int a,int b) {
//     return new DonutPieChart(
//       _createSampleData(a,b),a,b,
//       // Disable animations for image tests.
//       animate: true,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: <Widget>[Center(child: Text(a1.toString()+"/"+b1.toString(),style:TextStyle(fontSize: 20)),),
//       charts.PieChart(seriesList,
//         animate: animate,animationDuration: Duration(milliseconds: 1500),
//         // Configure the width of the pie slices to 60px. The remaining space in
//         // the chart will be left as a hole in the center.
//         defaultRenderer:  charts.ArcRendererConfig(arcWidth: 18))

//   ]); 
// }

//   /// Create one series with sample hard coded data.
//   static List<charts.Series<LinearSales, int>> _createSampleData(int a,int b) {
//     final data = [
//       new LinearSales(0,100),
//       new LinearSales(1, ((a/b)*100).floor()),
//       //new LinearSales(2, 25),
//       //new LinearSales(3, 5),
//     ];

//     return [
//       new charts.Series<LinearSales, int>(
//         id: 'Sales',
//         domainFn: (LinearSales sales, _) => sales.year,
//         measureFn: (LinearSales sales, _) => sales.sales,
//         data: data,
//       )
//     ];
//   }
// }

// /// Sample linear data type.
// class LinearSales {
//   final int year;
//   final int sales;

//   LinearSales(this.year, this.sales);
// }
