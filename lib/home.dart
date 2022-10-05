import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 70, left: 30, right: 30),
        width: double.infinity,
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
            SizedBox(
              height: 40,
            ),
            Text(
              'Stockholm,\nSweden',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 35,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Tue, jun 30',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Color(0xff9A938C)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/cludy.png',
                  height: 200,
                ),
                Column(
                  children: [
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
            SizedBox(
              height: 10,
            ),
            TemperatureCard(
              icon: 'assets/images/umbrella.svg',
              text: 'Rainfall',
              range: '3cm',
            ),
            SizedBox(
              height: 10,
            ),
            TemperatureCard(
              icon: 'assets/images/wind.svg',
              text: 'Wind',
              range: '19km/h',
            ),
            SizedBox(
              height: 10,
            ),
            TemperatureCard(
              icon: 'assets/images/Rectangle 14.svg',
              text: 'Humidity',
              range: '64%',
            )
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffFEE3BC),
              Color(0xffF39876),
            ],
          ),
        ),
      ),
    );
  }
}

class TemperatureCard extends StatelessWidget {
  String text;
  String range;
  String icon;
  TemperatureCard(
      {Key? key, required this.text, required this.range, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 90,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 55,
                width: 55,
                child: SvgPicture.asset(
                  icon,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xffffffff),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          Text(
            range,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0x3fffffff),
      ),
    );
  }
}
