import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/model/certification_model.dart';

import 'bloc_list_certification.dart';

class ListCertificationBloc
    extends Bloc<ListCertificationEvent, ListCertificationState> {
  ListCertificationBloc() : super(ListCertificationInitial()) {
    on<InitialCertificationEvent>((event, emit) async {
      try {
        emit(ListCertificationLoading());
        certification.clear();
        certification.add(const CertificationModel());
        emit(ListCertificationSuccess(certification: certification));
      } catch (e) {
        emit(ListCertificationFailure(error: e.toString()));
      }
    });
    on<AddCertificationEvent>((event, emit) async {
      try {
        emit(ListCertificationLoading());
        certification.add(const CertificationModel());
        emit(ListCertificationSuccess(certification: certification));
      } catch (e) {
        emit(ListCertificationFailure(error: e.toString()));
      }
    });
  }

  List<CertificationModel> certification = [];
}
