import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/util/get_events.dart';
import 'package:flutter_doctor_plus/common/widget/consult_item.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class PastConsults extends StatelessWidget {
  const PastConsults({Key? key}) : super(key: key);

  Widget sectionItem(BuildContext context, DateTime time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 24, bottom: 24),
          child: Text(
            "${DateFormat('MMM d, yyyy').format(time)} [${getEvents(time).length}]",
            style: h7(color: grayBlue, fontWeight: '600'),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: getEvents(time).length,
          itemBuilder: (context, index) {
            return ConsultItem(item: getEvents(time)[index]);
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
          getPastEvents().isEmpty
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
              itemCount: getPastEventsDay().length,
              itemBuilder: (context, index) {
                return sectionItem(context, getPastEventsDay()[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
