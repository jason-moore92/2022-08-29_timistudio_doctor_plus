import 'package:equatable/equatable.dart';

abstract class ListAdditionalEvent extends Equatable {
  const ListAdditionalEvent();
}

class InitialAdditionalEvent extends ListAdditionalEvent {
  @override
  List<Object> get props => [];
}

class AddAdditionalEvent extends ListAdditionalEvent {
  @override
  List<Object> get props => [];
}
