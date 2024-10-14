import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/weather_cubit/weather_states.dart';

import '../../models/weather_model.dart';
import '../../services/weather_services.dart';


class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());
WeatherModel? weatherModel;
  
  
  Future<void> getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel = await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherSuccessState(weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
