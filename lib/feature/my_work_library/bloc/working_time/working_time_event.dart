import 'package:equatable/equatable.dart';

abstract class WorkingTimeEvent extends Equatable {
  const WorkingTimeEvent();
}

class InitialWorkingTimeEvent extends WorkingTimeEvent {
  @override
  List<Object> get props => [];
}

class AddWorkingTimeEvent extends WorkingTimeEvent {
  const AddWorkingTimeEvent(
      {required this.fromDate, required this.toDate, required this.index});
  final String fromDate;
  final String toDate;
  final int index;
  @override
  List<Object> get props => [fromDate, toDate];
}

class EditWorkingTimeEvent extends WorkingTimeEvent {
  const EditWorkingTimeEvent(
      {required this.fromDate, required this.toDate, required this.index});
  final String fromDate;
  final String toDate;
  final int index;
  @override
  List<Object> get props => [fromDate, toDate, index];
}

class RemoveWorkingTimeEvent extends WorkingTimeEvent {
  const RemoveWorkingTimeEvent({required this.index});
  final int index;
  @override
  List<Object> get props => [index];
}
