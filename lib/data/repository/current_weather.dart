import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/data/api/location.dart';
import 'package:weatherapp/data/api/today_apicall.dart';
import 'package:weatherapp/data/model/today_model.dart';

class TodayWeather {
  double? lat;
  double? long;
  Future<TodayModel> fetchLocationandWeather() async {
    Location location = Location();
    await location.getUserLocation();
    lat = location.lat;
    long = location.long;
    if (kDebugMode) {
      print(location.lat);
    }
    if (kDebugMode) {
      print(location.long);
    }
    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=00487c361e6542bb23d52913eb9bf31c&units=metric";
    TodayApiCall category = TodayApiCall(
      url: url,
    );
    var categoryData = await category.getWeather();
    return categoryData;
  }
}
