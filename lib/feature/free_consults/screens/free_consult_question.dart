import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/free_consult_answer_model.dart';
import 'package:flutter_doctor_plus/common/model/free_consult_question_model.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/free_consults/widgets/answer_list.dart';
import 'package:flutter_doctor_plus/feature/free_consults/widgets/related_questions.dart';
import 'package:flutter_doctor_plus/feature/free_consults/widgets/related_topics.dart';
import 'package:flutter_doctor_plus/feature/free_consults/widgets/write_an_answer.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class FreeConsultQuestion extends StatelessWidget {
  const FreeConsultQuestion({Key? key, required this.question})
      : super(key: key);

  final FreeConsultQuestionModel question;

  void onFollow() {}

  void onShare() {}

  @override
  Widget build(BuildContext context) {
    final bool isFollowed = question.doctorsFollowed
            .indexWhere((doctor) => doctor.id == currentUser.id) !=
        -1;
    final List<FreeConsultAnswerModel> sortedAnswers = [...question.answers];

    sortedAnswers.sort(
      (a, b) => a.doctor.id == currentUser.id ? 0 : 1,
    );

    return Scaffold(
      appBar: AppBarCpn(
        color: grey100,
        right: Row(
          children: [
            IconButtonCpn(
              path: isFollowed ? icFollowed : icFollow,
              iconColor: isFollowed ? grey100 : dodgerBlue,
              borderColor: dodgerBlue,
              bgColor: isFollowed ? dodgerBlue : grey100,
              hasOutline: !isFollowed,
              function: onFollow,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: IconButtonCpn(
                path: share,
                borderColor: dodgerBlue,
                iconColor: dodgerBlue,
                function: onShare,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 24,
          bottom: MediaQuery.of(context).padding.bottom + 24,
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              height: 4,
              decoration: BoxDecoration(gradient: linear),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: grey100,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)),
                boxShadow: [
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
                  Text(
                    "A member asked :",
                    style: h7(
                      context: context,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    question.title,
                    style: h4(
                      context: context,
                      fontWeight: '600',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
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
                ],
              ),
            ),
            const SizedBox(height: 16),
            const WriteAnAnswer(),
            const SizedBox(height: 16),
            AnswerList(answers: sortedAnswers),
            const RelatedTopics(),
            const SizedBox(height: 16),
            const RelatedQuestions(),
          ],
        ),
      ),
    );
  }
}
