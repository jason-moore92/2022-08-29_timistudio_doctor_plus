import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/model/award_model.dart';

import 'bloc_list_award.dart';

class ListAwardBloc extends Bloc<ListAwardEvent, ListAwardState> {
  ListAwardBloc() : super(ListAwardInitial()) {
    on<InitialAwardEvent>((event, emit) async {
      try {
        emit(ListAwardLoading());
        award.clear();
        award.add(const AwardModel());
        emit(ListAwardSuccess(award: award));
      } catch (e) {
        emit(ListAwardFailure(error: e.toString()));
      }
    });
    on<AddAwardEvent>((event, emit) async {
      try {
        emit(ListAwardLoading());
        award.add(const AwardModel());
        emit(ListAwardSuccess(award: award));
      } catch (e) {
        emit(ListAwardFailure(error: e.toString()));
      }
    });
  }

  List<AwardModel> award = [];
}
