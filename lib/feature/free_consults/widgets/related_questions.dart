import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/free_consult_question_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/section_box.dart';
import 'package:flutter_doctor_plus/feature/free_consults/screens/free_consult_question.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class RelatedQuestions extends StatelessWidget {
  const RelatedQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionBox(
      title: LocaleKeys.relatedQuestions.tr(),
      icon: icHelp,
      paddingHorizontal: 0,
      paddingChild: const EdgeInsets.all(0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: freeConsultQuestions.length,
        itemBuilder: (context, index) {
          FreeConsultQuestionModel question = freeConsultQuestions[index];
          bool noAnswer = question.answers.isEmpty;
          return AnimationClick(
            function: () {
              Navigator.of(context).pushNamed(
                Routes.freeConsultQuestion,
                arguments: FreeConsultQuestion(question: question),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: isabelline),
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    question.title,
                    style: h4(
                      color: dodgerBlue,
                      fontWeight: '600',
                    ),
                  ),
                  const SizedBox(height: 12),
                  !noAnswer
                      ? Row(
                          children: [
                            const ImageAsset(
                              icDoctorAnswer,
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(width: 4),
                            RichText(
                              text: TextSpan(
                                text: "${question.answers.length} ",
                                style: h7(context: context, fontWeight: '700'),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: LocaleKeys.doctorsAnswered.tr(),
                                    style: h7(context: context),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
