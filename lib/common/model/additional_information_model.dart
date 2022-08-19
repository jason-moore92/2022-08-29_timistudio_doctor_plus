import 'package:equatable/equatable.dart';

class AdditionalInformationModel extends Equatable {
  const AdditionalInformationModel({
    this.conditions,
    this.medications,
    this.allergies,
  });
  final String? conditions;
  final String? medications;
  final String? allergies;

  @override
  List<Object?> get props => [conditions, medications, allergies];
}
