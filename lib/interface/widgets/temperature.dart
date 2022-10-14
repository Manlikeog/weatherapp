import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  final double? temp;
  final String? weatherName;
  final String? weatherIcon;
  const Temperature({
    Key? key,
    this.temp,
    this.weatherName,
    this.weatherIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          weatherIcon!,
          height: 200,
        ),
        Column(
          children: [
            Text(
              '${temp!.toInt()}°',
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '$weatherName',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        )
      ],
    );
  }
}
