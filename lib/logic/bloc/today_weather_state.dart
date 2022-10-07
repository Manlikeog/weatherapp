part of 'today_weather_bloc.dart';

abstract class TodayWeatherState extends Equatable {
  const TodayWeatherState();

  @override
  List<Object> get props => [];
}

class TodayWeatherInitial extends TodayWeatherState {}

class LoadedState extends TodayWeatherState {
  final Future<List<TodayModel>> repository;
  const LoadedState(this.repository);
}

class ErrorState extends TodayWeatherState {
  final String message;
  const ErrorState(this.message);
}
