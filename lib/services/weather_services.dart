


import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherServices {
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'a4c475a71d8e4019b4121458241310';
  final Dio dio;

  WeatherServices(this.dio);

  Future<WeatherModel?> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      print("error === ${e.toString()} ===");
      final errmessage = e.response?.data["error"]["message"] ??
          "oops there was an error , try later ";
      throw Exception(errmessage);
    } catch (e) {
      throw Exception("oops there was an error , try later ");
    }
  }
}
