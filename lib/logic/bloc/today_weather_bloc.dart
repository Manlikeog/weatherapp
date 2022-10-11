import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherapp/data/model/today_model.dart';
import 'package:weatherapp/data/repository/current_weather.dart';

part 'today_weather_event.dart';
part 'today_weather_state.dart';

class TodayWeatherBloc extends Bloc<TodayWeatherEvent, TodayWeatherState> {
  final TodayWeather _todayRepository;
  TodayWeatherBloc(this._todayRepository) : super(TodayWeatherInitial()) {
    on<FetchTodayWeather>(_mapEventToState);
  }

  _mapEventToState(
    FetchTodayWeather event,
    Emitter emit,
  ) {
    emit(TodayLoadingState());

    try {
      final repository = _todayRepository.fetchLocationandWeather();
      emit(
        TodayLoadedState(
          repository,
        ),
      );
    } catch (e) {
      emit(
        TodayErrorState(
          e.toString(),
        ),
      );
    }
  }
}
