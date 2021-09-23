import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:weather/core/Network/http_client.dart';
import 'package:weather/core/Network/network_info.dart';
import 'package:weather/features/weather/export_weather_feature.dart';
part 'package:weather/core/Service/weather.dart';
final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => DataConnectionChecker());
  sl.registerFactory(() => Connectivity());

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
        connectivity: sl(),
        dataConnectionChecker: sl(),
      ));
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => HttpHelper());
   weatherDependencyIncection();
}
