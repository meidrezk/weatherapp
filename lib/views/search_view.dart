
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/weather_cubit/weather_cubit.dart';



class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search city"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
            onSubmitted: (value) async {
               
                  BlocProvider.of<WeatherCubit>(context)
              .getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search_outlined),
                contentPadding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                hintText: "Enter City Name",
                label: const Text("Search"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16)))),
      ),
    );
  }
}
