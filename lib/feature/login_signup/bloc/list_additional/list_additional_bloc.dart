import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/model/additional_model.dart';

import 'bloc_list_additional.dart';

class ListAdditionalBloc
    extends Bloc<ListAdditionalEvent, ListAdditionalState> {
  ListAdditionalBloc() : super(ListAdditionalInitial()) {
    on<InitialAdditionalEvent>((event, emit) async {
      try {
        emit(ListAdditionalLoading());
        additional.clear();
        additional.add(const AdditionalModel());
        emit(ListAdditionalSuccess(additional: additional));
      } catch (e) {
        emit(ListAdditionalFailure(error: e.toString()));
      }
    });
    on<AddAdditionalEvent>((event, emit) async {
      try {
        emit(ListAdditionalLoading());
        additional.add(const AdditionalModel());
        emit(ListAdditionalSuccess(additional: additional));
      } catch (e) {
        emit(ListAdditionalFailure(error: e.toString()));
      }
    });
  }

  List<AdditionalModel> additional = [];
}
