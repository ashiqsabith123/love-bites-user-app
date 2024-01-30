import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:love_bites_user_app/data/models/location_response_model/location_response_model.dart';

class GetLocationProvider {
  Future<LocationResponseModel> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position position;
    List<Placemark> placemarks;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return LocationResponseModel(error: 'Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return LocationResponseModel(error: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return LocationResponseModel(
          error:
              'Location permissions are permanently denied, we cannot request permissions.');
    }

    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      return LocationResponseModel(error: 'error while getin lat and log $e');
    }

    try {
      placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
    } catch (e) {
      return LocationResponseModel(error: 'error while getting location');
    }

    return LocationResponseModel(
        state: placemarks[0].administrativeArea,
        district: placemarks[0].locality);
  }
}
