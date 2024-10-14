
import '../../models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherSuccessState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
  final String errorMessage;
  WeatherFailureState(this.errorMessage);
}
