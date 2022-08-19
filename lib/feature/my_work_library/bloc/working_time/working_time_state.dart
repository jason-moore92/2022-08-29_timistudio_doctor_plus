import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/working_time_model.dart';

abstract class WorkingTimeState extends Equatable {
  const WorkingTimeState();
}

class WorkingTimeInitial extends WorkingTimeState {
  @override
  List<Object> get props => [];
}

class WorkingTimeLoading extends WorkingTimeState {
  @override
  List<Object> get props => [];
}

class WorkingTimeSuccess extends WorkingTimeState {
  const WorkingTimeSuccess({required this.workingTime});
  final List<WorkingTimeModel> workingTime;
  @override
  List<Object> get props => [workingTime];
}

class WorkingTimeFailure extends WorkingTimeState {
  const WorkingTimeFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
