import 'package:equatable/equatable.dart';

abstract class ListConditionState extends Equatable {
  const ListConditionState();
}

class ListConditionInitial extends ListConditionState {
  @override
  List<Object> get props => [];
}

class ListConditionLoading extends ListConditionState {
  @override
  List<Object> get props => [];
}

class ListConditionSuccess extends ListConditionState {
  const ListConditionSuccess(
      {required this.conditions, this.textSelected = '#'});
  final List<String> conditions;
  final String textSelected;
  @override
  List<Object> get props => [conditions];
}

class ListConditionFailure extends ListConditionState {
  const ListConditionFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
