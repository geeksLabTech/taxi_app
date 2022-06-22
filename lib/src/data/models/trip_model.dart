import 'package:json_annotation/json_annotation.dart';

part 'trip_model.g.dart';

@JsonSerializable()
class Trip {
  int id;
  String date;
  String time;
  double distance;
  double price;
  int driverId;
  int passengerId;
  String status;
  int originId;
  int destinationId;

  Trip(
      {required this.id,
      required this.date,
      required this.time,
      required this.distance,
      required this.price,
      required this.driverId,
      required this.passengerId,
      required this.status,
      required this.originId,
      required this.destinationId});

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  Map<String, dynamic> toJson() => _$TripToJson(this);
}
