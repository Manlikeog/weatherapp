import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/model/models.dart';

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
