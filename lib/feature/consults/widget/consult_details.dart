import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/enum.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/consult_details_model.dart';
import 'package:flutter_doctor_plus/common/model/doctor_answer_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/attach_file_item.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/consult_answer.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/section_box.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class ConsultDetails extends StatelessWidget {
  const ConsultDetails({Key? key, required this.consultDetails, this.status})
      : super(key: key);

  final ConsultDetailsModel consultDetails;
  final StatusType? status;

  @override
  Widget build(BuildContext context) {
    final bool withAttachment = consultDetails.attachment != null;
    return SectionBox(
        title: LocaleKeys.consultDetail.tr(),
        icon: icHelp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              consultDetails.title,
              style: h4(context: context, fontWeight: '700'),
            ),
            const SizedBox(height: 12),
            Text(
              consultDetails.details,
              style: h4(context: context),
            ),
            SizedBox(height: withAttachment ? 24 : 0),
            withAttachment
                ? AttachFileItem(attachFile: consultDetails.attachment!)
                : const SizedBox(),
            ConsultAnswer(
              answer: DoctorAnswerModel(
                time: DateTime.now(),
                note:
                    "There is a lower but existing risk of vaccine related zoster from that weakened strain because it behaves like other strain of the virus. The newer Shingrex vaccine would be a reasonable investment at some point. Discuss with your doc.",
                medications: [medicationsDemo[0]],
                attachments: const [sampleAttachment],
                doctors: [doctorsDemo[0]],
              ),
            ),
            consultDetails.answers != null
                ? ConsultAnswer(answer: consultDetails.answers![0])
                : const SizedBox(),
            status == StatusType.completed
                ? Column(
                    children: [
                      const SizedBox(height: 24),
                      ElevatedCpn(
                        function: () {
                          Navigator.of(context).pushNamed(Routes.writeAnAnswer);
                        },
                        gradient: linear,
                        textButton: LocaleKeys.writeAnswer.tr(),
                        textStyle: h5(color: grey100, fontWeight: '700'),
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ));
  }
}
