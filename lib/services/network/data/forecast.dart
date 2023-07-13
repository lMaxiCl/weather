import 'package:json_annotation/json_annotation.dart';
import 'package:weather/services/network/data/weather.dart';

import 'city.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  final City city;
  final List<Weather> list;

  Forecast({required this.city, required this.list});

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
