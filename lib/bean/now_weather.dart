import 'package:json_annotation/json_annotation.dart';

part 'now_weather.g.dart';

@JsonSerializable()
class NowWeather extends Object {
  @JsonKey(name: 'HeWeather6')
  List<HeWeather6> heWeather6;

  NowWeather(
    this.heWeather6,
  );

  factory NowWeather.fromJson(Map<String, dynamic> srcJson) =>
      _$NowWeatherFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NowWeatherToJson(this);
}

@JsonSerializable()
class HeWeather6 extends Object {
  @JsonKey(name: 'basic')
  Basic basic;

  @JsonKey(name: 'update')
  Update update;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'now')
  Now now;

  HeWeather6(
    this.basic,
    this.update,
    this.status,
    this.now,
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
class Now extends Object {
  @JsonKey(name: 'cloud')
  String cloud;

  @JsonKey(name: 'cond_code')
  String condCode;

  @JsonKey(name: 'cond_txt')
  String condTxt;

  @JsonKey(name: 'fl')
  String fl;

  @JsonKey(name: 'hum')
  String hum;

  @JsonKey(name: 'pcpn')
  String pcpn;

  @JsonKey(name: 'pres')
  String pres;

  @JsonKey(name: 'tmp')
  String tmp;

  @JsonKey(name: 'vis')
  String vis;

  @JsonKey(name: 'wind_deg')
  String windDeg;

  @JsonKey(name: 'wind_dir')
  String windDir;

  @JsonKey(name: 'wind_sc')
  String windSc;

  @JsonKey(name: 'wind_spd')
  String windSpd;

  Now(
    this.cloud,
    this.condCode,
    this.condTxt,
    this.fl,
    this.hum,
    this.pcpn,
    this.pres,
    this.tmp,
    this.vis,
    this.windDeg,
    this.windDir,
    this.windSc,
    this.windSpd,
  );

  factory Now.fromJson(Map<String, dynamic> srcJson) => _$NowFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NowToJson(this);
}
