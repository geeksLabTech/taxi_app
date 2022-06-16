class Trip {
  final String date;
  final String time;
  final double distance;
  final double price;
  final int driverId;
  final int passengerId;
  final String status;
  final int originId;
  final int destinationId;

  const Trip({
    required this.date,
    required this.time,
    required this.distance,
    required this.price,
    required this.driverId,
    required this.passengerId,
    required this.status,
    required this.originId,
    required this.destinationId,
  });
}
