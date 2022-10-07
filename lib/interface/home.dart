import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'package:weatherapp/data/model/icon_model.dart';
import 'package:weatherapp/data/model/model.dart';
import 'package:weatherapp/data/repository/repository.dart';
import 'package:weatherapp/logic/bloc/weather_bloc_bloc.dart';
import 'package:weatherapp/utils/widgets/toast.dart';

import '../utils/widgets/temerature_card.dart';

class Home extends StatelessWidget {
  const Home({
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/images/icon.svg',
                  height: 30,
                ),
                SvgPicture.asset(
                  'assets/images/Vector.svg',
                  height: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Stockholm,\nSweden',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 35,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Tue, jun 30',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Color(
                  0xff9A938C,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/cludy.png',
                  height: 200,
                ),
                Column(
                  children: const [
                    Text(
                      '19',
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Rainy',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )
              ],
            ),
            TemperatureCard(
              icon: 'assets/images/umbrella.svg',
              text: 'RainFall',
              range: '3cm',
            ),
            const SizedBox(
              height: 10,
            ),
            TemperatureCard(
              icon: 'assets/images/wind.svg',
              text: 'Wind',
              range: '19km/h',
            ),
            const SizedBox(
              height: 10,
            ),
            TemperatureCard(
              icon: 'assets/images/Rectangle 14.svg',
              text: 'Humidity',
              range: '64%',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Next 7 days>',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: const HourlyView())
          ],
        ),
      ),
    );
  }
}

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
                return const SizedBox.shrink();
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

class HourlyCard extends StatelessWidget {
  final WeatherModel? weather;

  const HourlyCard({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iconmodel = IconModel();
    var condition = weather!.weather![0].id;
    var strDate = weather!.dtTxt;
    DateFormat dateFormat = DateFormat('h:mm');
    String stringFormat = dateFormat.format(strDate as DateTime);
    String weathericon = iconmodel.getIcon(condition);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Container(
        height: 110,
        width: 70,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0x4fffffff),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Text(
              stringFormat,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Color(0xff9C9EAA)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "$weathericon ",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${weather!.main!.temp!.toInt()} °',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
