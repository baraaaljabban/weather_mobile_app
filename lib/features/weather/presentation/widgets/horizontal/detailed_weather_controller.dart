import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/AppStrings/server_strings.dart';
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
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Day(day: widget.consolidatedWeather.day),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    widget.consolidatedWeather.weatherStateName,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Center(
                    child: MyNetworkImage(
                      weatherStateAbbr: widget.consolidatedWeather.weatherStateAbbr,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: TheTemp(
                      theTemp: widget.consolidatedWeather.theTemp,
                      isTempInCelsius: widget.consolidatedWeather.isTempInCelsius,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Humidity: ${widget.consolidatedWeather.humidity}%",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Pressure: ${widget.consolidatedWeather.airPressure}hpa",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Wind: ${widget.consolidatedWeather.windSpeed}km/h",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class TheTemp extends StatelessWidget {
  const TheTemp({
    Key? key,
    required this.isTempInCelsius,
    required this.theTemp,
  }) : super(key: key);

  final bool isTempInCelsius;
  final int theTemp;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.headline3,
        children: <TextSpan>[
          TextSpan(
            text: "$theTemp",
            style: Theme.of(context).textTheme.headline3,
          ),
          TextSpan(
            text: isTempInCelsius ? "\u2103" : "\u2109",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}

class Day extends StatelessWidget {
  const Day({
    Key? key,
    required this.day,
  }) : super(key: key);

  final String day;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        day,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({
    Key? key,
    required this.weatherStateAbbr,
    this.width,
    this.height,
  }) : super(key: key);
  final String weatherStateAbbr;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      IMAGE_URL + weatherStateAbbr + '.png',
      alignment: Alignment.center,
      fit: BoxFit.contain,
      width: width,
      height: height,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
