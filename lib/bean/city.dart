import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

class CityList {
  final List<City> cities;

  CityList({this.cities});

  factory CityList.fromJson(List<dynamic> parsedJson) {
    List<City> cities = new List<City>();
    cities = parsedJson.map((i) => City.fromJson(i)).toList();
    return new CityList(cities: cities);
  }
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
