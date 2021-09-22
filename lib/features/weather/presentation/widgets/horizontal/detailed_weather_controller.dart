import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';

class DetailedWeatherController extends StatefulWidget {
  final ConsolidatedWeather consolidatedWeather;
  const DetailedWeatherController({Key? key, required this.consolidatedWeather}) : super(key: key);

  @override
  _DetailedWeatherControllerState createState() => _DetailedWeatherControllerState();
}

class _DetailedWeatherControllerState extends State<DetailedWeatherController> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
      buildWhen: (previous, current) {
        if (current is DetailedDayWeatherState) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DetailedDayWeatherState) {
          return Column(
            children: [
              Text("${widget.consolidatedWeather.day}"),
              Text("${widget.consolidatedWeather.humidity}"),
              Text("${widget.consolidatedWeather.theTemp}"),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
