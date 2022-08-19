import 'package:equatable/equatable.dart';

abstract class ListEducationEvent extends Equatable {
  const ListEducationEvent();
}

class InitialEducationEvent extends ListEducationEvent {
  @override
  List<Object> get props => [];
}

class AddEducationEvent extends ListEducationEvent {
  @override
  List<Object> get props => [];
}
