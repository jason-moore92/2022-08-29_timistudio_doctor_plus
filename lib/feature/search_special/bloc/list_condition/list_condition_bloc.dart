import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';

import 'bloc_list_condition.dart';

class ListConditionBloc extends Bloc<ListConditionEvent, ListConditionState> {
  ListConditionBloc() : super(ListConditionInitial()) {
    on<InitialConditionEvent>((event, emit) async {
      try {
        emit(ListConditionLoading());
        condition.clear();
        condition =
            List.generate(allCondition.length, (index) => allCondition[index]);
        emit(ListConditionSuccess(conditions: condition));
      } catch (e) {
        emit(ListConditionFailure(error: e.toString()));
      }
    });
    on<SearchConditionEvent>((event, emit) async {
      try {
        emit(ListConditionLoading());
        conditionSearch.clear();
        condition.clear();
        condition =
            List.generate(allCondition.length, (index) => allCondition[index]);
        if (event.searchValue.isNotEmpty) {
          for (int i = 0; i < condition.length; i++) {
            if (condition[i].contains(event.searchValue)) {
              conditionSearch.add(condition[i]);
            }
          }
        } else {
          conditionSearch = condition;
        }
        emit(ListConditionSuccess(conditions: conditionSearch));
      } catch (e) {
        emit(ListConditionFailure(error: e.toString()));
      }
    });
    on<QuickAccessEvent>((event, emit) async {
      try {
        emit(ListConditionLoading());
        condition.clear();
        conditionSearch.clear();
        condition =
            List.generate(allCondition.length, (index) => allCondition[index]);
        if (event.label == '#' || event.label.isEmpty) {
          conditionSearch = condition;
        } else {
          textSelected = event.label;
          for (int i = 0; i < condition.length; i++) {
            if (condition[i].substring(0, 2).contains(event.label)) {
              conditionSearch.add(condition[i]);
            }
          }
        }
        emit(ListConditionSuccess(
            conditions: conditionSearch, textSelected: textSelected));
      } catch (e) {
        emit(ListConditionFailure(error: e.toString()));
      }
    });
  }
  String textSelected = '#';
  List<String> condition = [];
  List<String> conditionSearch = [];
}
