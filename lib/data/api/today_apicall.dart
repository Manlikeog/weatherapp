import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weatherapp/data/model/model.dart';
import 'package:weatherapp/data/model/today_model.dart';
import 'package:weatherapp/utils/widgets/toast.dart';

class TodayApiCall {
  var url;

  TodayApiCall({
    required this.url,
  });

  Future getWeather() async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      switch (response.statusCode) {
        case 200:
          Map<String, dynamic> responseDecode = jsonDecode(response.body);

          TodayModel weather = TodayModel.fromJson(responseDecode);
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
