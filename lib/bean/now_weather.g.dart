// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NowWeather _$NowWeatherFromJson(Map<String, dynamic> json) {
  return NowWeather(
    (json['HeWeather6'] as List)
        ?.map((e) =>
            e == null ? null : HeWeather6.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NowWeatherToJson(NowWeather instance) =>
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
    json['now'] == null
        ? null
        : Now.fromJson(json['now'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HeWeather6ToJson(HeWeather6 instance) =>
    <String, dynamic>{
      'basic': instance.basic,
      'update': instance.update,
      'status': instance.status,
      'now': instance.now,
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

Now _$NowFromJson(Map<String, dynamic> json) {
  return Now(
    json['cloud'] as String,
    json['cond_code'] as String,
    json['cond_txt'] as String,
    json['fl'] as String,
    json['hum'] as String,
    json['pcpn'] as String,
    json['pres'] as String,
    json['tmp'] as String,
    json['vis'] as String,
    json['wind_deg'] as String,
    json['wind_dir'] as String,
    json['wind_sc'] as String,
    json['wind_spd'] as String,
  );
}

Map<String, dynamic> _$NowToJson(Now instance) => <String, dynamic>{
      'cloud': instance.cloud,
      'cond_code': instance.condCode,
      'cond_txt': instance.condTxt,
      'fl': instance.fl,
      'hum': instance.hum,
      'pcpn': instance.pcpn,
      'pres': instance.pres,
      'tmp': instance.tmp,
      'vis': instance.vis,
      'wind_deg': instance.windDeg,
      'wind_dir': instance.windDir,
      'wind_sc': instance.windSc,
      'wind_spd': instance.windSpd,
    };
