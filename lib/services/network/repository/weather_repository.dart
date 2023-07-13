import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../data/forecast.dart';

part 'weather_repository.g.dart';

@RestApi(
  baseUrl: 'http://api.openweathermap.org/data/2.5/',
)
abstract class WeatherRepository {
  factory WeatherRepository(Dio dio, {String baseUrl}) = _WeatherRepository;

  @GET('forecast/daily?lat={lat}&lon={lon}&cnt={cnt}')
  Future<Forecast> getForecastByLatLong(
    @Path() double lat,
    @Path() double lon, {
    @Path() int cnt = 16,
  });
}
