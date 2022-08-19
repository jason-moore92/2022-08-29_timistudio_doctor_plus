import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/model/free_consult_answer_model.dart';

import 'free_consult_answer.dart';

class AnswerList extends StatelessWidget {
  const AnswerList({Key? key, required this.answers}) : super(key: key);
  final List<FreeConsultAnswerModel> answers;
  @override
  Widget build(BuildContext context) {
    int itemCount = answers.length;
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return FreeConsultAnswer(
          answer: answers[index],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemCount: itemCount,
    );
  }
}
