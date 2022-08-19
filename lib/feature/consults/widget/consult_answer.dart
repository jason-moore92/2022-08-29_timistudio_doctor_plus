import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/doctor_answer_model.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';
import 'medication_item.dart';

class ConsultAnswer extends StatelessWidget {
  const ConsultAnswer({Key? key, required this.answer}) : super(key: key);

  final DoctorAnswerModel answer;

  Widget sectionTitle(String title) {
    return Column(
      children: [
        const SizedBox(height: 32),
        Text(
          title,
          style: h5(color: black, fontWeight: '700'),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget card({required Widget child}) {
    return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.only(top: 24),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: isabelline),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.myAnswer.tr(),
                style: h3(context: context, fontWeight: '700')),
            const SizedBox(height: 8),
            Text(
              '${LocaleKeys.answered.tr()} ' +
                  DateFormat("h:mma dd MMM yyyy").format(
                    answer.time ?? DateTime.now(),
                  ),
              style: h7(color: grayBlue),
            ),
            const SizedBox(height: 8),
            Text(
              answer.note,
              style: h4(context: context),
            ),
            const SizedBox(height: 8),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageAsset(
                      answer.attachments?[index].image ?? imgChickenpox,
                      width: MediaQuery.of(context).size.width - 100,
                      height: 160,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      answer.attachments?[index].description ?? ' ',
                      style: h4(context: context),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 12);
              },
              itemCount: answer.attachments?.length ?? 0,
            ),
            answer.medications != null
                ? sectionTitle(LocaleKeys.prescription.tr())
                : const SizedBox(),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return card(
                  child: MedicationItem(
                    medication:
                        answer.medications?[index] ?? medicationsDemo[0],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 12);
              },
              itemCount: answer.attachments?.length ?? 0,
            ),
          ],
        ));
  }
}
