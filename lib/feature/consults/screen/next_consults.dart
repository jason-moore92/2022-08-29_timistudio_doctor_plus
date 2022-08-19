import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/util/get_events.dart';
import 'package:flutter_doctor_plus/common/widget/consult_item.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

final List<Map<String, dynamic>> sectionItems = [
  {
    'title': LocaleKeys.inProgress.tr(),
    'items': getInProgressEvents(DateTime.now())
  },
  {
    'title': LocaleKeys.nextConsult.tr(),
    'items': getNotInProgressEvents(DateTime.now())
  }
];

class NextConsults extends StatelessWidget {
  const NextConsults({Key? key}) : super(key: key);

  Widget sectionItem(BuildContext context, Map<String, dynamic> section) {
    if (section['items'].length == 0) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 24, bottom: 24),
          child: Text(
            section['title'] + ' [${section['items'].length}]',
            style: h3(context: context, fontWeight: '700'),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: section['items'].length,
          itemBuilder: (context, index) {
            return ConsultItem(item: section['items'][index]);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          const SizedBox(height: 24),
          getEvents(DateTime.now()).isEmpty
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ImageAsset(imgNoUpcoming, width: 160, height: 160),
                      const SizedBox(height: 60),
                      Text(LocaleKeys.noUpcoming.tr(),
                          style: h4(context: context)),
                    ],
                  ),
                )
              : const SizedBox(),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return sectionItem(context, sectionItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
