import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/feature/free_consults/widgets/related_questions.dart';
import 'package:flutter_doctor_plus/feature/free_consults/widgets/related_topics.dart';

import 'feature_search.dart';
import 'list_experts.dart';
import 'list_patients.dart';

class ResultAll extends StatelessWidget {
  const ResultAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: const [
          FeatureSearch(),
          SizedBox(height: 16),
          RelatedQuestions(),
          SizedBox(height: 16),
          ListPatients(),
          SizedBox(height: 16),
          RelatedTopics(),
          SizedBox(height: 16),
          ListExpert(),
        ],
      ),
    );
  }
}
