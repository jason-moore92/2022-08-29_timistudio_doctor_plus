import 'package:equatable/equatable.dart';

abstract class ListConditionEvent extends Equatable {
  const ListConditionEvent();
}

class InitialConditionEvent extends ListConditionEvent {
  @override
  List<Object> get props => [];
}

class SearchConditionEvent extends ListConditionEvent {
  const SearchConditionEvent({required this.searchValue});
  final String searchValue;
  @override
  List<Object> get props => [searchValue];
}

class QuickAccessEvent extends ListConditionEvent {
  const QuickAccessEvent({required this.label});
  final String label;
  @override
  List<Object> get props => [label];
}
