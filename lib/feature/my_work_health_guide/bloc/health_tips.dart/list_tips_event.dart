import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';

abstract class ListTipsEvent extends Equatable {
  const ListTipsEvent();
}

class InitialTipsEvent extends ListTipsEvent {
  @override
  List<Object> get props => [];
}

class AddTipEvent extends ListTipsEvent {
  const AddTipEvent({required this.tipModel});
  final TipModel tipModel;
  @override
  List<Object> get props => [tipModel];
}
