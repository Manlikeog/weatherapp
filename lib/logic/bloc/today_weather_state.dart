part of 'today_weather_bloc.dart';

abstract class TodayWeatherState extends Equatable {
  const TodayWeatherState();

  @override
  List<Object> get props => [];
}

class TodayWeatherInitial extends TodayWeatherState {}

class TodayLoadingState extends TodayWeatherState {}

class TodayLoadedState extends TodayWeatherState {
  final Future<TodayModel> repository;
  const TodayLoadedState(this.repository);
}

class TodayErrorState extends TodayWeatherState {
  final String message;
  const TodayErrorState(this.message);
}
