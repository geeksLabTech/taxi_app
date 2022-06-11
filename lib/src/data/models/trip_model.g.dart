// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripModel _$TripModelFromJson(Map<String, dynamic> json) => TripModel(
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

Map<String, dynamic> _$TripModelToJson(TripModel instance) => <String, dynamic>{
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
