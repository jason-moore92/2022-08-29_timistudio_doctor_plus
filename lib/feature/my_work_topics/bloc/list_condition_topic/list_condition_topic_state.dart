import 'package:equatable/equatable.dart';

abstract class ListConditionTopicState extends Equatable {
  const ListConditionTopicState();
}

class ListConditionTopicInitial extends ListConditionTopicState {
  @override
  List<Object> get props => [];
}

class ListConditionTopicLoading extends ListConditionTopicState {
  @override
  List<Object> get props => [];
}

class ListConditionTopicSuccess extends ListConditionTopicState {
  const ListConditionTopicSuccess(
      {required this.condition, this.textSelected = '#'});
  final List<Map<String, dynamic>> condition;
  final String textSelected;
  @override
  List<Object> get props => [condition, textSelected];
}

class ListConditionTopicFailure extends ListConditionTopicState {
  const ListConditionTopicFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
