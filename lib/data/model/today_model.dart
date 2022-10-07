import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'today_model.g.dart';

@JsonSerializable(createToJson: false)
class TodayModel {
  TodayModel({
    this.weather,
    this.main,
    this.wind,
    this.sys,
    this.name,
  });

  List<Weather>? weather;
  Main? main;
  Wind? wind;
  Sys? sys;
  String? name;

  factory TodayModel.fromJson(Map<String, dynamic> json) =>
      _$TodayModelFromJson(json);
}

class Main {
  Main({
    this.temp,
    this.humidity,
  });

  double? temp;
  int? humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        humidity: json["humidity"],
      );
}

class Sys {
  Sys({
    this.country,
  });

  String? country;
  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        country: json["country"],
      );
}

class Weather {
  Weather({
    this.id,
    this.main,
  });

  int? id;
  String? main;
  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
      );
}

class Wind {
  Wind({
    this.deg,
  });

  int? deg;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        deg: json["deg"],
      );
}
