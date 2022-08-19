import 'package:equatable/equatable.dart';

class TipModel extends Equatable {
  const TipModel(
      {required this.titleTip,
      required this.nameDoctor,
      this.description,
      required this.avtDoctor,
      required this.image,
      this.shares = 0,
      this.thanks = 0,
      this.enrolled,
      this.interestingFact,
      this.forPatientWho,
      this.patientDo});
  final String titleTip;
  final String avtDoctor;
  final String nameDoctor;
  final String image;
  final int thanks;
  final int shares;
  final String? description;
  final String? interestingFact;
  final int? enrolled;
  final List<String>? forPatientWho;
  final List<PatientDoModel>? patientDo;

  @override
  List<Object?> get props => [
        titleTip,
        nameDoctor,
        image,
        avtDoctor,
        thanks,
        shares,
        description,
        interestingFact,
        enrolled,
        forPatientWho,
        patientDo
      ];
}

class PatientDoModel extends Equatable {
  const PatientDoModel({required this.action, required this.time});
  final String action;
  final String time;

  @override
  List<Object?> get props => [action, time];
}
