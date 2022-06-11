// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PassengerModel _$PassengerModelFromJson(Map<String, dynamic> json) =>
    PassengerModel(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$PassengerModelToJson(PassengerModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
    };
