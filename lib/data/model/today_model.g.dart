// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodayModel _$TodayModelFromJson(Map<String, dynamic> json) => TodayModel(
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: json['main'] == null
          ? null
          : Main.fromJson(json['main'] as Map<String, dynamic>),
      wind: json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      sys: json['sys'] == null
          ? null
          : Sys.fromJson(json['sys'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );
