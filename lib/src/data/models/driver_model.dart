import 'package:json_annotation/json_annotation.dart';

part 'driver_model.g.dart';

@JsonSerializable()
class DriverModel {
  String ci;
  String name;
  String phoneNumber;
  String password;

  DriverModel(
      {required this.ci,
      required this.name,
      required this.phoneNumber,
      required this.password});

  factory DriverModel.fromJson(Map<String, dynamic> json) => _$DriverModelFromJson(json);

  Map<String, dynamic> toJson() => _$DriverModelToJson(this);
}
