import 'package:json_annotation/json_annotation.dart';
import 'package:weather/services/network/data/coordinates.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  final String name;
  final Coordinates coord;
  final String country;

  City({required this.name, required this.coord, required this.country});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class GeoCity {
  final String name;
  final String country;
  final double lat;
  final double lon;

  GeoCity(
      {required this.name,
      required this.country,
      required this.lat,
      required this.lon});

  factory GeoCity.fromJson(Map<String, dynamic> json) =>
      _$GeoCityFromJson(json);

  Map<String, dynamic> toJson() => _$GeoCityToJson(this);

  City toCity() {
    return City(
        name: name, coord: Coordinates(lat: lat, lon: lon), country: country);
  }
}
