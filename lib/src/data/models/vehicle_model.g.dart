// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      name: json['name'] as String,
      color: json['color'] as String,
      licensePlate: json['licensePlate'] as String,
      model: json['model'] as String,
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
      'licensePlate': instance.licensePlate,
      'model': instance.model,
    };
