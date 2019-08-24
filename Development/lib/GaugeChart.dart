import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'dart:math';

class GaugeChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  

  GaugeChart(this.seriesList);

  factory GaugeChart.fromValue(
      {@required double value, @required Color color}) {
    return GaugeChart(
      _createDataFromValue(value, color),
      // Disable animations for image tests.
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
      seriesList,
      
      // Configure the width of the pie slices to 30px. The remaining space in
      // the chart will be left as a hole in the center. Adjust the start
      // angle and the arc length of the pie so it resembles a gauge.
      defaultRenderer: charts.ArcRendererConfig(
        arcWidth: 20,
        startAngle: 2.5 / 5 * pi,
        arcLength: 10 / 5 * pi,
        //arcRendererDecorators: [charts.ArcLabelDecorator(labelPosition: charts.ArcLabelPosition.outside)],
      ),
    );
  }

  static List<charts.Series<GaugeSegment, String>> _createDataFromValue(
      double value, Color color) {
    double toShow = value;
    final data = [
      GaugeSegment('Main', toShow, color),
      GaugeSegment('Rest', 1 - toShow, Colors.black),
    ];

    return [
      charts.Series<GaugeSegment, String>(
        id: 'Segments',
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.value,
        colorFn: (GaugeSegment segment, _) => segment.color,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (GaugeSegment segment, _) =>
            segment.segment == 'Main' ? '${segment.value}' : null,
        data: data,
      )
    ];
  }
}

/// data type.
class GaugeSegment {
  final String segment;
  final double value;
  final charts.Color color;

  GaugeSegment(this.segment, this.value, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}