import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';
import 'package:weather/features/weather/export_weather_feature.dart';
import 'package:weather/features/weather/presentation/widgets/horizontal/detailed_weather_controller.dart';

class WeatherDaysListController extends StatelessWidget {
  final List<ConsolidatedWeather> list;
  const WeatherDaysListController({Key? key, required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            BlocProvider.of<WeatherBloc>(context).add(SelectDayToShowWeatherDetails(indexOfDay: index));
          },
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(child: Text(list[index].day.substring(0, 3))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyNetworkImage(
                    weatherStateAbbr: list[index].weatherStateAbbr,
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText2,
                      children: <TextSpan>[
                        TextSpan(text: "${list[index].minTemp}"),
                        TextSpan(
                          text: list[index].isTempInCelsius ? "\u2103" : "\u2109",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const TextSpan(text: " / "),
                        TextSpan(text: "${list[index].maxTemp}"),
                        TextSpan(
                          text: list[index].isTempInCelsius ? "\u2103" : "\u2109",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
