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
          brightness: Brightness.light,
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            headline1: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            headline2: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            headline3: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            bodyText1: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            bodyText2: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            subtitle1: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            subtitle2: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            headline1: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            headline2: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            headline3: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            bodyText1: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            bodyText2: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            subtitle1: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            subtitle2: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
        ),
        themeMode: dayMode ? ThemeMode.dark : ThemeMode.light,
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
