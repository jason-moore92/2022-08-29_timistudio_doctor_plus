import 'package:equatable/equatable.dart';

abstract class ListCertificationEvent extends Equatable {
  const ListCertificationEvent();
}

class InitialCertificationEvent extends ListCertificationEvent {
  @override
  List<Object> get props => [];
}

class AddCertificationEvent extends ListCertificationEvent {
  @override
  List<Object> get props => [];
}
