import 'dart:convert';

import 'package:taxi_app/src/models/place.dart';
import 'package:taxi_app/src/services/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class PlaceProvider {
  final String baseUrl = "/places";
  final apiService = GetIt.I<ApiService>();

  Future<List<Place>> getAllPlaces() async {
    String uri = 'http://194.36.189.148:8000/place/';
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      final places = List<Place>.from(l.map((model) {
        return Place(
            address: model['address'],
            name: model['name'],
            latitude: model['latitude'],
            longitude: model['longitude']);
      }));
      return places;
    }

    throw Exception('Failed to load data');
  }

  getPlace(int id) async {
    String uri = 'http://194.36.189.148:8000/place/' + id.toString();
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return Place.fromJson(json.decode(response.body));
    }
    throw Exception('Failed to load data');
  }

  getPlaceByName() {}

  createPlace(Place place) {
    print(jsonEncode(place));
  }

  updatePlace(Place place) {}

  deletePlace() {}
}
