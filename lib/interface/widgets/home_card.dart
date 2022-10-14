import 'package:flutter/material.dart';
import 'package:weatherapp/data/model/today_model.dart';

import '../../utils/widgets/temerature_card.dart';
import '../../data/model/models.dart';
import 'widget.dart';

class HomeCard extends StatelessWidget {
  final TodayModel? todayWeather;
  const HomeCard({
    Key? key,
    this.todayWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iconmodel = TodayIconModel();
    var condition = todayWeather!.weather![0].id;
    String weathericon = iconmodel.getIcon(condition);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconAndSearch(),
        const SizedBox(
          height: 40,
        ),
        CityAndDate(
          city: todayWeather!.name,
          country: todayWeather!.sys!.country,
        ),
        Temperature(
          temp: todayWeather!.main!.temp,
          weatherName: todayWeather!.weather![0].main,
          weatherIcon: weathericon,
        ),
        Column(
          children: [
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
              range: '${todayWeather!.wind!.deg}km/h',
            ),
            const SizedBox(
              height: 10,
            ),
            TemperatureCard(
              icon: 'assets/images/Rectangle 14.svg',
              text: 'Humidity',
              range: '${todayWeather!.main!.humidity}%',
            ),
            const SizedBox(
              height: 20,
            ),
          ],
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
    );
  }
}
