part of 'today_weather_bloc.dart';

abstract class TodayWeatherEvent extends Equatable {
  const TodayWeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchTodayWeather extends TodayWeatherEvent {}
