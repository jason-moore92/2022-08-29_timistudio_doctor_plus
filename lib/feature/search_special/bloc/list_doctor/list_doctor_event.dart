import 'package:equatable/equatable.dart';

abstract class ListDoctorEvent extends Equatable {
  const ListDoctorEvent();
}

class InitialDoctorEvent extends ListDoctorEvent {
  @override
  List<Object> get props => [];
}

class SearchDoctorEvent extends ListDoctorEvent {
  const SearchDoctorEvent({required this.searchValue});
  final String searchValue;
  @override
  List<Object> get props => [searchValue];
}
