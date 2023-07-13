import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../data/city.dart';

part 'cities_repository.g.dart';

@RestApi(
  baseUrl: 'http://api.openweathermap.org/geo/1.0/',
)
abstract class CitiesRepository {
  factory CitiesRepository(Dio dio, {String baseUrl}) = _CitiesRepository;

  @GET('direct?q={cityName}&limit={limit}')
  Future<List<GeoCity>> queryCities(@Path() String cityName,
      {@Path() int limit = 5});
}
