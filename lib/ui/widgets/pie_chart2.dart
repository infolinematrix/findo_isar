import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PicChart extends StatelessWidget {
  const PicChart({Key? key, required this.chartData}) : super(key: key);
  final Map<String, dynamic> chartData;
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      color: Colors.transparent,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 5,
          borderData: FlBorderData(show: true),
          sectionsSpace: 2,
          sections: [
            PieChartSectionData(
              value: chartData['expenditure'],
              color: chartData['totalDebitDay'] != 0
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).canvasColor,
              radius: 50,
              titleStyle: TextStyle(
                  color: Theme.of(context).canvasColor,
                  fontWeight: FontWeight.bold),
            ),
            PieChartSectionData(
              value: chartData['savings'],
              color: chartData['totalCreditDay'] != 0
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).canvasColor,
              radius: 50,
              titleStyle: TextStyle(
                  color: Theme.of(context).canvasColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
