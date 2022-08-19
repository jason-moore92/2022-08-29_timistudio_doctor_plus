import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';

class MedicationWidget extends StatelessWidget {
  const MedicationWidget({Key? key, required this.message}) : super(key: key);
  final Map<String, dynamic> message;

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return AnimationClick(
      child: Container(
        width: width / 4 * 2.5,
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
              message['message']!,
              style: h3(color: dodgerBlue, fontWeight: '600'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 12),
              child: Text(
                'Acyclovir is an antiviral drug. It slows the growth and spread of the herpes virus…',
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
    );
  }
}
