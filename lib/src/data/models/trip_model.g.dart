// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      id: json['id'] as int,
      date: json['date'] as String,
      time: json['time'] as String,
      distance: (json['distance'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      driver_id: json['driver_id'] as int,
      passenger_id: json['passenger_id'] as int,
      status: json['status'] as String,
      origin_id: json['origin_id'] as int,
      destination_id: json['destination_id'] as int,
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'time': instance.time,
      'distance': instance.distance,
      'price': instance.price,
      'driver_id': instance.driver_id,
      'passenger_id': instance.passenger_id,
      'status': instance.status,
      'origin_id': instance.origin_id,
      'destination_id': instance.destination_id,
    };
