import 'package:json_annotation/json_annotation.dart';

part 'passenger_model.g.dart';

@JsonSerializable()
class Passenger {
  int id;
  String name;
  String phoneNumber;
  String password;

  Passenger(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.password});

  factory Passenger.fromJson(Map<String, dynamic> json) =>
      _$PassengerFromJson(json);

  Map<String, dynamic> toJson() => _$PassengerToJson(this);
}
