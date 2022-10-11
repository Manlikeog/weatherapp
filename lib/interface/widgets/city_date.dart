import 'package:flutter/material.dart';

class CityAndDate extends StatelessWidget {
  final String? city;
  final String? country;
  const CityAndDate({Key? key, this.city, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$city\n$country',
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
      ],
    );
  }
}
