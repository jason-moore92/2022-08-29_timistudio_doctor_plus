import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/free_consult_question_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/free_consults/screens/free_consult_question.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

import 'free_consult_feature_answer.dart';

class FreeConsultItem extends StatelessWidget {
  const FreeConsultItem({Key? key, required this.question}) : super(key: key);

  final FreeConsultQuestionModel question;

  @override
  Widget build(BuildContext context) {
    bool noAnswer = question.answers.isEmpty;
    int yourAnswer = question.answers
        .indexWhere((element) => element.doctor.id == currentUser.id);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.freeConsultQuestion,
          arguments: FreeConsultQuestion(question: question),
        );
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: grey100,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                blurRadius: 16,
                offset: Offset(0, 2),
                color: Color.fromRGBO(0, 64, 128, 0.04),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  border: noAnswer
                      ? null
                      : const Border(
                          bottom: BorderSide(color: isabelline),
                        ),
                ),
                child: Column(
                  children: [
                    Text(
                      question.title,
                      style: h4(
                        context: context,
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
                                  style:
                                      h7(context: context, fontWeight: '700'),
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
              noAnswer
                  ? const SizedBox()
                  : Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      child: FreeConsultFeatureAnswer(
                        answer:
                            question.answers[yourAnswer != -1 ? yourAnswer : 0],
                      )),
            ],
          )),
    );
  }
}
