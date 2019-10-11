import 'package:json_annotation/json_annotation.dart';

part 'county.g.dart';

List<County> getCountyList(List<dynamic> list) {
  List<County> result = [];
  list.forEach((item) {
    result.add(County.fromJson(item));
  });
  return result;
}

@JsonSerializable()
class County extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'weather_id')
  String weatherId;

  County(
    this.id,
    this.name,
    this.weatherId,
  );

  factory County.fromJson(Map<String, dynamic> srcJson) =>
      _$CountyFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CountyToJson(this);
}
