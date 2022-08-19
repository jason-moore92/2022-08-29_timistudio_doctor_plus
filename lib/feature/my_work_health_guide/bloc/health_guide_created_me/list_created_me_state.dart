import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';

abstract class ListCreatedMeState extends Equatable {
  const ListCreatedMeState();
}

class ListCreatedMeInitial extends ListCreatedMeState {
  @override
  List<Object> get props => [];
}

class ListCreatedMeLoading extends ListCreatedMeState {
  @override
  List<Object> get props => [];
}

class ListCreatedMeSuccess extends ListCreatedMeState {
  const ListCreatedMeSuccess({required this.createdMe});
  final List<TipModel> createdMe;
  @override
  List<Object> get props => [createdMe];
}

class ListCreatedMeFailure extends ListCreatedMeState {
  const ListCreatedMeFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
