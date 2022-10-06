part of 'weather_bloc_bloc.dart';

abstract class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

class WeatherBlocInitial extends WeatherBlocState {}

class LoadingState extends WeatherBlocState {}

class LoadedState extends WeatherBlocState {
  final Future<List<WeatherModel>> repository;
  const LoadedState(this.repository);
}

class ErrorState extends WeatherBlocState {
  final String message;
  const ErrorState(this.message);
}
