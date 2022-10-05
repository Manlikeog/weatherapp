import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/widgets/temerature_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
            Container(
              height: 110,
              width: 70,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xafffffff),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  const Text(
                    'now',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(
                    'assets/images/cloudy.svg',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '19',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
