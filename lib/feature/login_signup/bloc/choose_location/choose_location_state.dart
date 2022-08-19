import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class ChooseLocationsState extends Equatable {
  const ChooseLocationsState();
}

class ChooseLocationsInitial extends ChooseLocationsState {
  @override
  List<Object> get props => [];
}

class ChooseLocationsLoading extends ChooseLocationsState {
  @override
  List<Object> get props => [];
}

class ChooseLocationsSuccess extends ChooseLocationsState {
  const ChooseLocationsSuccess({required this.currentLocation});
  final Set<Marker> currentLocation;
  @override
  List<Object> get props => [currentLocation];
}

class ChooseLocationsFailure extends ChooseLocationsState {
  const ChooseLocationsFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
