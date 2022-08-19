import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/education_model.dart';

abstract class ListEducationsState extends Equatable {
  const ListEducationsState();
}

class ListEducationsInitial extends ListEducationsState {
  @override
  List<Object> get props => [];
}

class ListEducationsLoading extends ListEducationsState {
  @override
  List<Object> get props => [];
}

class ListEducationsSuccess extends ListEducationsState {
  const ListEducationsSuccess({required this.education});
  final List<EducationModel> education;
  @override
  List<Object> get props => [education];
}

class ListEducationsFailure extends ListEducationsState {
  const ListEducationsFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
