import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/model/education_model.dart';

import 'bloc_list_education.dart';

class ListEducationBloc extends Bloc<ListEducationEvent, ListEducationsState> {
  ListEducationBloc() : super(ListEducationsInitial()) {
    on<InitialEducationEvent>((event, emit) async {
      try {
        emit(ListEducationsLoading());
        education.clear();
        education.add(const EducationModel());
        emit(ListEducationsSuccess(education: education));
      } catch (e) {
        emit(ListEducationsFailure(error: e.toString()));
      }
    });
    on<AddEducationEvent>((event, emit) async {
      try {
        emit(ListEducationsLoading());
        education.add(const EducationModel());
        emit(ListEducationsSuccess(education: education));
      } catch (e) {
        emit(ListEducationsFailure(error: e.toString()));
      }
    });
  }

  List<EducationModel> education = [];
}
