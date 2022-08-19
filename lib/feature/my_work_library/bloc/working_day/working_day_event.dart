import 'package:equatable/equatable.dart';

abstract class WorkingDayEvent extends Equatable {
  const WorkingDayEvent();
}

class InitialWorkingDayEvent extends WorkingDayEvent {
  @override
  List<Object> get props => [];
}

class EditWorkingDayEvent extends WorkingDayEvent {
  const EditWorkingDayEvent({required this.index});
  final int index;
  @override
  List<Object> get props => [index];
}

class ChangeHolidaysEvent extends WorkingDayEvent {
  const ChangeHolidaysEvent({required this.changeHoliday});
  final bool changeHoliday;
  @override
  List<Object> get props => [changeHoliday];
}

class ChangeFromDateEvent extends WorkingDayEvent {
  const ChangeFromDateEvent({required this.fromCtl});
  final DateTime fromCtl;
  @override
  List<Object> get props => [fromCtl];
}

class ChangeToDateEvent extends WorkingDayEvent {
  const ChangeToDateEvent({required this.toCtl});
  final DateTime toCtl;
  @override
  List<Object> get props => [toCtl];
}
