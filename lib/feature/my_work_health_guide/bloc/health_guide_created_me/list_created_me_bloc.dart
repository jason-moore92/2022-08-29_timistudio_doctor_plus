import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';

import 'bloc_list_created_me.dart';

class ListCreatedMeBloc extends Bloc<ListCreatedMeEvent, ListCreatedMeState> {
  ListCreatedMeBloc() : super(ListCreatedMeInitial()) {
    on<InitialCreatedMesEvent>((event, emit) async {
      try {
        emit(ListCreatedMeLoading());
        createdMe.clear();
        createdMe = List.generate(healthGuidesCreatedByMe.length,
            (index) => healthGuidesCreatedByMe[index]);
        emit(ListCreatedMeSuccess(createdMe: createdMe));
      } catch (e) {
        emit(ListCreatedMeFailure(error: e.toString()));
      }
    });
    on<AddCreatedMeEvent>((event, emit) async {
      try {
        emit(ListCreatedMeLoading());
        createdMe.add(event.tipModel);
        emit(ListCreatedMeSuccess(createdMe: createdMe));
      } catch (e) {
        emit(ListCreatedMeFailure(error: e.toString()));
      }
    });
  }

  List<TipModel> createdMe = [];
}
