import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PicChart extends StatelessWidget {
  const PicChart({Key? key, required this.chartData}) : super(key: key);
  final Map<String, dynamic> chartData;
  @override
  Widget build(BuildContext context) {
    // double exp = 100;
    // double save = 0;
    // if (chartData['income'] != 0) {
    //   exp = chartData['expenditure'] / chartData['income'] * 100;
    //   save = 100 - exp;
    // }

    return Placeholder(
      color: Colors.transparent,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 5,
          borderData: FlBorderData(show: true),
          sectionsSpace: 2,
          sections: [
            PieChartSectionData(
              value: chartData['expenditure'].roundToDouble(),
              color: Theme.of(context).primaryColor,
              radius: 60,
              titleStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w100),
            ),
            PieChartSectionData(
              value: chartData['savings'].roundToDouble(),
              color: Theme.of(context).primaryColorDark,
              radius: 60,
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
