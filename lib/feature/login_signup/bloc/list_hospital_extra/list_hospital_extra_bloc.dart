import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/model/hospital_model.dart';

import 'bloc_list_hospital_extra.dart';

class ListHospitalExtraBloc
    extends Bloc<ListHospitalExtraEvent, ListHospitalExtrasState> {
  ListHospitalExtraBloc() : super(ListHospitalExtrasInitial()) {
    on<InitialHospitalEvent>((event, emit) async {
      try {
        emit(ListHospitalExtrasLoading());
        hospitals.clear();
        emit(ListHospitalExtrasSuccess(hospitals: hospitals));
      } catch (e) {
        emit(ListHospitalExtrasFailure(error: e.toString()));
      }
    });
    on<AddEvent>((event, emit) async {
      try {
        emit(ListHospitalExtrasLoading());
        hospitals.add(const HospitalModel());
        emit(ListHospitalExtrasSuccess(hospitals: hospitals));
      } catch (e) {
        emit(ListHospitalExtrasFailure(error: e.toString()));
      }
    });
  }

  List<HospitalModel> hospitals = [];
}
