import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable(createToJson: false)
class WeatherModel {
  WeatherModel({
    this.main,
    this.weather,
    this.dtTxt,
  });

  Main? main;
  List<Weather>? weather;
  DateTime? dtTxt;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
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
        id: json["id"] == null ? null : json["id"] as int,
      );
}
