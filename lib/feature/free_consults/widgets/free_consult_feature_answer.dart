import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/free_consult_answer_model.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class FreeConsultFeatureAnswer extends StatelessWidget {
  const FreeConsultFeatureAnswer({Key? key, required this.answer})
      : super(key: key);

  final FreeConsultAnswerModel answer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ImageAsset(
                  answer.doctor.avt,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 16),
                Text(
                  answer.doctor.name + " ",
                  style: h7(
                    color: dodgerBlue,
                    fontWeight: '700',
                  ),
                ),
                Text(
                  LocaleKeys.answered.tr().toLowerCase(),
                  style: h7(context: context),
                ),
              ],
            ),
            IconButtonCpn(
              path: icOption,
              iconColor: grayBlue,
              hasOutline: false,
              function: () {},
            ),
          ],
        ),
        const SizedBox(height: 12),
        answer.attachment != null
            ? ImageAsset(
                answer.attachment!.image,
                width: double.infinity,
                height: 200,
              )
            : const SizedBox(),
        const SizedBox(height: 12),
        Text(
          answer.answer,
          style: h6(context: context),
          maxLines: 2,
        )
      ],
    );
  }
}
