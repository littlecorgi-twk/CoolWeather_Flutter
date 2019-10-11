// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastWeather _$ForecastWeatherFromJson(Map<String, dynamic> json) {
  return ForecastWeather(
    (json['HeWeather6'] as List)
        ?.map((e) =>
            e == null ? null : HeWeather6.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ForecastWeatherToJson(ForecastWeather instance) =>
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
    (json['daily_forecast'] as List)
        ?.map((e) => e == null
            ? null
            : Daily_forecast.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HeWeather6ToJson(HeWeather6 instance) =>
    <String, dynamic>{
      'basic': instance.basic,
      'update': instance.update,
      'status': instance.status,
      'daily_forecast': instance.dailyForecast,
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

Daily_forecast _$Daily_forecastFromJson(Map<String, dynamic> json) {
  return Daily_forecast(
    json['cond_code_d'] as String,
    json['cond_code_n'] as String,
    json['cond_txt_d'] as String,
    json['cond_txt_n'] as String,
    json['date'] as String,
    json['hum'] as String,
    json['mr'] as String,
    json['ms'] as String,
    json['pcpn'] as String,
    json['pop'] as String,
    json['pres'] as String,
    json['sr'] as String,
    json['ss'] as String,
    json['tmp_max'] as String,
    json['tmp_min'] as String,
    json['uv_index'] as String,
    json['vis'] as String,
    json['wind_deg'] as String,
    json['wind_dir'] as String,
    json['wind_sc'] as String,
    json['wind_spd'] as String,
  );
}

Map<String, dynamic> _$Daily_forecastToJson(Daily_forecast instance) =>
    <String, dynamic>{
      'cond_code_d': instance.condCodeD,
      'cond_code_n': instance.condCodeN,
      'cond_txt_d': instance.condTxtD,
      'cond_txt_n': instance.condTxtN,
      'date': instance.date,
      'hum': instance.hum,
      'mr': instance.mr,
      'ms': instance.ms,
      'pcpn': instance.pcpn,
      'pop': instance.pop,
      'pres': instance.pres,
      'sr': instance.sr,
      'ss': instance.ss,
      'tmp_max': instance.tmpMax,
      'tmp_min': instance.tmpMin,
      'uv_index': instance.uvIndex,
      'vis': instance.vis,
      'wind_deg': instance.windDeg,
      'wind_dir': instance.windDir,
      'wind_sc': instance.windSc,
      'wind_spd': instance.windSpd,
    };
