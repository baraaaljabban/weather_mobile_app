import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/widgets/horizontal/detailed_weather_controller.dart';
import 'package:weather/features/weather/presentation/widgets/vertical/vertical_weather_days_list_controller.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherControllerVertical extends StatefulWidget {
  const WeatherControllerVertical({Key? key}) : super(key: key);

  @override
  _WeatherControllerVerticalState createState() => _WeatherControllerVerticalState();
}

class _WeatherControllerVerticalState extends State<WeatherControllerVertical> {
  bool isSwitched = false;

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
          return Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: VerticalWeatherDaysListController(
                        list: state.list,
                      ),
                    ),
                    // Expanded(
                    //   flex: 1,
                    //   child: SwitchListTile(
                    //     secondary: BoxedIcon(
                    //       isSwitched ? WeatherIcons.celsius : WeatherIcons.fahrenheit,
                    //     ),
                    //     value: isSwitched,
                    //     title: const Text('Switch Temp'),
                    //     onChanged: (value) {
                    //       BlocProvider.of<WeatherBloc>(context).add(ChangeTempEvent());
                    //       setState(() {
                    //         isSwitched = value;
                    //       });
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Day(
                        day: state.consolidatedWeather.day,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: MyNetworkImage(
                        weatherStateAbbr: state.consolidatedWeather.weatherStateAbbr,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TheTemp(
                        isTempInCelsius: state.consolidatedWeather.isTempInCelsius,
                        theTemp: state.consolidatedWeather.theTemp,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Humidity: ${state.consolidatedWeather.humidity}%",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Pressure: ${state.consolidatedWeather.airPressure}hpa",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Wind: ${state.consolidatedWeather.windSpeed}km/h",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else
          return Container();
      },
    );
  }
}
