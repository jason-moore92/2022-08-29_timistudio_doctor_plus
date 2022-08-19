import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/util/format_time.dart';
import 'package:flutter_doctor_plus/common/util/get_events.dart';
import 'package:flutter_doctor_plus/common/widget/consult_item.dart';
import 'package:intl/intl.dart';

class ConsultDayItem extends StatelessWidget {
  const ConsultDayItem(
      {Key? key,
      required this.time,
      this.hasTimeRow = true,
      this.showTime = true})
      : super(key: key);

  final DateTime time;
  final bool hasTimeRow;
  final bool showTime;

  @override
  Widget build(BuildContext context) {
    if (getEvents(time).isEmpty) {
      return const SizedBox();
    } else {
      return Container(
        margin: EdgeInsets.only(left: hasTimeRow ? 24 : 0),
        child: hasTimeRow
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                          DateFormat('EEEE')
                              .format(time)
                              .substring(0, 3)
                              .toUpperCase(),
                          style: h7(context: context, fontWeight: '700')),
                      Text(DateFormat('d').format(time),
                          style: h2(context: context, fontWeight: '700')),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getEvents(time).length,
                      itemBuilder: (context, index) {
                        return ConsultItem(item: getEvents(time)[index]);
                      },
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  showTime
                      ? Padding(
                          padding: const EdgeInsets.only(left: 24, bottom: 24),
                          child: Text(
                            FormatTime.formatTime(
                                format: Format.mdy, dateTime: time),
                            style: h7(color: grayBlue, fontWeight: '600'),
                          ),
                        )
                      : const SizedBox(),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: getEvents(time).length,
                    itemBuilder: (context, index) {
                      return ConsultItem(item: getEvents(time)[index]);
                    },
                  )
                ],
              ),
      );
    }
  }
}
