import 'package:json_annotation/json_annotation.dart';

part 'province.g.dart';

List<Province> getProvinceList(List<dynamic> list) {
  List<Province> result = [];
  list.forEach((item) {
    result.add(Province.fromJson(item));
  });
  return result;
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
