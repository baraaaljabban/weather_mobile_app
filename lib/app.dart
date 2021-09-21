import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/Service/injection_service.dart';
import 'features/weather/presentation/bloc/weather_bloc.dart';
import 'features/weather/presentation/pages/weather_page.dart';

class App extends StatefulWidget {
 const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (BuildContext context) => sl<WeatherBloc>(),
          child: const WeatherPage(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: const Center(child: Text("Weather")),
          ),
          body: Builder(
            builder: (builtContext) {
              return const WeatherPage();
            },
          ),
        ),
      ),
    );
  }
}
