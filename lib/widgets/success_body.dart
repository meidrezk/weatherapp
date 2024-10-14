import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/weather_cubit/weather_cubit.dart';
import '../views/search_view.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
        BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor(),
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor(),
              BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor()[300]!,
              BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor()
              [100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Text(
              BlocProvider.of<WeatherCubit>(context).weatherModel!
                  .
              cityName,

              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'updated at : '
                  '${
                  BlocProvider.of<WeatherCubit>(context).weatherModel!
                      .date.hour.toString()}:${
                  BlocProvider.of<WeatherCubit>(context).weatherModel!
                      .date.minute.toString()}',
              style: const TextStyle(fontSize: 22),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                    BlocProvider.of<WeatherCubit>(context).weatherModel!
                        .getImage()),
                Text(
                  BlocProvider.of<WeatherCubit>(context).weatherModel!
                      .temp.toInt().toString(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text(
                        'maxTemp :${
                            BlocProvider.of<WeatherCubit>(context).weatherModel!
                                .maxTemp.toInt()}'),
                    Text(
                        'minTemp : ${
                            BlocProvider.of<WeatherCubit>(context).weatherModel!
                                .minTemp.toInt()}'),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              BlocProvider.of<WeatherCubit>(context).weatherModel!
                  .weatherStateName,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}
