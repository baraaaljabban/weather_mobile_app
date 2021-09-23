part of 'package:weather/core/Service/injection_service.dart';

void weatherDependencyIncection() {
  sl.registerFactory<WeatherRemoteDataSrouce>(() => WeatherRemoteDataSrouceImpl(client: sl()));

  sl.registerFactory<WeatherRepository>(
    () => WeatherRepositoryImpl(
      remoteDataSrouce: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerFactory(() => SearchWeatherByCity(repository: sl()));

  sl.registerFactory(
    () => WeatherBloc(
      usecase: sl(),
    ),
  );
}
