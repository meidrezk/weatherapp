import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/views/search_view.dart';
import '../cubits/weather_cubit/weather_cubit.dart';
import '../cubits/weather_cubit/weather_states.dart';
import '../widgets/failure_body.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/success_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchView()));
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
              title: const Text('Weather App'),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is WeatherFailureState) {
          return FailureBody();
        } else if (state is WeatherSuccessState) {
          return SuccessBody();
        } else {
          return NoWeatherBody();
        }
      },
    );
  }
}
