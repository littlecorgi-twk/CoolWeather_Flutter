import 'package:json_annotation/json_annotation.dart';

part 'lifestyle_weather.g.dart';

@JsonSerializable()
class LifestyleWeather extends Object {
  @JsonKey(name: 'HeWeather6')
  List<HeWeather6> heWeather6;

  LifestyleWeather(
    this.heWeather6,
  );

  factory LifestyleWeather.fromJson(Map<String, dynamic> srcJson) =>
      _$LifestyleWeatherFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LifestyleWeatherToJson(this);
}

@JsonSerializable()
class HeWeather6 extends Object {
  @JsonKey(name: 'basic')
  Basic basic;

  @JsonKey(name: 'update')
  Update update;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'lifestyle')
  List<Lifestyle> lifestyle;

  HeWeather6(
    this.basic,
    this.update,
    this.status,
    this.lifestyle,
  );

  factory HeWeather6.fromJson(Map<String, dynamic> srcJson) =>
      _$HeWeather6FromJson(srcJson);

  Map<String, dynamic> toJson() => _$HeWeather6ToJson(this);
}

@JsonSerializable()
class Basic extends Object {
  @JsonKey(name: 'cid')
  String cid;

  @JsonKey(name: 'location')
  String location;

  @JsonKey(name: 'parent_city')
  String parentCity;

  @JsonKey(name: 'admin_area')
  String adminArea;

  @JsonKey(name: 'cnty')
  String cnty;

  @JsonKey(name: 'lat')
  String lat;

  @JsonKey(name: 'lon')
  String lon;

  @JsonKey(name: 'tz')
  String tz;

  Basic(
    this.cid,
    this.location,
    this.parentCity,
    this.adminArea,
    this.cnty,
    this.lat,
    this.lon,
    this.tz,
  );

  factory Basic.fromJson(Map<String, dynamic> srcJson) =>
      _$BasicFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BasicToJson(this);
}

@JsonSerializable()
class Update extends Object {
  @JsonKey(name: 'loc')
  String loc;

  @JsonKey(name: 'utc')
  String utc;

  Update(
    this.loc,
    this.utc,
  );

  factory Update.fromJson(Map<String, dynamic> srcJson) =>
      _$UpdateFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UpdateToJson(this);
}

@JsonSerializable()
class Lifestyle extends Object {
  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'brf')
  String brf;

  @JsonKey(name: 'txt')
  String txt;

  Lifestyle(
    this.type,
    this.brf,
    this.txt,
  );

  factory Lifestyle.fromJson(Map<String, dynamic> srcJson) =>
      _$LifestyleFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LifestyleToJson(this);
}
