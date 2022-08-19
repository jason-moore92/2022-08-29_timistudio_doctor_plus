import 'package:equatable/equatable.dart';

abstract class ListConditionTopicEvent extends Equatable {
  const ListConditionTopicEvent();
}

class InitialConditionEvent extends ListConditionTopicEvent {
  @override
  List<Object> get props => [];
}

class SelectedConditionEvent extends ListConditionTopicEvent {
  const SelectedConditionEvent({required this.conditionSelected});
  final String conditionSelected;
  @override
  List<Object> get props => [conditionSelected];
}

class SortConditionEvent extends ListConditionTopicEvent {
  @override
  List<Object> get props => [];
}

class SearchConditionEvent extends ListConditionTopicEvent {
  const SearchConditionEvent({required this.searchValue});
  final String searchValue;
  @override
  List<Object> get props => [searchValue];
}

class QuickAccessConditionEvent extends ListConditionTopicEvent {
  const QuickAccessConditionEvent({required this.label});
  final String label;
  @override
  List<Object> get props => [label];
}
