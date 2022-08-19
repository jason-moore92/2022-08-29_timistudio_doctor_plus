import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';

abstract class ListTipsState extends Equatable {
  const ListTipsState();
}

class ListTipsInitial extends ListTipsState {
  @override
  List<Object> get props => [];
}

class ListTipsLoading extends ListTipsState {
  @override
  List<Object> get props => [];
}

class ListTipsSuccess extends ListTipsState {
  const ListTipsSuccess({required this.tips});
  final List<TipModel> tips;
  @override
  List<Object> get props => [tips];
}

class ListTipsFailure extends ListTipsState {
  const ListTipsFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
