import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/model/working_time_model.dart';

import 'bloc_working_time.dart';

class WorkingTimeBloc extends Bloc<WorkingTimeEvent, WorkingTimeState> {
  WorkingTimeBloc() : super(WorkingTimeInitial()) {
    on<InitialWorkingTimeEvent>((event, emit) async {
      try {
        emit(WorkingTimeLoading());
        workingTime.clear();
        workingTime.add(const WorkingTimeModel(
            id: 0, fromDate: '08:00 AM', toDate: '12:00 PM'));
        emit(WorkingTimeSuccess(workingTime: workingTime));
      } catch (e) {
        emit(WorkingTimeFailure(error: e.toString()));
      }
    });
    on<AddWorkingTimeEvent>((event, emit) async {
      try {
        emit(WorkingTimeLoading());
        workingTime.add(WorkingTimeModel(
            id: event.index, fromDate: event.fromDate, toDate: event.toDate));
        emit(WorkingTimeSuccess(workingTime: workingTime));
      } catch (e) {
        emit(WorkingTimeFailure(error: e.toString()));
      }
    });
    on<EditWorkingTimeEvent>((event, emit) async {
      try {
        emit(WorkingTimeLoading());
        for (int i = 0; i < workingTime.length; i++) {
          if (i == event.index) {
            workingTime[i] = WorkingTimeModel(
                id: i, fromDate: event.fromDate, toDate: event.toDate);
          }
        }
        emit(WorkingTimeSuccess(workingTime: workingTime));
      } catch (e) {
        emit(WorkingTimeFailure(error: e.toString()));
      }
    });
    on<RemoveWorkingTimeEvent>((event, emit) async {
      try {
        emit(WorkingTimeLoading());
        workingTime.removeAt(event.index);
        emit(WorkingTimeSuccess(workingTime: workingTime));
      } catch (e) {
        emit(WorkingTimeFailure(error: e.toString()));
      }
    });
  }
  List<WorkingTimeModel> workingTime = [];
}
