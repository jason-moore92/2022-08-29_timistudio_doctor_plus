import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/medication_model.dart';

abstract class ListMedicationEvent extends Equatable {
  const ListMedicationEvent();
}

class InitialMedicationEvent extends ListMedicationEvent {
  @override
  List<Object> get props => [];
}

class SelectedMedicationEvent extends ListMedicationEvent {
  const SelectedMedicationEvent({required this.medicationSelected});
  final MedicationModel medicationSelected;
  @override
  List<Object> get props => [medicationSelected];
}

class SortMedicationEvent extends ListMedicationEvent {
  @override
  List<Object> get props => [];
}

class SearchMedicationEvent extends ListMedicationEvent {
  const SearchMedicationEvent({required this.searchValue});
  final String searchValue;
  @override
  List<Object> get props => [searchValue];
}

class QuickAccessMedicationEvent extends ListMedicationEvent {
  const QuickAccessMedicationEvent({required this.label});
  final String label;
  @override
  List<Object> get props => [label];
}
