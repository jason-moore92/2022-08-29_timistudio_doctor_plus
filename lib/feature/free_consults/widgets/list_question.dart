import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/model/free_consult_question_model.dart';

import 'free_consult_item.dart';

class ListQuestion extends StatelessWidget {
  const ListQuestion({Key? key, required this.questions}) : super(key: key);
  final List<FreeConsultQuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FreeConsultItem(question: questions[index]);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 16,
        );
      },
      itemCount: questions.length,
    );
  }
}
