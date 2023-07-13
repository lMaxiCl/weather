import 'package:dio/dio.dart';

class DioInstances {
  static getDioWeatherInstance() {
    return Dio(
      BaseOptions(
        connectTimeout: const Duration(milliseconds: 500),
        receiveTimeout: const Duration(milliseconds: 500),
        sendTimeout: const Duration(milliseconds: 500),
        listFormat: ListFormat.multi,
        queryParameters: const {
          'appid': 'Insert your API key here',
        },
      ),
    );
  }

  static getDioGeocodingInstance() {
    return Dio(
      BaseOptions(
        connectTimeout: const Duration(milliseconds: 500),
        receiveTimeout: const Duration(milliseconds: 500),
        sendTimeout: const Duration(milliseconds: 500),
        listFormat: ListFormat.multi,
        queryParameters: const {
          'appid': 'Insert your API key here',
        },
      ),
    );
  }
}
