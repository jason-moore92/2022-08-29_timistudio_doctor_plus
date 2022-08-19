import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/model/medication_model.dart';

import 'bloc_list_medication.dart';

class ListMedicationBloc
    extends Bloc<ListMedicationEvent, ListMedicationState> {
  ListMedicationBloc() : super(ListMedicationInitial()) {
    on<InitialMedicationEvent>((event, emit) async {
      try {
        emit(ListMedicationLoading());
        medications.clear();
        medications = List.generate(
            medicationsDemo.length,
            (index) =>
                {'medication': medicationsDemo[index], 'selected': false});
        emit(ListMedicationSuccess(medications: medications));
      } catch (e) {
        emit(ListMedicationFailure(error: e.toString()));
      }
    });
    on<SortMedicationEvent>((event, emit) async {
      try {
        emit(ListMedicationLoading());
        medications = List.from(medications.reversed);
        emit(ListMedicationSuccess(medications: medications));
      } catch (e) {
        emit(ListMedicationFailure(error: e.toString()));
      }
    });
    on<SelectedMedicationEvent>((event, emit) async {
      try {
        emit(ListMedicationLoading());
        if (!medicationsSelected.contains(event.medicationSelected)) {
          medicationsSelected.add(event.medicationSelected);
        }
        for (var item in medications) {
          if (item['medication'] == event.medicationSelected) {
            item['selected'] = !item['selected'];
          }
        }
        emit(ListMedicationSuccess(medications: medications));
      } catch (e) {
        emit(ListMedicationFailure(error: e.toString()));
      }
    });
    on<SearchMedicationEvent>((event, emit) async {
      try {
        emit(ListMedicationLoading());
        medicationSearch.clear();
        medications.clear();
        medications = List.generate(
            medicationsDemo.length,
            (index) =>
                {'medication': medicationsDemo[index], 'selected': false});
        if (event.searchValue.isNotEmpty) {
          for (int i = 0; i < medications.length; i++) {
            if (medications[i]['medication']
                .nameMedication
                .contains(event.searchValue)) {
              medicationSearch.add(medications[i]);
            }
          }
        } else {
          medicationSearch = medications;
        }
        emit(ListMedicationSuccess(medications: medicationSearch));
      } catch (e) {
        emit(ListMedicationFailure(error: e.toString()));
      }
    });
    on<QuickAccessMedicationEvent>((event, emit) async {
      try {
        emit(ListMedicationLoading());
        medications.clear();
        medicationSearch.clear();
        medications = List.generate(
            medicationsDemo.length,
            (index) =>
                {'medication': medicationsDemo[index], 'selected': false});
        if (event.label == '#' || event.label.isEmpty) {
          medicationSearch = medications;
        } else {
          textSelected = event.label;
          for (int i = 0; i < medications.length; i++) {
            if (medications[i]['medication']
                .nameMedication
                .substring(0, 2)
                .contains(event.label)) {
              medicationSearch.add(medications[i]);
            }
          }
        }
        emit(ListMedicationSuccess(
            medications: medicationSearch, textSelected: textSelected));
      } catch (e) {
        emit(ListMedicationFailure(error: e.toString()));
      }
    });
  }

  String textSelected = '#';
  List<Map<String, dynamic>> medications = [];
  List<Map<String, dynamic>> medicationSearch = [];
  List<MedicationModel> medicationsSelected = [];
}
