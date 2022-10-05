mport 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_app/data/models/models.dart';
import 'package:news_app/interface/widgets/widgets.dart';

class ApiCall {
  var url;
  Map<String, String> headers;

  ApiCall({required this.url, required this.headers});

  Future getNewsData() async {
    try {
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      switch (response.statusCode) {
        case 200:
          Map<String, dynamic> responseDecode =
              jsonDecode(response.body.toString());
          List<dynamic> body = responseDecode['articles'];
          List<NewsModel> articles =
              body.map((dynamic item) => NewsModel.fromJson(item)).toList();
          return articles;
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