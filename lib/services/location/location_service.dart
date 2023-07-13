import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:location/location.dart';
import 'package:weather/services/network/data/city.dart';
import 'package:weather/services/network/data/coordinates.dart';

class LocationService {
  Location location = Location();
  City? _city;
  City get city =>
      _city ??
      City(
          name: 'Lviv',
          coord: Coordinates(lat: 49.842957, lon: 24.031111),
          country: 'Ukraine');

  void _init() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();

    if (locationData.latitude != null && locationData.longitude != null) {
      List<geocoding.Placemark> placemarks =
          await geocoding.GeocodingPlatform.instance.placemarkFromCoordinates(
              locationData.latitude!, locationData.longitude!);
      _city = City(
        name: placemarks[0].locality.toString(),
        coord: Coordinates(
            lat: locationData.latitude!, lon: locationData.longitude!),
        country: placemarks[0].country.toString(),
      );
    }
  }

  LocationService() {
    _init();
  }
}
