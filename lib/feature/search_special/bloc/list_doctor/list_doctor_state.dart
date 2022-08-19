import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/doctor_model.dart';

abstract class ListDoctorState extends Equatable {
  const ListDoctorState();
}

class ListDoctorInitial extends ListDoctorState {
  @override
  List<Object> get props => [];
}

class ListDoctorLoading extends ListDoctorState {
  @override
  List<Object> get props => [];
}

class ListDoctorSuccess extends ListDoctorState {
  const ListDoctorSuccess({required this.doctors});
  final List<DoctorModel> doctors;
  @override
  List<Object> get props => [doctors];
}

class ListDoctorFailure extends ListDoctorState {
  const ListDoctorFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
