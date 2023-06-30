import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';
import 'package:iconsax/iconsax.dart';

// class BarChart extends StatefulWidget {
//   const BarChart({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => BarChartSample1State();
// }

class BarChart1 extends StatelessWidget {
  const BarChart1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double barWidth = 14;
    int touchedIndex = -1;
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: .50,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Statistic',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Text(
                    'Monthly Statistical Data',
                  ),
                  UIHelper.verticalSpaceMedium(),
                  Expanded(
                    child: BarChart(
                      BarChartData(
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                              tooltipBgColor: Theme.of(context).highlightColor,
                              getTooltipItem:
                                  (group, groupIndex, rod, rodIndex) {
                                return BarTooltipItem(
                                  '16/02/2023\n',
                                  const TextStyle(
                                    // color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Index: \n',
                                    ),
                                    const TextSpan(
                                      text: '₹ 12,35,478\n',
                                    ),
                                    const TextSpan(
                                      text: '(324)',
                                    ),
                                  ],
                                );
                              }),
                          touchCallback:
                              (FlTouchEvent event, barTouchResponse) {
                            if (!event.isInterestedForInteractions ||
                                barTouchResponse == null ||
                                barTouchResponse.spot == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex =
                                barTouchResponse.spot!.touchedBarGroupIndex;
                          },
                        ),
                        titlesData: const FlTitlesData(
                          show: true,
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                            border: const Border(
                          top: BorderSide.none,
                          right: BorderSide.none,
                          left: BorderSide.none,
                          bottom: BorderSide.none,
                        )),
                        // groupsSpace: 10,
                        barGroups: List.generate(
                          6,
                          (index) {
                            return BarChartGroupData(
                              x: Random().nextInt(15).toInt(),
                              barRods: [
                                BarChartRodData(
                                  toY: Random().nextInt(100).toDouble() + 6,
                                  width: barWidth,
                                  color: Theme.of(context).primaryColor,
                                ),
                                BarChartRodData(
                                  toY: Random().nextInt(60).toDouble() + 6,
                                  width: barWidth,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                                BarChartRodData(
                                  toY: Random().nextInt(20).toDouble() + 2,
                                  width: barWidth,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(Iconsax.chart),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget bottomTitles(double value, TitleMeta meta) {
  final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];

  final Widget text = Text(
    titles[value.toInt()],
    style: const TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  );

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16, //margin top
    child: text,
  );
}

Widget leftTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  if (value == 0) {
    text = '1K';
  } else if (value == 10) {
    text = '5K';
  } else if (value == 19) {
    text = '10K';
  } else {
    return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    child: Text(text, style: style),
  );
}
