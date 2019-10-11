import 'package:json_annotation/json_annotation.dart';

part 'province.g.dart';

class ProvinceList {
  final List<Province> provinces;

  ProvinceList({this.provinces});

  factory ProvinceList.fromJson(List<dynamic> parsedJson) {
    List<Province> provinces = new List<Province>();
    provinces = parsedJson.map((i) => Province.fromJson(i)).toList();
    return new ProvinceList(provinces: provinces);
  }
}

@JsonSerializable()
class Province extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  Province(
    this.id,
    this.name,
  );

  factory Province.fromJson(Map<String, dynamic> srcJson) =>
      _$ProvinceFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}
