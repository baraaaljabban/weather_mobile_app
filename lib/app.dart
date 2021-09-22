import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/Service/injection_service.dart';
import 'features/weather/domain/usecases/weather_by_city.dart';
import 'features/weather/presentation/bloc/weather_bloc.dart';
import 'features/weather/presentation/pages/weather_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool dayMode = false;
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
        theme: ThemeData(
          brightness: dayMode ? Brightness.dark : Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: dayMode ? Brightness.dark : Brightness.light,
        ),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            actions: [
              
              IconButton(
                icon: Icon(dayMode ? Icons.nightlight : Icons.light_mode),
                onPressed: () {
                  setState(() {
                    dayMode = !dayMode;
                  });
                },
              ),
            ],
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
