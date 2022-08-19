import 'package:equatable/equatable.dart';

import 'doctor_model.dart';
import 'free_consult_answer_model.dart';

class FreeConsultQuestionModel extends Equatable {
  const FreeConsultQuestionModel({
    required this.title,
    this.answers = const [],
    this.doctorsFollowed = const [],
  });
  final String title;
  final List<FreeConsultAnswerModel> answers;
  final List<DoctorModel> doctorsFollowed;

  @override
  List<Object?> get props => [
        title,
        answers,
        doctorsFollowed,
      ];
}
