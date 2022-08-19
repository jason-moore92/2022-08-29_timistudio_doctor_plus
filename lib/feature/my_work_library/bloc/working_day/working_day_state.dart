import 'package:equatable/equatable.dart';

abstract class WorkingDayState extends Equatable {
  const WorkingDayState();
}

class WorkingDayInitial extends WorkingDayState {
  @override
  List<Object> get props => [];
}

class WorkingDayLoading extends WorkingDayState {
  @override
  List<Object> get props => [];
}

class WorkingDaySuccess extends WorkingDayState {
  const WorkingDaySuccess(
      {required this.workingDay,
      required this.includeHoliday,
      required this.toCtl,
      required this.fromCtl});
  final List<Map<String, dynamic>> workingDay;
  final bool includeHoliday;
  final DateTime fromCtl;
  final DateTime toCtl;
  @override
  List<Object> get props => [workingDay, includeHoliday, fromCtl, toCtl];
}

class WorkingDayFailure extends WorkingDayState {
  const WorkingDayFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
