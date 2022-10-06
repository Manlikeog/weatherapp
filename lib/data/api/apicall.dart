import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weatherapp/data/model/model.dart';
import 'package:weatherapp/utils/widgets/toast.dart';

class ApiCall {
  var url;

  ApiCall({
    required this.url,
  });

  Future getWeather() async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      switch (response.statusCode) {
        case 200:
          Map<String, dynamic> responseDecode =
              jsonDecode(response.body.toString());
          List<dynamic> body = responseDecode["list"];
          List<WeatherModel> weather =
              body.map((dynamic item) => WeatherModel.fromJson(item)).toList();
          return weather;
        case 400:
          throw showToasterror("The request to the server is unacceptable");
        case 403:
          throw showToasterror('lol');
        case 500:
          throw showToasterror("Something went wrong with the client server");
        default:
          return showToasterror(
              'Error while communciating with server. Error code ${response.statusCode}');
      }
    } on SocketException {
      throw showToasterror('No Internet Connection');
    }
  }
}
