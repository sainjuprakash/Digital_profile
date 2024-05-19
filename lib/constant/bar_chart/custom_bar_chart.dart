import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

class CustomBarChart extends StatelessWidget {
  double minY;
  double maxY;
  CustomBarChart({super.key, required this.minY, required this.maxY});

  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
      minY: minY,
      maxY: maxY,
      barGroups: [],
    ));
  }
}
