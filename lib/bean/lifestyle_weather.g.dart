// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifestyle_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LifestyleWeather _$LifestyleWeatherFromJson(Map<String, dynamic> json) {
  return LifestyleWeather(
    (json['HeWeather6'] as List)
        ?.map((e) =>
            e == null ? null : HeWeather6.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LifestyleWeatherToJson(LifestyleWeather instance) =>
    <String, dynamic>{
      'HeWeather6': instance.heWeather6,
    };

HeWeather6 _$HeWeather6FromJson(Map<String, dynamic> json) {
  return HeWeather6(
    json['basic'] == null
        ? null
        : Basic.fromJson(json['basic'] as Map<String, dynamic>),
    json['update'] == null
        ? null
        : Update.fromJson(json['update'] as Map<String, dynamic>),
    json['status'] as String,
    (json['lifestyle'] as List)
        ?.map((e) =>
            e == null ? null : Lifestyle.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HeWeather6ToJson(HeWeather6 instance) =>
    <String, dynamic>{
      'basic': instance.basic,
      'update': instance.update,
      'status': instance.status,
      'lifestyle': instance.lifestyle,
    };

Basic _$BasicFromJson(Map<String, dynamic> json) {
  return Basic(
    json['cid'] as String,
    json['location'] as String,
    json['parent_city'] as String,
    json['admin_area'] as String,
    json['cnty'] as String,
    json['lat'] as String,
    json['lon'] as String,
    json['tz'] as String,
  );
}

Map<String, dynamic> _$BasicToJson(Basic instance) => <String, dynamic>{
      'cid': instance.cid,
      'location': instance.location,
      'parent_city': instance.parentCity,
      'admin_area': instance.adminArea,
      'cnty': instance.cnty,
      'lat': instance.lat,
      'lon': instance.lon,
      'tz': instance.tz,
    };

Update _$UpdateFromJson(Map<String, dynamic> json) {
  return Update(
    json['loc'] as String,
    json['utc'] as String,
  );
}

Map<String, dynamic> _$UpdateToJson(Update instance) => <String, dynamic>{
      'loc': instance.loc,
      'utc': instance.utc,
    };

Lifestyle _$LifestyleFromJson(Map<String, dynamic> json) {
  return Lifestyle(
    json['type'] as String,
    json['brf'] as String,
    json['txt'] as String,
  );
}

Map<String, dynamic> _$LifestyleToJson(Lifestyle instance) => <String, dynamic>{
      'type': instance.type,
      'brf': instance.brf,
      'txt': instance.txt,
    };
