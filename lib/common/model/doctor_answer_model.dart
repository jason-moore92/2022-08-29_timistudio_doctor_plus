import 'package:equatable/equatable.dart';

import 'attachment_model.dart';
import 'doctor_model.dart';
import 'medication_model.dart';

class DoctorAnswerModel extends Equatable {
  const DoctorAnswerModel({
    required this.note,
    this.doctors,
    this.attachments,
    this.medications,
    this.time,
  });
  final DateTime? time;
  final String note;
  final List<DoctorModel>? doctors;
  final List<AttachmentModel>? attachments;
  final List<MedicationModel>? medications;

  @override
  List<Object?> get props => [
        note,
        doctors,
        attachments,
        medications,
      ];
}
