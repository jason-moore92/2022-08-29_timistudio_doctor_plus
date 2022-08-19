import 'package:equatable/equatable.dart';

abstract class ListMedicationState extends Equatable {
  const ListMedicationState();
}

class ListMedicationInitial extends ListMedicationState {
  @override
  List<Object> get props => [];
}

class ListMedicationLoading extends ListMedicationState {
  @override
  List<Object> get props => [];
}

class ListMedicationSuccess extends ListMedicationState {
  const ListMedicationSuccess(
      {required this.medications, this.textSelected = '#'});
  final List<Map<String, dynamic>> medications;
  final String textSelected;
  @override
  List<Object> get props => [medications];
}

class ListMedicationFailure extends ListMedicationState {
  const ListMedicationFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
