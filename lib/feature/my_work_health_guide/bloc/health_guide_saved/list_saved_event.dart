import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';

abstract class ListSavedEvent extends Equatable {
  const ListSavedEvent();
}

class InitialSavedEvent extends ListSavedEvent {
  @override
  List<Object> get props => [];
}

class SavedEvent extends ListSavedEvent {
  const SavedEvent({required this.tipModel});
  final TipModel tipModel;
  @override
  List<Object> get props => [tipModel];
}

class UnSavedEvent extends ListSavedEvent {
  const UnSavedEvent({required this.tipModel});
  final TipModel tipModel;
  @override
  List<Object> get props => [tipModel];
}
