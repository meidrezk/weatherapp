import 'package:flutter/material.dart';

class WeatherModel {
  final String cityName;
  final DateTime date;
  final String urlImage;
  final String weatherStateName;
  final double temp;
  final double minTemp;
  final double maxTemp;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.urlImage,
    required this.weatherStateName,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        date: DateTime.parse(json['current']['last_updated']),
        cityName: json['location']['name'],
        urlImage:json['forecast']['forecastday'][0]['day']['condition']['icon'] ,
        weatherStateName: json['forecast']['forecastday'][0]['day']['condition']['text'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],);
  }


  
  String toString() {
    return 'tem = $temp  minTemp = $minTemp  date = $date';
  }

  String getImage() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||  weatherStateName == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (

    weatherStateName == 'Blizzard' ||
    weatherStateName == 'Moderate rain' ||

        weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||  weatherStateName == 'partly cloudy') {
      return Colors.orange;
    } else if (

    weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' ||weatherStateName=='Moderate rain' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }


}

