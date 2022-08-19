import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/award_model.dart';

abstract class ListAwardState extends Equatable {
  const ListAwardState();
}

class ListAwardInitial extends ListAwardState {
  @override
  List<Object> get props => [];
}

class ListAwardLoading extends ListAwardState {
  @override
  List<Object> get props => [];
}

class ListAwardSuccess extends ListAwardState {
  const ListAwardSuccess({required this.award});
  final List<AwardModel> award;
  @override
  List<Object> get props => [award];
}

class ListAwardFailure extends ListAwardState {
  const ListAwardFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
