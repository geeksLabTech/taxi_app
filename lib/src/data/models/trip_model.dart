
import 'package:json_annotation/json_annotation.dart';

part 'trip_model.g.dart';

@JsonSerializable()
class TripModel {
  String date;
  String time;
  double distance;
  double price;
  int driverId;
  int passengerId;
  String status;
  int originId;
  int destinationId;

  TripModel(
      {required this.date,
      required this.time,
      required this.distance,
      required this.price,
      required this.driverId,
      required this.passengerId,
      required this.status,
      required this.originId,
      required this.destinationId});

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);

  Map<String, dynamic> toJson() => _$TripModelToJson(this);
}
