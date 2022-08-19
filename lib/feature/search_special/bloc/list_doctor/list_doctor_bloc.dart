import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/model/doctor_model.dart';

import 'bloc_list_doctor.dart';

class ListDoctorBloc extends Bloc<ListDoctorEvent, ListDoctorState> {
  ListDoctorBloc() : super(ListDoctorInitial()) {
    on<InitialDoctorEvent>((event, emit) async {
      try {
        emit(ListDoctorLoading());
        doctors.clear();
        doctors =
            List.generate(doctorsDemo.length, (index) => doctorsDemo[index]);
        emit(ListDoctorSuccess(doctors: doctors));
      } catch (e) {
        emit(ListDoctorFailure(error: e.toString()));
      }
    });
    on<SearchDoctorEvent>((event, emit) async {
      try {
        emit(ListDoctorLoading());
        doctorSearch.clear();
        doctors.clear();
        doctors =
            List.generate(doctorsDemo.length, (index) => doctorsDemo[index]);
        if (event.searchValue.isNotEmpty) {
          for (int i = 0; i < doctors.length; i++) {
            if (doctors[i].name.contains(event.searchValue)) {
              doctorSearch.add(doctors[i]);
            }
          }
        } else {
          doctorSearch = doctors;
        }
        emit(ListDoctorSuccess(doctors: doctorSearch));
      } catch (e) {
        emit(ListDoctorFailure(error: e.toString()));
      }
    });
  }

  List<DoctorModel> doctors = [];
  List<DoctorModel> doctorSearch = [];
}
