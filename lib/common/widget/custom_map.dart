import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/util/google_map.dart';
import 'package:flutter_doctor_plus/feature/login_signup/bloc/choose_location/bloc_choose_location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({Key? key}) : super(key: key);

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  late Position _locationData;
  late LocationPermission permission;
  Set<Marker> markers = {};

  late BitmapDescriptor pinLocationIcon;
  Future<void> setCustomMapPin(String image) async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 1), image);
    BlocProvider.of<ChooseLocationBloc>(context).add(InitialEvent(pinLocationIcon: pinLocationIcon));
  }

  Future<Position?> checkPermission() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      if (Platform.isAndroid) {
        permission = await Geolocator.requestPermission();
      } else if (Platform.isIOS) {
        await Geolocator.requestPermission();
      }
      return null;
    }
    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
      return null;
    }
    _locationData = await AppWidget.getCurrentLocation();
    return _locationData;
  }

  @override
  void initState() {
    setCustomMapPin(icPinLocation1);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkPermission();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position?>(
        future: checkPermission(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return BlocBuilder<ChooseLocationBloc, ChooseLocationsState>(
              builder: (context, state) {
                if (state is ChooseLocationsSuccess) {
                  markers = state.currentLocation;
                }
                return MapGoogle(
                  markers: markers,
                  myLocationEnabled: false,
                  latLng: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                );
              },
            );
          }
          return const Center(
            child: CupertinoActivityIndicator(
              animating: true,
            ),
          );
        });
  }
}
