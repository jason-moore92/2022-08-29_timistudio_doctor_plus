import 'package:equatable/equatable.dart';

class PatientReviewModel extends Equatable {
  const PatientReviewModel({
    required this.rate,
    required this.note,
  });
  final int rate;
  final String note;

  @override
  List<Object?> get props => [rate, note];
}
