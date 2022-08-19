import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/hospital_model.dart';

abstract class ListHospitalExtrasState extends Equatable {
  const ListHospitalExtrasState();
}

class ListHospitalExtrasInitial extends ListHospitalExtrasState {
  @override
  List<Object> get props => [];
}

class ListHospitalExtrasLoading extends ListHospitalExtrasState {
  @override
  List<Object> get props => [];
}

class ListHospitalExtrasSuccess extends ListHospitalExtrasState {
  const ListHospitalExtrasSuccess({required this.hospitals});
  final List<HospitalModel> hospitals;
  @override
  List<Object> get props => [hospitals];
}

class ListHospitalExtrasFailure extends ListHospitalExtrasState {
  const ListHospitalExtrasFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
