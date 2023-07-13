import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  @JsonKey(name: 'dt')
  final int date;
  final DayTemperature temp;
  final List<WeatherDescription> weather;

  Weather({required this.date, required this.temp, required this.weather});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class DayTemperature {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  DayTemperature(
      {required this.day,
      required this.min,
      required this.max,
      required this.night,
      required this.eve,
      required this.morn});

  factory DayTemperature.fromJson(Map<String, dynamic> json) =>
      _$DayTemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$DayTemperatureToJson(this);
}

@JsonSerializable()
class WeatherDescription {
  final String main;
  final String description;
  final String icon;

  WeatherDescription(
      {required this.main, required this.description, required this.icon});

  factory WeatherDescription.fromJson(Map<String, dynamic> json) =>
      _$WeatherDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDescriptionToJson(this);
}
