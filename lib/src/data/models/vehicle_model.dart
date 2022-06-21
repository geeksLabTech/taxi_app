import 'package:json_annotation/json_annotation.dart';

part 'vehicle_model.g.dart';

@JsonSerializable()
class Vehicle {
  String name;
  String color;
  String licensePlate;
  String model;

  Vehicle({
    required this.name,
    required this.color,
    required this.licensePlate,
    required this.model,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}
