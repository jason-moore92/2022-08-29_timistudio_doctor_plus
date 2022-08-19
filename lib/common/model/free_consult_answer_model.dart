import 'package:equatable/equatable.dart';

import 'attachment_model.dart';
import 'doctor_model.dart';

class FreeConsultAnswerModel extends Equatable {
  const FreeConsultAnswerModel({
    required this.doctor,
    this.thanks = 0,
    this.doctorsAgreed,
    this.attachment,
    required this.answer,
  });
  final DoctorModel doctor;
  final int thanks;
  final List<DoctorModel>? doctorsAgreed;
  final AttachmentModel? attachment;
  final String answer;

  @override
  List<Object?> get props => [
        doctor,
        thanks,
        doctorsAgreed,
        attachment,
        answer,
      ];
}
