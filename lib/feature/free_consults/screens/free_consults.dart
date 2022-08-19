import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/free_consult_question_model.dart';
import 'package:flutter_doctor_plus/feature/free_consults/widgets/free_consult_app_bar.dart';
import 'package:flutter_doctor_plus/feature/free_consults/widgets/list_question.dart';

class FreeConsults extends StatefulWidget {
  const FreeConsults({Key? key}) : super(key: key);

  @override
  State<FreeConsults> createState() => _FreeConsultsState();
}

class _FreeConsultsState extends State<FreeConsults>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  List<FreeConsultQuestionModel> newsQuestions = freeConsultQuestions;
  List<FreeConsultQuestionModel> answeredQuestions = freeConsultQuestions
      .where((element) =>
          element.answers.indexWhere((e) => e.doctor.id == currentUser.id) !=
          -1)
      .toList();
  List<FreeConsultQuestionModel> followingQuestions = freeConsultQuestions
      .where((element) =>
          element.doctorsFollowed.indexWhere((e) => e.id == currentUser.id) !=
          -1)
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      body: NestedScrollView(
        headerSliverBuilder: (context, value) => [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: FreeConsultAppBar(
              controller: controller,
              news: newsQuestions.length,
              answered: answeredQuestions.length,
              following: followingQuestions.length,
            ),
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.only(top: 160),
          child: TabBarView(
            controller: controller,
            children: [
              ListQuestion(questions: newsQuestions),
              ListQuestion(questions: answeredQuestions),
              ListQuestion(questions: followingQuestions),
            ],
          ),
        ),
      ),
    );
  }
}
