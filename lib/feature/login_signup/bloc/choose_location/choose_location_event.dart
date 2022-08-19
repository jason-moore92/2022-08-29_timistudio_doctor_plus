import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class ChooseLocationEvent extends Equatable {
  const ChooseLocationEvent();
}

class InitialEvent extends ChooseLocationEvent {
  const InitialEvent({required this.pinLocationIcon});
  final BitmapDescriptor pinLocationIcon;
  @override
  List<Object> get props => [pinLocationIcon];
}

class SelectedEvent extends ChooseLocationEvent {
  const SelectedEvent({required this.currentLocation});
  final LatLng currentLocation;
  @override
  List<Object> get props => [currentLocation];
}
