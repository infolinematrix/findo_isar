import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PicChart extends StatelessWidget {
  const PicChart({super.key, required this.chartData});
  final Map<String, dynamic> chartData;
  @override
  Widget build(BuildContext context) {
    // final double d = chartData['totalDr'] / chartData['totalCr'] == 0
    //     ? 1
    //     : chartData['totalCr'] * 100;
    // final double c = 100.00 - d;

    return Placeholder(
      color: Colors.transparent,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 5,
          borderData: FlBorderData(show: true),
          sectionsSpace: 2,
          sections: [
            PieChartSectionData(
              value: 125.roundToDouble(),
              color: Colors.red,
              radius: 50,
              titleStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            PieChartSectionData(
              value: 154.roundToDouble(),
              color: Theme.of(context).primaryColor,
              radius: 50,
              titleStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// class PieChartSample1 extends StatefulWidget {
//   const PieChartSample1({super.key, required this.chartData});

//   final Map<String, dynamic> chartData;

//   @override
//   State<StatefulWidget> createState() => PieChartSample1State();
// }

// class PieChartSample1State extends State {
//   int touchedIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     return PieChart(
//       PieChartData(
//         centerSpaceRadius: 5,
//         borderData: FlBorderData(show: true),
//         sectionsSpace: 2,
//         sections: [
//           PieChartSectionData(
//             value: chartData['amountDr'],
//             color: Theme.of(context).primaryColor,
//             radius: 50,
//             titleStyle: const TextStyle(
//                 color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           PieChartSectionData(
//             value: 20,
//             color: Colors.red,
//             radius: 50,
//             titleStyle: const TextStyle(
//                 color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }
