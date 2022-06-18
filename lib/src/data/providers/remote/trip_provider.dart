import 'package:taxi_app/src/models/trip.dart';
import 'package:taxi_app/src/services/api_service.dart';
import 'package:get_it/get_it.dart';

class TripProvider {
  final baseUrl = '/trip';
  final apiService = GetIt.I<ApiService>();

  getAllTrips() {
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

  getAllTripsFiltered(String filter) {
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

  getTrip() {}

  createTrip() {}

  deleteTrip() {}
}
