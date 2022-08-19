import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'bloc_choose_location.dart';

class ChooseLocationBloc
    extends Bloc<ChooseLocationEvent, ChooseLocationsState> {
  ChooseLocationBloc() : super(ChooseLocationsInitial()) {
    on<InitialEvent>((event, emit) async {
      try {
        emit(ChooseLocationsLoading());
        locationsNearby = await create(event.pinLocationIcon);
        emit(ChooseLocationsSuccess(currentLocation: locationsNearby));
      } catch (e) {
        emit(ChooseLocationsFailure(error: e.toString()));
      }
    });
    // on<SelectedEvent>((event, emit) async {
    //   emit(ChooseLocationsLoading());
    //   locationsNearby = await create(event.pinLocationIcon);
    //   emit(ChooseLocationsSuccess(currentLocation: locationsNearby));
    // });
  }

  Set<Marker> locationsNearby = <Marker>{};

  Future<Set<Marker>> create(BitmapDescriptor pinLocationIcon) async {
    final Position position = await AppWidget.getCurrentLocation();
    locationsNearby.add(Marker(
        markerId: const MarkerId('1'),
        position: LatLng(position.latitude, position.longitude),
        icon: pinLocationIcon));
    return locationsNearby;
  }
}
