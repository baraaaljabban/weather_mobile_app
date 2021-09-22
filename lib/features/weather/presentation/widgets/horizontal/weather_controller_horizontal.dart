import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/domain/usecases/weather_by_city.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/widgets/horizontal/detailed_weather_controller.dart';
import 'package:weather/features/weather/presentation/widgets/horizontal/weather_days_list_controller.dart';

class WeatherControllerHorizontal extends StatefulWidget {
  const WeatherControllerHorizontal({Key? key}) : super(key: key);

  @override
  _WeatherControllerHorizontalState createState() => _WeatherControllerHorizontalState();
}

class _WeatherControllerHorizontalState extends State<WeatherControllerHorizontal> {
  final myController = TextEditingController();

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
        return Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Search(myController: myController),
              ),
            ),
            if (state is DetailedDayWeatherState)
              Expanded(flex: 10, child: DetailedWeatherController(consolidatedWeather: state.consolidatedWeather)),
            if (state is DetailedDayWeatherState) Expanded(flex: 5, child: WeatherDaysListController(list: state.list)),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  void dispatchVerifyEvent() {
    BlocProvider.of<WeatherBloc>(context).add(SearchWeatherByCityEvent(params: SearchWeatherByCityParams(query: myController.text)));
  }
}

class Search extends StatelessWidget {
  const Search({
    Key? key,
    required this.myController,
  }) : super(key: key);

  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      controller: myController,
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
        hintText: 'search your city',
      ),
      textInputAction: TextInputAction.done,
      onSubmitted: (value) => dispatchVerifyEvent(context),
    );
  }

  void dispatchVerifyEvent(BuildContext context) {
    BlocProvider.of<WeatherBloc>(context).add(SearchWeatherByCityEvent(params: SearchWeatherByCityParams(query: myController.text)));
  }
}
