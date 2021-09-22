import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/widgets/horizontal/detailed_weather_controller.dart';
import 'package:weather/features/weather/presentation/widgets/horizontal/weather_days_list_controller.dart';

class WeatherControllerHorizontal extends StatefulWidget {
  const WeatherControllerHorizontal({Key? key}) : super(key: key);

  @override
  _WeatherControllerHorizontalState createState() => _WeatherControllerHorizontalState();
}

class _WeatherControllerHorizontalState extends State<WeatherControllerHorizontal> {
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
              Expanded(flex: 5, child: DetailedWeatherController(consolidatedWeather: state.consolidatedWeather)),
              Expanded(flex: 2, child: WeatherDaysListController(list: state.list)),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
