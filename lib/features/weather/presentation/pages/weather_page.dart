import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weather/features/common/snack_bar.dart';
import 'package:weather/features/weather/export_weather_feature.dart';
import 'package:weather/features/weather/presentation/widgets/horizontal/weather_controller_horizontal.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is Loading) {
            SnackBarHelper.showLoadingSnackBar(context);
          } else if (state is Error) {
            SnackBarHelper.showErrorSnackBar(context, message: state.message);
          } else {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
          }
        },
        builder: (context, state) {
          return SmartRefresher(
            controller: _refreshController,
            onRefresh: () {
              BlocProvider.of<WeatherBloc>(context).add(SearchWeatherByCityEvent());
              _refreshController.refreshCompleted();
            },
            child: OrientationBuilder(
              builder: (context, orientation) {
                return orientation == Orientation.landscape ? const WeatherControllerHorizontal() : const WeatherControllerHorizontal();
              },
            ),
          );
        },
      ),
    );
  }
}
