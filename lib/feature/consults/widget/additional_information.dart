import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/section_box.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({Key? key}) : super(key: key);

  Widget information(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: h5(context: context, fontWeight: '700')),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            text: LocaleKeys.none.tr() + " ",
            style: h5(context: context),
            children: <TextSpan>[
              TextSpan(
                text: '(${DateFormat('MMM d, yyyy').format(DateTime.now())})',
                style: h7(color: grayBlue),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SectionBox(
        title: LocaleKeys.additionalInformation.tr(),
        icon: icAdditionalInformation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            information(context, LocaleKeys.diagnosedCondition.tr()),
            const SizedBox(height: 24),
            information(context, LocaleKeys.medication.tr()),
            const SizedBox(height: 24),
            information(context, LocaleKeys.allergies.tr()),
          ],
        ));
  }
}
