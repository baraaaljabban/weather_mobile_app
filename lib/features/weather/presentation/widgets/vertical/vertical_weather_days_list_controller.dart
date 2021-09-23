import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/widgets/horizontal/detailed_weather_controller.dart';

class VerticalWeatherDaysListController extends StatelessWidget {
  final List<ConsolidatedWeather> list;

  const VerticalWeatherDaysListController({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            BlocProvider.of<WeatherBloc>(context).add(SelectDayToShowWeatherDetails(indexOfDay: index));
          },
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
                  height: MediaQuery.of(context).size.height * 0.1,
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
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
    );
  }
}
