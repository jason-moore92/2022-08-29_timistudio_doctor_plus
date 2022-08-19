import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/section_box.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';
import 'package:flutter_doctor_plus/common/util/string.dart';

class ConsultTime extends StatelessWidget {
  const ConsultTime({Key? key, required this.time}) : super(key: key);

  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return SectionBox(
      icon: icCalendar,
      title: LocaleKeys.visitTime.tr(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.today.tr().toCapitalized() +
                ', ' +
                DateFormat('MMM d, yyyy').format(time),
            style: h4(context: context),
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              text: DateFormat('hh : mm aa').format(time),
              style: h4(context: context, fontWeight: '700'),
              children: <TextSpan>[
                TextSpan(
                  text: '  ' + LocaleKeys.alarmBefore.tr(),
                  style: h6(color: grayBlue),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
