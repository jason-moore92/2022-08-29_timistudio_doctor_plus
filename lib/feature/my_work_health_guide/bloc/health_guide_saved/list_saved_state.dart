import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';

abstract class ListSavedState extends Equatable {
  const ListSavedState();
}

class ListSavedInitial extends ListSavedState {
  @override
  List<Object> get props => [];
}

class ListSavedLoading extends ListSavedState {
  @override
  List<Object> get props => [];
}

class ListSavedSuccess extends ListSavedState {
  const ListSavedSuccess({required this.tips});
  final List<TipModel> tips;
  @override
  List<Object> get props => [tips];
}

class ListSavedFailure extends ListSavedState {
  const ListSavedFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
