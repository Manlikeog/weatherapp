import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/model.dart';
import '../../data/repository/repository.dart';
import '../../logic/bloc/weather_bloc_bloc.dart';
import '../../utils/widgets/toast.dart';
import 'hourly_card.dart';

class HourlyView extends StatelessWidget {
  const HourlyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBlocBloc>(
      create: (context) =>
          WeatherBlocBloc(RepositoryProvider.of<WeatherRepository>(context))
            ..add(FetchLocation()),
      child: BlocConsumer<WeatherBlocBloc, WeatherBlocState>(
        listener: (context, state) {
          if (state is WeatherBlocInitial) {
            const Center(child: Text('Waiting'));
          }
        },
        builder: (context, state) {
          if (state is ErrorState) {
            return showToasterror(state.message);
          } else if (state is LoadedState) {
            return FutureBuilder<List<WeatherModel>>(
              future: state.repository,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<WeatherModel> weather = snapshot.data!;
                  return ListView.builder(
                    itemCount: 10,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HourlyCard(
                        weather: weather[index],
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.black,
                  ),
                );
              },
            );
          } else if (state is LoadingState) {
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
    );
  }
}
