import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';

abstract class ListCreatedMeEvent extends Equatable {
  const ListCreatedMeEvent();
}

class InitialCreatedMesEvent extends ListCreatedMeEvent {
  @override
  List<Object> get props => [];
}

class AddCreatedMeEvent extends ListCreatedMeEvent {
  const AddCreatedMeEvent({required this.tipModel});
  final TipModel tipModel;
  @override
  List<Object> get props => [tipModel];
}
