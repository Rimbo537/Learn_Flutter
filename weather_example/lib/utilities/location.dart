import 'package:geolocator/geolocator.dart';

class Location {
 double? latitude = 0.0;
 double? longtitude = 0.0;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longtitude = position.longitude;
    } catch (e) {
      print('Something goes wrong: $e');
    }
  }
}
