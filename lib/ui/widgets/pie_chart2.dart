import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PicChart extends StatelessWidget {
  const PicChart({Key? key, required this.chartData}) : super(key: key);
  final Map<String, dynamic> chartData;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 5,
          borderData: FlBorderData(show: true),
          sectionsSpace: 2,
          sections: [
            PieChartSectionData(
              value: chartData['expenditure'],
              color: chartData['expenditurePercentage'] != 0
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.error,
              radius: 50,
              titleStyle: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontWeight: FontWeight.bold),
            ),
            PieChartSectionData(
              value: chartData['savings'],
              color: chartData['savingsPercentage'] != 0
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.error,
              radius: 50,
              titleStyle: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
