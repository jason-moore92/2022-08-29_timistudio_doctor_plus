import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/constant/enum.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/model/additional_information_model.dart';
import 'package:flutter_doctor_plus/common/model/consult_details_model.dart';
import 'package:flutter_doctor_plus/common/model/patient_model.dart';
import 'package:flutter_doctor_plus/common/model/patient_review_model.dart';

class EventModel extends Equatable {
  const EventModel(
      {required this.title,
      this.consultDetail = consultDetails,
      this.additionalInformation,
      required this.patient,
      required this.time,
      required this.status,
      required this.type,
      this.review});
  final String title;
  final ConsultType type;
  final StatusType status;
  final PatientModel patient;
  final DateTime time;
  final ConsultDetailsModel consultDetail;
  final AdditionalInformationModel? additionalInformation;
  final PatientReviewModel? review;

  @override
  List<Object?> get props => [
        title,
        type,
        status,
        patient,
        time,
        additionalInformation,
        consultDetail,
        review
      ];
}
