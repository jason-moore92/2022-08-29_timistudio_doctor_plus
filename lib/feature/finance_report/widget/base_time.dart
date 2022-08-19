import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'drop_down_custom.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class BaseTime extends StatelessWidget {
  const BaseTime({Key? key}) : super(key: key);

  Widget component(BuildContext context, String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: h5(context: context),
        ),
        Text(
          price,
          style: h3(context: context, fontFamily: 'Oswald'),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      lineTouchData: LineTouchData(
          getTouchedSpotIndicator: (barData, spotIndexes) {
            return [
              TouchedSpotIndicatorData(FlLine(strokeWidth: 0), FlDotData())
            ];
          },
          touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (touchedSpots) {
                return List.generate(
                    touchedSpots.length,
                    (index) => LineTooltipItem(
                        '\$ ${touchedSpots[index].y.toInt() * 100}',
                        h5(color: grey100, fontFamily: 'Oswald')));
              },
              tooltipBgColor: tiffanyBlue,
              tooltipRoundedRadius: 8)),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => h9(color: grayBlue),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '01';
              case 3:
                return '02';
              case 5:
                return '03';
              case 7:
                return '04';
              case 9:
                return '05';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 0.5,
          getTextStyles: (context, value) => h9(color: grayBlue),
          getTitles: (value) {
            if (value == 0) {
              return '0';
            }
            if (value == 1.5) {
              return '200';
            }
            if (value == 3) {
              return '400';
            }
            if (value == 4.5) {
              return '600';
            }
            if (value == 6) {
              return '800';
            }
            return '';
          },
          reservedSize: 22,
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 5),
            FlSpot(1, 5.5),
            FlSpot(3, 6),
            FlSpot(5, 5),
            FlSpot(7, 6.5),
            FlSpot(9, 2),
            FlSpot(10, 2.1),
          ],
          isCurved: true,
          colors: [
            tiffanyBlue,
          ],
          shadow: Shadow(
              color: tiffanyBlue.withOpacity(0.32),
              blurRadius: 10,
              offset: const Offset(0, 10)),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradientFrom: const Offset(0, 1),
            gradientTo: const Offset(0, 0),
            colors: [
              tiffanyBlue.withOpacity(0.24),
              tiffanyBlue.withOpacity(0),
            ].map((color) => color).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
      decoration: BoxDecoration(
        color: grey100,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 16,
            offset: Offset(0, 2),
            color: Color.fromRGBO(167, 115, 102, 0.16),
          ),
        ],
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownCustom(
                  title: LocaleKeys.time.tr(),
                  items: <String>['This month']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()),
              DropdownCustom(
                  title: LocaleKeys.viewBy.tr(),
                  items: <String>['Day']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()),
            ],
          ),
          AppWidget.divider2(),
          SizedBox(height: 260, child: LineChart(mainData())),
          AppWidget.divider2(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Income',
                        style: h5(fontWeight: '700', context: context),
                      ),
                    ),
                    Text(
                      'Jan 01 - Jan 05',
                      style: h7(context: context),
                    ),
                  ],
                ),
                Text(
                  '\$ 2,490',
                  style: h0(context: context, fontFamily: 'Oswald'),
                ),
              ],
            ),
          ),
          component(context, 'Today', '\$ 1362'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: component(context, 'Yesterday', '\$ 453'),
          ),
          component(context, '01/03', '\$ 416'),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: component(context, '01/02', '\$ 259'),
          ),
        ],
      ),
    );
  }
}
