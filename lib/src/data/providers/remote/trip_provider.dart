import 'package:dio/dio.dart';
import 'package:taxi_app/src/data/models/trip_model.dart';
import 'package:taxi_app/src/services/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;

class TripProvider {
  final baseUrl = '/trip/';
  final apiService = GetIt.I<ApiService>();

  Future<List<Trip>> getAllTrips() async {
    Response response = await apiService.request(
      method: Method.GET,
      url: baseUrl,
    );
    List<Trip> trips = [];
    for (Map<String, dynamic> trip in response.data) {
      trips.add(Trip.fromJson(trip));
    }
    return trips;
  }

  Future<List<Trip>> getAllTripsFiltered(String filter) async {
    Response response =
        await apiService.request(method: Method.GET, url: baseUrl);
    List<Trip> trips = [];
    for (Map<String, dynamic> trip in response.data) {
      if (trip['status'] == filter) {
        trips.add(Trip.fromJson(trip));
      }

    }
    return trips;
  }

  getTrip() {}

  Future<Trip> createTrip(Trip trip) async {
    final serializedTrip = trip.toJson();
    final Response response = await apiService.request(
      method: Method.POST,
      url: baseUrl,
      params: serializedTrip,
    );
    return Trip.fromJson(response.data);
    
  }

  Future<Trip> deleteTrip(String id) async {
    final Response response =
        await apiService.request(method: Method.DELETE, url: '$baseUrl/$id');
    return Trip.fromJson(response.data);
  }
}
