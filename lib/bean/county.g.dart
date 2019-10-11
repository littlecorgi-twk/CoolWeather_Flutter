// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'county.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

County _$CountyFromJson(Map<String, dynamic> json) {
  return County(
    json['id'] as int,
    json['name'] as String,
    json['weather_id'] as String,
  );
}

Map<String, dynamic> _$CountyToJson(County instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weather_id': instance.weatherId,
    };
