import 'package:flutter/material.dart';

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

class Welcome {
  Welcome({
    this.list,
    this.city,
  });

  List<ListElement>? list;
  City? city;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
        city: City.fromJson(json["city"]),
      );
}

class City {
  City({
    this.name,
    this.country,
  });

  String? name;
  String? country;

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
        country: json["country"],
      );
}

class ListElement {
  ListElement({
    this.main,
    this.weather,
    this.dtTxt,
  });

  Main? main;
  List<Weather>? weather;
  DateTime? dtTxt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        main: Main.fromJson(json["main"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        dtTxt: DateTime.parse(json["dt_txt"]),
      );
}

class Main {
  Main({
    this.temp,
  });

  double? temp;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
      );
}

class Weather {
  Weather({
    this.id,
  });

  int? id;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
      );
}
