import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

List<City> getCityList(List<dynamic> list) {
  List<City> result = [];
  list.forEach((item) {
    result.add(City.fromJson(item));
  });
  return result;
}

@JsonSerializable()
class City extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  City(
    this.id,
    this.name,
  );

  factory City.fromJson(Map<String, dynamic> srcJson) =>
      _$CityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
