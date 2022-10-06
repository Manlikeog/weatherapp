import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherapp/data/model/model.dart';
import 'package:weatherapp/data/repository/repository.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  final WeatherRepository _weatherRepository;
  WeatherBlocBloc(this._weatherRepository) : super(WeatherBlocInitial()) {
    on<FetchLocation>(_mapEventToState);
  }

  _mapEventToState(
    FetchLocation event,
    Emitter emit,
  ) {
    emit(LoadingState());

    try {
      final repository = _weatherRepository.fetchLocationandWeather();
      emit(
        LoadedState(
          repository,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(
          e.toString(),
        ),
      );
    }
  }
}
