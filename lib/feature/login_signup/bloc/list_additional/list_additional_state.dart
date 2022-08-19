import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/additional_model.dart';

abstract class ListAdditionalState extends Equatable {
  const ListAdditionalState();
}

class ListAdditionalInitial extends ListAdditionalState {
  @override
  List<Object> get props => [];
}

class ListAdditionalLoading extends ListAdditionalState {
  @override
  List<Object> get props => [];
}

class ListAdditionalSuccess extends ListAdditionalState {
  const ListAdditionalSuccess({required this.additional});
  final List<AdditionalModel> additional;
  @override
  List<Object> get props => [additional];
}

class ListAdditionalFailure extends ListAdditionalState {
  const ListAdditionalFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
