import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';

import 'bloc_list_tips.dart';

class ListTipsBloc extends Bloc<ListTipsEvent, ListTipsState> {
  ListTipsBloc() : super(ListTipsInitial()) {
    on<InitialTipsEvent>((event, emit) async {
      try {
        emit(ListTipsLoading());
        tips.clear();
        tips = List.generate(healthTips.length, (index) => healthTips[index]);
        emit(ListTipsSuccess(tips: tips));
      } catch (e) {
        emit(ListTipsFailure(error: e.toString()));
      }
    });
    on<AddTipEvent>((event, emit) async {
      try {
        emit(ListTipsLoading());
        tips.add(event.tipModel);
        emit(ListTipsSuccess(tips: tips));
      } catch (e) {
        emit(ListTipsFailure(error: e.toString()));
      }
    });
  }

  List<TipModel> tips = [];
}
