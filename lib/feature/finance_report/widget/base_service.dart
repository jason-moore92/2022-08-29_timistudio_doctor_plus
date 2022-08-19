import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'drop_down_custom.dart';

class BaseService extends StatelessWidget {
  BaseService({Key? key}) : super(key: key);

  Widget iconButton(String path, BuildContext context,
      {Color bgColor = tiffanyBlue, String? text, Function()? function}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: ImageAsset(path, width: 16, height: 16),
        ),
        Text(
          text ?? LocaleKeys.doctorProfile.tr(),
          style: h8(context: context),
        )
      ],
    );
  }

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

  final List<ChartData> chartData = [
    ChartData('Message', 10.4, tiffanyBlue),
    ChartData('Voice Call', 18.2, neonFuchsia),
    ChartData('Live Chat', 16, malachite),
    ChartData('Video Call', 54.7, dodgerBlue),
  ];

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
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: DropdownCustom(
                title: LocaleKeys.time.tr(),
                items: <String>['This month']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList()),
          ),
          AppWidget.divider2(),
          SizedBox(
            height: 260,
            child: SfCircularChart(series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                  dataSource: chartData,
                  dataLabelSettings: DataLabelSettings(
                      builder: (data, point, series, pointIndex, seriesIndex) {
                        return Text('${point.y}%',
                            style: h8(context: context, fontFamily: 'Oswald'));
                      },
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.outside),
                  pointColorMapper: (ChartData data, _) => data.color,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  explode: true,
                  explodeAll: true)
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconButton(icTypeVideo, context, text: LocaleKeys.video.tr()),
                iconButton(icTypeCall, context, text: LocaleKeys.voice.tr()),
                iconButton(icTypeLiveChat, context,
                    text: LocaleKeys.liveChat.tr()),
                iconButton(icTypeMessage, context,
                    text: LocaleKeys.message.tr()),
              ],
            ),
          ),
          AppWidget.divider2(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                component(context, LocaleKeys.video.tr(), '\$ 1362'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: component(context, LocaleKeys.voice.tr(), '\$ 453'),
                ),
                component(context, LocaleKeys.liveChat.tr(), '\$ 416'),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child:
                      component(context, LocaleKeys.sendMessage.tr(), '\$ 259'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
