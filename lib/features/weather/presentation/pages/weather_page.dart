import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/common/snack_bar.dart';
import 'package:weather/features/weather/export_weather_feature.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    BlocProvider.of<WeatherBloc>(context).add(SearchWeatherByCityEvent(params: SearchWeatherByCityParams(query: 'london')));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is Loading) {
            SnackBarHelper.showLoadingSnackBar(context);
          } else if (state is Error) {
            SnackBarHelper.showErrorSnackBar(context, message: state.message);
          } else if (state is SearchResultState) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
          }
        },
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }
}
