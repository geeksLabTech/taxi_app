import 'package:taxi_app/src/models/trip.dart';

getHistory(String filter) {
  return [
    const Trip(
      date: '2020-01-01',
      time: '12:00',
      distance: 10.0,
      price: 10.0,
      driverId: 1,
      passengerId: 1,
      status: 'completed',
      originId: 1,
      destinationId: 1,
    ),
    const Trip(
      date: '2020-01-01',
      time: '12:30',
      distance: 10.0,
      price: 10.0,
      driverId: 2,
      passengerId: 2,
      status: 'completed',
      originId: 2,
      destinationId: 3,
    ),
  ];
}
