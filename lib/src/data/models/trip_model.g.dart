// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      date: json['date'] as String,
      time: json['time'] as String,
      distance: (json['distance'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      driverId: json['driverId'] as int,
      passengerId: json['passengerId'] as int,
      status: json['status'] as String,
      originId: json['originId'] as int,
      destinationId: json['destinationId'] as int,
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'date': instance.date,
      'time': instance.time,
      'distance': instance.distance,
      'price': instance.price,
      'driverId': instance.driverId,
      'passengerId': instance.passengerId,
      'status': instance.status,
      'originId': instance.originId,
      'destinationId': instance.destinationId,
    };
