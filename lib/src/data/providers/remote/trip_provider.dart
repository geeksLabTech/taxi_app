import 'package:taxi_app/src/services/api_service.dart';
import 'package:get_it/get_it.dart';

class TripProvider {
  final baseUrl = '/trip';
  final apiService = GetIt.I<ApiService>();

  getAllTrips() {}

  getTrip() {}

  createTrip() {}

  deleteTrip() {}
}
