import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';

import 'bloc_list_saved.dart';

class ListSavedBloc extends Bloc<ListSavedEvent, ListSavedState> {
  ListSavedBloc() : super(ListSavedInitial()) {
    on<InitialSavedEvent>((event, emit) async {
      try {
        emit(ListSavedLoading());
        healthSaved.clear();
        healthSaved = List.generate(
            healthGuidesSaved.length, (index) => healthGuidesSaved[index]);
        emit(ListSavedSuccess(tips: healthSaved));
      } catch (e) {
        emit(ListSavedFailure(error: e.toString()));
      }
    });
    on<SavedEvent>((event, emit) async {
      try {
        emit(ListSavedLoading());
        healthSaved.add(event.tipModel);
        emit(ListSavedSuccess(tips: healthSaved));
      } catch (e) {
        emit(ListSavedFailure(error: e.toString()));
      }
    });
    on<UnSavedEvent>((event, emit) async {
      try {
        emit(ListSavedLoading());
        healthSaved.remove(event.tipModel);
        emit(ListSavedSuccess(tips: healthSaved));
      } catch (e) {
        emit(ListSavedFailure(error: e.toString()));
      }
    });
  }

  List<TipModel> healthSaved = [];
}
