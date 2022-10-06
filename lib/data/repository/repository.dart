import 'package:flutter/foundation.dart';
import 'package:weatherapp/data/api/apicall.dart';
import 'package:weatherapp/data/api/location.dart';

import 'package:weatherapp/data/model/model.dart';

class WeatherRepository {
  double? lat;
  double? long;
  Future<List<WeatherModel>> fetchLocationandWeather() async {
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
        "https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=8a15ac7ec71b09edaf840980a56dcf97&units=metric";
    ApiCall category = ApiCall(
      url: url,
    );
    var categoryData = await category.getWeather();
    return categoryData;
  }
}
