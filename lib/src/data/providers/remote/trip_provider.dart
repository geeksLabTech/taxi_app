import 'package:taxi_app/src/data/models/trip_model.dart';
import 'package:taxi_app/src/services/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;

class TripProvider {
  final baseUrl = 'http://194.36.189.148:8000/trip';
  final apiService = GetIt.I<ApiService>();

  getAllTrips() async {
    var response = await apiService.request(
      method: Method.GET,
      url: baseUrl,
    );
    List<Trip> trips = [];
    for (Map<String, dynamic> trip in response) {
      trips.add(Trip.fromJson(trip));
    }
    return trips;
  }

  getAllTripsFiltered(String filter) async {
    var response = await apiService.request(method: Method.GET, url: baseUrl);
    List<Trip> trips = [];
    for (Map<String, dynamic> trip in response) {
      final trp = Trip.fromJson(trip);
      if (trp.status == filter) {
        trips.add(trp);
      }
    }
  }

  getTrip() {}

  createTrip(Trip trip) async {
    return await apiService.request(
      method: Method.POST,
      url: baseUrl,
      params: trip.toJson(),
    );
  }

  deleteTrip(String id) async {
    return await apiService.request(
      method: Method.DELETE,
      url: p.join(baseUrl, id),
    );
  }
}
