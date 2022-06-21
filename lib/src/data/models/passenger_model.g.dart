// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Passenger _$PassengerFromJson(Map<String, dynamic> json) => Passenger(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$PassengerToJson(Passenger instance) => <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
    };
