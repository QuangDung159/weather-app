import 'package:equatable/equatable.dart';
import 'package:weather_app/models/weather.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherStateInitial extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class WeatherSateSuccess extends WeatherState {
  final Weather weather;

  WeatherSateSuccess({required this.weather});

  @override
  List<Object?> get props => [weather];
}

class WeatherStateFail extends WeatherState {}
