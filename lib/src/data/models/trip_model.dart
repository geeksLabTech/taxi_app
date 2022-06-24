import 'package:json_annotation/json_annotation.dart';

part 'trip_model.g.dart';

@JsonSerializable()
class Trip {
  int id;
  String date;
  String time;
  double distance;
  double price;
  int driver_id;
  int passenger_id;
  String status;
  int origin_id;
  int destination_id;

  Trip(
      {required this.id,
      required this.date,
      required this.time,
      required this.distance,
      required this.price,
      required this.driver_id,
      required this.passenger_id,
      required this.status,
      required this.origin_id,
      required this.destination_id});

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  Map<String, dynamic> toJson() => _$TripToJson(this);
}
