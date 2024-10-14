

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/views/home_view.dart';


import 'cubits/weather_cubit/weather_cubit.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => WeatherCubit(),
    child: WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
   const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:

        BlocProvider
            .of<WeatherCubit>(context)
            .weatherModel == null ? Colors.blue : BlocProvider
            .of<WeatherCubit>(context)
            .weatherModel!
            .getThemeColor(),
          appBarTheme: AppBarTheme(color:
          BlocProvider
              .of<WeatherCubit>(context)
              .weatherModel == null ? Colors.blue : BlocProvider
              .of<WeatherCubit>(context)
              .weatherModel!
              .getThemeColor(),)
      ),
      home: HomeView(),
    );
  }
}
