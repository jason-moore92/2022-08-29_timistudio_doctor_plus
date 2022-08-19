import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class ConsultStatus extends StatefulWidget {
  const ConsultStatus({Key? key}) : super(key: key);

  @override
  State<ConsultStatus> createState() => _ConsultStatusState();
}

class _ConsultStatusState extends State<ConsultStatus> {
  List<Map<String, dynamic>> consultType = [
    {'title': LocaleKeys.completed.tr(), 'selected': false},
    {'title': LocaleKeys.iDeclined.tr(), 'selected': false},
    {'title': LocaleKeys.iCancelled.tr(), 'selected': false},
    {'title': LocaleKeys.patientCancelled.tr(), 'selected': false}
  ];
  @override
  Widget build(BuildContext context) {
    bool selectedAll = consultType.every((e) => e['selected']);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Text(
            'Consult Status',
            style: h3(fontWeight: '700', context: context),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'All Status',
              style: h4(fontWeight: '600', context: context),
            ),
            Checkbox(
                value: selectedAll,
                activeColor: dodgerBlue,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: dodgerBlue),
                    borderRadius: BorderRadius.circular(24)),
                onChanged: (value) {
                  setState(() => {
                        for (Map<String, dynamic> element in consultType)
                          {element['selected'] = value}
                      });
                })
          ],
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    consultType[index]['title'],
                    style: h4(context: context),
                  ),
                  Checkbox(
                      value: consultType[index]['selected'],
                      activeColor: dodgerBlue,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: dodgerBlue),
                          borderRadius: BorderRadius.circular(4)),
                      onChanged: (value) {
                        setState(() {
                          consultType[index]['selected'] =
                              !consultType[index]['selected'];
                        });
                      })
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 24,
              );
            },
            itemCount: consultType.length),
      ],
    );
  }
}
