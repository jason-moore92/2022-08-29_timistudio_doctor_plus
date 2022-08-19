import 'package:equatable/equatable.dart';

abstract class ListAwardEvent extends Equatable {
  const ListAwardEvent();
}

class InitialAwardEvent extends ListAwardEvent {
  @override
  List<Object> get props => [];
}

class AddAwardEvent extends ListAwardEvent {
  @override
  List<Object> get props => [];
}
