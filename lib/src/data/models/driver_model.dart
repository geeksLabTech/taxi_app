import 'package:json_annotation/json_annotation.dart';

part 'driver_model.g.dart';

@JsonSerializable()
class Driver {
  int id;
  String ci;
  String name;
  String phoneNumber;
  String password;

  Driver(
      {required this.id,
      required this.ci,
      required this.name,
      required this.phoneNumber,
      required this.password});

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);
}
