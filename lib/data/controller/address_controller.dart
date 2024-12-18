import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  RxString currentAddress = "".obs;
  Position? _currentPosition;

  Future<bool> _permissionAddress() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _permissionAddress();
    if (!hasPermission) return;

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;
      _getCurrentAddress(position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getCurrentAddress(Position position) async {
    await placemarkFromCoordinates(
      _currentPosition!.latitude,
      _currentPosition!.longitude,
    ).then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress.value = '${place.street}, ${place.subLocality}';
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void onInit() {
    _permissionAddress();
    _getCurrentPosition();
    super.onInit();
  }
}
