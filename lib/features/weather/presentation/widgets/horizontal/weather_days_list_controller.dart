import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';
import 'package:weather/features/weather/export_weather_feature.dart';

class WeatherDaysListController extends StatelessWidget {
  final List<ConsolidatedWeather> list;
  const WeatherDaysListController({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<WeatherBloc>(context).add(SelectDayToShowWeatherDetails(indexOfDay: index));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Column(
                children: [
                  Text(list[index].applicableDate),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
