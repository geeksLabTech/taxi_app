import 'package:json_annotation/json_annotation.dart';

part 'place_model.g.dart';

@JsonSerializable()
class Place {
  String name;
  String address;
  double latitude;
  double longitude;

  Place({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}
