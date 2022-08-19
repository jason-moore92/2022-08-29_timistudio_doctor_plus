import 'package:equatable/equatable.dart';

abstract class ListHospitalExtraEvent extends Equatable {
  const ListHospitalExtraEvent();
}

class InitialHospitalEvent extends ListHospitalExtraEvent {
  @override
  List<Object> get props => [];
}

class AddEvent extends ListHospitalExtraEvent {
  @override
  List<Object> get props => [];
}
