import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class TopicDetailConditions extends StatelessWidget {
  const TopicDetailConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> conditions = [
      'Muscle Pain',
      'Heart diseases',
      'Asthma',
      'Low back pain, better with bending forward'
    ];
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBarCpn(
        color: grey100,
        center: Text(
          LocaleKeys.conditionsSymptoms.tr(),
          style: h3(context: context, fontWeight: '700'),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: grey100, borderRadius: BorderRadius.circular(16)),
        child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 24),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                conditions[index],
                style: h4(color: dodgerBlue, fontWeight: '600'),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return AppWidget.divider2();
          },
          itemCount: conditions.length,
        ),
      ),
    );
  }
}
