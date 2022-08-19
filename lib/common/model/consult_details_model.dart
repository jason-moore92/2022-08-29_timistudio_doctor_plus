import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/attachment_model.dart';

import 'doctor_answer_model.dart';

class ConsultDetailsModel extends Equatable {
  const ConsultDetailsModel({
    required this.title,
    required this.details,
    this.attachment,
    this.answers,
  });
  final String title;
  final String details;
  final AttachmentModel? attachment;
  final List<DoctorAnswerModel>? answers;

  @override
  List<Object?> get props => [
        title,
        details,
        attachment,
        answers,
      ];
}
