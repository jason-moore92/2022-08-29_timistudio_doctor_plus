import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/question_model.dart';

class TopicModel extends Equatable {
  const TopicModel(
      {required this.titleTopic,
      required this.nameDoctor,
      required this.description,
      required this.avtDoctor,
      required this.image,
      required this.subTitle,
      this.questions});
  final String titleTopic;
  final String avtDoctor;
  final String nameDoctor;
  final String image;
  final String description;
  final List<String> subTitle;
  final List<QuestionModel>? questions;
  @override
  List<Object?> get props => [
        titleTopic,
        nameDoctor,
        image,
        avtDoctor,
        description,
        subTitle,
        questions
      ];
}
