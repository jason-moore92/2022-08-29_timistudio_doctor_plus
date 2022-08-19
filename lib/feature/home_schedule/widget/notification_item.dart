import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/constant/enum.dart';
import 'package:flutter_doctor_plus/common/model/notification_item_model.dart';
import 'package:flutter_doctor_plus/common/util/get_consult_type.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.item}) : super(key: key);

  final NotificationItemModel item;

  RichText getText(NotificationItemModel item) {
    if ((item.type == ConsultType.appointment ||
            item.type == ConsultType.voice) &&
        item.status == StatusType.accepted) {
      return RichText(
        text: TextSpan(
          text: item.type == ConsultType.voice
              ? LocaleKeys.voiceRequest.tr()
              : LocaleKeys.appointment.tr(),
          style: h4(
            color: black,
          ),
          children: <TextSpan>[
            TextSpan(
              text: " ${item.patient?.name} ",
              style: h4(color: black, fontWeight: '700'),
            ),
            TextSpan(
              text: LocaleKeys.at.tr(),
              style: h4(color: black),
            ),
            TextSpan(
              text: " ${item.time} ",
              style: h4(color: black, fontWeight: '700'),
            ),
            TextSpan(
              text: LocaleKeys.today.tr(),
              style: h4(color: black),
            )
          ],
        ),
      );
    } else if (item.type == ConsultType.voice &&
        (item.status == StatusType.iCancelled ||
            item.status == StatusType.patientCancelled)) {
      return RichText(
        text: TextSpan(
          text: "${item.patient?.name} ",
          style: h4(color: black, fontWeight: '700'),
          children: <TextSpan>[
            TextSpan(
              text: LocaleKeys.cancelVoice.tr(),
              style: h4(
                color: black,
              ),
            ),
          ],
        ),
      );
    } else if (item.type == ConsultType.message &&
        item.status == StatusType.accepted) {
      return RichText(
        text: TextSpan(
          text: LocaleKeys.privateMessage.tr() + " ",
          style: h4(
            color: black,
          ),
          children: <TextSpan>[
            TextSpan(
              text: LocaleKeys.from.tr(),
              style: h4(color: black),
            ),
            TextSpan(
              text: " ${item.patient?.name} ",
              style: h4(color: black, fontWeight: '700'),
            ),
            TextSpan(
              text: LocaleKeys.checkNow.tr() + " >",
              style: h4(color: dodgerBlue),
            ),
          ],
        ),
      );
    } else {
      return RichText(
        text: TextSpan(
          text: (item.type == 'account'
                  ? LocaleKeys.completedProfile.tr()
                  : LocaleKeys.addBank.tr()) +
              " ",
          style: h4(
            color: black,
          ),
          children: <TextSpan>[
            TextSpan(
              text: (item.type == 'account'
                      ? LocaleKeys.completeProfile.tr()
                      : LocaleKeys.addNow.tr()) +
                  " >",
              style: h4(color: dodgerBlue),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimationClick(
      function: () {},
      child: Opacity(
        opacity: item.isUnread ? 1 : 0.6,
        child: Container(
          decoration: const BoxDecoration(),
          margin: const EdgeInsets.only(bottom: 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        color: item.isUnread ? neonFuchsia : null,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  getConsultIcon(item.type)
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getText(item),
                      Text(item.notificationTime ?? "",
                          style: h6(color: grayBlue)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
