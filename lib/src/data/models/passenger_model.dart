import 'package:json_annotation/json_annotation.dart';

part 'passenger_model.g.dart';

@JsonSerializable()
class Passenger {
  int id;
  String name;
  String phone_number;
  String password;

  Passenger(
      {required this.id,
      required this.name,
      required this.phone_number,
      required this.password});

  factory Passenger.fromJson(Map<String, dynamic> json) =>
      _$PassengerFromJson(json);

  Map<String, dynamic> toJson() => _$PassengerToJson(this);
}
