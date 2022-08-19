import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/certification_model.dart';

abstract class ListCertificationState extends Equatable {
  const ListCertificationState();
}

class ListCertificationInitial extends ListCertificationState {
  @override
  List<Object> get props => [];
}

class ListCertificationLoading extends ListCertificationState {
  @override
  List<Object> get props => [];
}

class ListCertificationSuccess extends ListCertificationState {
  const ListCertificationSuccess({required this.certification});
  final List<CertificationModel> certification;
  @override
  List<Object> get props => [certification];
}

class ListCertificationFailure extends ListCertificationState {
  const ListCertificationFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
