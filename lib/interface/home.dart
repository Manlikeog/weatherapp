import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherapp/data/model/today_model.dart';
import 'package:weatherapp/data/repository/current_weather.dart';

import 'package:weatherapp/logic/bloc/today_weather_bloc.dart';

import 'package:weatherapp/utils/widgets/toast.dart';

import 'widgets/widget.dart';

class Home extends StatelessWidget {
  TodayModel? lol;
  Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 70,
          left: 30,
          right: 30,
        ),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffFEE3BC),
              Color(0xffF39876),
            ],
          ),
        ),
        child: BlocProvider<TodayWeatherBloc>(
          create: (context) =>
              TodayWeatherBloc(RepositoryProvider.of<TodayWeather>(context))
                ..add(FetchTodayWeather()),
          child: BlocConsumer<TodayWeatherBloc, TodayWeatherState>(
            listener: (context, state) {
              if (state is TodayWeatherInitial) {
                const Center(child: Text('Waiting'));
              }
            },
            builder: (context, state) {
              if (state is TodayErrorState) {
                return showToasterror(state.message);
              } else if (state is TodayLoadedState) {
                return FutureBuilder<TodayModel>(
                  future: state.repository,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      TodayModel _todayWeather = snapshot.data!;
                      return HomeCard(
                        todayWeather: _todayWeather,
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.black,
                      ),
                    );
                  },
                );
              } else if (state is TodayLoadingState) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.black,
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
          ),
        ),
      ),
    );
  }
}
