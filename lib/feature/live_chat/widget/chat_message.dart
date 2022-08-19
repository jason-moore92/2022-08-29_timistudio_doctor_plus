import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/live_chat/widget/mess_widget.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

import 'medication_widget.dart';
import 'share_doctor_widget.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({Key? key, required this.message, this.sameSender = false})
      : super(key: key);
  final Map<String, dynamic> message;
  final bool sameSender;

  Widget typeMessage(BuildContext context, double width) {
    switch (message['type']) {
      case 'healthGuide':
        return healthWidget(context, width);
      case 'shareDoctor':
        return ShareDoctorWidget(
          message: message,
          doctorModel: doctorsDemo[0],
        );
      case 'medication':
        return MedicationWidget(message: message);
      default:
        return messageWidget(context, width);
    }
  }

  Widget healthWidget(BuildContext context, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MessWidget(message: message),
        AnimationClick(
          child: Container(
            width: width / 4 * 3,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                color: grey100,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.getVaccinated.tr(),
                  style: h3(color: dodgerBlue, fontWeight: '600'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 12),
                  child: Text(
                    '543 ' + LocaleKeys.enrolled.tr(),
                    style: h6(context: context),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  height: 1,
                  color: backgroundColor2,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: const ImageAsset(
                            avt1,
                            width: 40,
                            height: 40,
                          )),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Dr. Sarah Conner ',
                        style: h7(color: dodgerBlue, fontWeight: '700'),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'shared',
                            style: h7(context: context),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget messageWidget(BuildContext context, double width) {
    return Row(
      mainAxisAlignment: message['sender'] == 'me'
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        message['sender'] == 'me'
            ? const SizedBox()
            : (sameSender
                ? const SizedBox(width: 24)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: const ImageAsset(avt2))),
        Container(
          width: width / 4 * 2.5,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          margin: EdgeInsets.only(left: message['sender'] == 'me' ? 0 : 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: message['sender'] == 'me' ? isabelline : blueCrayola),
          child: Text(
            message['message']!,
            style: h4(
                color: message['sender'] == 'me'
                    ? Theme.of(context).color11
                    : grey100),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return typeMessage(context, width);
  }
}
