import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherapp/data/model/today_model.dart';

part 'today_weather_event.dart';
part 'today_weather_state.dart';

class TodayWeatherBloc extends Bloc<TodayWeatherEvent, TodayWeatherState> {
  TodayWeatherBloc() : super(TodayWeatherInitial()) {
    on<TodayWeatherEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
