import 'package:json_annotation/json_annotation.dart';


part 'passenger_model.g.dart';


@JsonSerializable()
class PassengerModel {
  String name;
  String phoneNumber;
  String password;

  PassengerModel(
      {required this.name, required this.phoneNumber, required this.password});

  factory PassengerModel.fromJson(Map<String, dynamic> json) =>
      _$PassengerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PassengerModelToJson(this);
}
