import 'package:equatable/equatable.dart';

class MedicationModel extends Equatable {
  const MedicationModel(
      {required this.nameMedication, required this.description});
  final String nameMedication;
  final String description;

  @override
  List<Object?> get props => [nameMedication, description];
}
