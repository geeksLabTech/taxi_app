import 'package:json_annotation/json_annotation.dart';

part 'vehicle_model.g.dart';

@JsonSerializable()
class VehicleModel {
  String name;
  String color;
  String licensePlate;
  String model;

  VehicleModel({
    required this.name,
    required this.color,
    required this.licensePlate,
    required this.model,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);

}
