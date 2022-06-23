import 'package:json_annotation/json_annotation.dart';

part 'login_passenger_model.g.dart';

@JsonSerializable()
class LoginPassengerModel {
  String phone_number;
  String password;

  LoginPassengerModel({required this.phone_number, required this.password});

  factory LoginPassengerModel.fromJson(Map<String, dynamic> json) =>
      _$LoginPassengerModelFromJson(json);
    
  Map<String, dynamic> toJson() => _$LoginPassengerModelToJson(this);
}
