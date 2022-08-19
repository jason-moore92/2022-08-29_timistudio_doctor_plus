import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_working_day.dart';

class WorkingDayBloc extends Bloc<WorkingDayEvent, WorkingDayState> {
  WorkingDayBloc() : super(WorkingDayInitial()) {
    on<InitialWorkingDayEvent>((event, emit) async {
      try {
        emit(WorkingDayLoading());
        workingDay.clear();
        workingDay = List.generate(allTime.length,
            (index) => {'time': allTime[index], 'selected': false});
        emit(WorkingDaySuccess(
            workingDay: workingDay,
            includeHoliday: includeHoliday,
            fromCtl: fromCtl,
            toCtl: toCtl));
      } catch (e) {
        emit(WorkingDayFailure(error: e.toString()));
      }
    });
    on<EditWorkingDayEvent>((event, emit) async {
      try {
        emit(WorkingDayLoading());
        for (int i = 0; i < workingDay.length; i++) {
          if (event.index == i) {
            workingDay[i]['selected'] = !workingDay[i]['selected'];
          }
        }
        emit(WorkingDaySuccess(
            workingDay: workingDay,
            includeHoliday: includeHoliday,
            fromCtl: fromCtl,
            toCtl: toCtl));
      } catch (e) {
        emit(WorkingDayFailure(error: e.toString()));
      }
    });
    on<ChangeHolidaysEvent>((event, emit) async {
      try {
        emit(WorkingDayLoading());
        includeHoliday = !includeHoliday;
        emit(WorkingDaySuccess(
            workingDay: workingDay,
            includeHoliday: includeHoliday,
            fromCtl: fromCtl,
            toCtl: toCtl));
      } catch (e) {
        emit(WorkingDayFailure(error: e.toString()));
      }
    });
    on<ChangeFromDateEvent>((event, emit) async {
      try {
        emit(WorkingDayLoading());
        fromCtl = event.fromCtl;
        emit(WorkingDaySuccess(
            workingDay: workingDay,
            includeHoliday: includeHoliday,
            fromCtl: fromCtl,
            toCtl: toCtl));
      } catch (e) {
        emit(WorkingDayFailure(error: e.toString()));
      }
    });
    on<ChangeToDateEvent>((event, emit) async {
      try {
        emit(WorkingDayLoading());
        toCtl = event.toCtl;
        emit(WorkingDaySuccess(
            workingDay: workingDay,
            includeHoliday: includeHoliday,
            fromCtl: fromCtl,
            toCtl: toCtl));
      } catch (e) {
        emit(WorkingDayFailure(error: e.toString()));
      }
    });
  }
  List<String> allTime = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  List<Map<String, dynamic>> workingDay = [];
  bool includeHoliday = true;
  DateTime fromCtl = DateTime.now();
  DateTime toCtl = DateTime.now().add(const Duration(days: 2));
}
