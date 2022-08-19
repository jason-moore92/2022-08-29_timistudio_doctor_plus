import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';

import 'bloc_list_condition_topic.dart';

class ListConditionTopicBloc
    extends Bloc<ListConditionTopicEvent, ListConditionTopicState> {
  ListConditionTopicBloc() : super(ListConditionTopicInitial()) {
    on<InitialConditionEvent>((event, emit) async {
      try {
        emit(ListConditionTopicLoading());
        condition.clear();
        condition = List.generate(conditions.length,
            (index) => {'condition': conditions[index], 'selected': false});
        emit(ListConditionTopicSuccess(condition: condition));
      } catch (e) {
        emit(ListConditionTopicFailure(error: e.toString()));
      }
    });
    on<SortConditionEvent>((event, emit) async {
      try {
        emit(ListConditionTopicLoading());
        condition = List.from(condition.reversed);
        emit(ListConditionTopicSuccess(condition: condition));
      } catch (e) {
        emit(ListConditionTopicFailure(error: e.toString()));
      }
    });
    on<SelectedConditionEvent>((event, emit) async {
      try {
        emit(ListConditionTopicLoading());
        if (!conditionSelected.contains(event.conditionSelected)) {
          conditionSelected.add(event.conditionSelected);
        } else {
          conditionSelected.remove(event.conditionSelected);
        }
        for (var item in condition) {
          if (item['condition'] == event.conditionSelected) {
            item['selected'] = !item['selected'];
          }
        }
        emit(ListConditionTopicSuccess(condition: condition));
      } catch (e) {
        emit(ListConditionTopicFailure(error: e.toString()));
      }
    });
    on<SearchConditionEvent>((event, emit) async {
      try {
        emit(ListConditionTopicLoading());
        conditionSearch.clear();
        condition.clear();
        condition = List.generate(conditions.length,
            (index) => {'condition': conditions[index], 'selected': false});
        if (event.searchValue.isNotEmpty) {
          for (int i = 0; i < condition.length; i++) {
            if (condition[i]['condition'].contains(event.searchValue)) {
              conditionSearch.add(condition[i]);
            }
          }
        } else {
          conditionSearch = condition;
        }
        emit(ListConditionTopicSuccess(condition: conditionSearch));
      } catch (e) {
        emit(ListConditionTopicFailure(error: e.toString()));
      }
    });
    on<QuickAccessConditionEvent>((event, emit) async {
      try {
        emit(ListConditionTopicLoading());
        condition.clear();
        conditionSearch.clear();
        condition = List.generate(conditions.length,
            (index) => {'condition': conditions[index], 'selected': false});
        if (event.label == '#' || event.label.isEmpty) {
          conditionSearch = condition;
        } else {
          textSelected = event.label;
          for (int i = 0; i < condition.length; i++) {
            if (condition[i]['condition']
                .substring(0, 2)
                .contains(event.label)) {
              conditionSearch.add(condition[i]);
            }
          }
        }
        emit(ListConditionTopicSuccess(
            condition: conditionSearch, textSelected: textSelected));
      } catch (e) {
        emit(ListConditionTopicFailure(error: e.toString()));
      }
    });
  }

  String textSelected = '#';
  List<Map<String, dynamic>> condition = [];
  List<Map<String, dynamic>> conditionSearch = [];
  List<String> conditionSelected = [];
}
