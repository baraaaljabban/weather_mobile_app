# Weather App with MVVM Architecture

This Application will let you get the weather of a city name enterd by user and uses 2 APIs for that.

## FEATURES
1. User Can Search for some for City Weather by typing the city name in the seach box and will get a list of weather days   
2. there will be 2 types of widgets one is the list of the days and the other is the detailed weather of some day
3. user can refresh and get new result by doing pull to refresh action
4. it supports Landscape and Portrait Mode in 2 different designs
5. user can change the Temperature measureing unit from celsius to Fahrenheit and the other way around 
6. light and dark theme is applied
7. validation for errors are applied as well on both sides (user input/server side)




## Development Environment /Tools/Languages/Technics
1. Dart 
2. MVVM
3. http: ^0.13.1
4. get_it: ^7.1.3 // as service locater (Dependency Injection)
5. flutter_bloc: ^7.0.02
6. dartz: ^0.10.0-nullsafety.2
7. connectivity: ^3.0.3
8. data_connection_checker_tv
9. mockito: ^5.0.15
10. pull_to_refresh: 2.0.0
11. intl: 0.17.0
12. weather_icons: 3.0.0-nullsafety.0


## Getting Started
```bash
git clone https://github.com/baraaaljabban/weather_mobile_app
cd weather_mobile_app
flutter run
```
```bash
run tests by using 
flutter test
```

## Best Practise
1. Implemente Seperation of Concerns by applying MVVM as clean architecture
2. Implement Dependency Injection for providing objects to required class by applying GET_IT library 
3. Implement BLOC pattern in order to sperate busnis logic and user interaction and manage the state of the application 
4. Implement UI/UX to show the user in a user friendly way the current status 
5. the code is very commented so anyone can read it easly
6. and others :)


## Improvements
1. more abstraction for some UI parts would be more better to use it in other Places.
2. test cases can be more coverage.  

it's open source. enjoy :)

//please refer to ( https://www.metaweather.com/api/ ) for more info


