import 'package:dio/dio.dart';
import 'package:taxi_app/src/data/models/place_model.dart';
import 'package:taxi_app/src/services/api_service.dart';
import 'package:get_it/get_it.dart';

class PlaceProvider {
  final String baseUrl = "/place/";
  final apiService = GetIt.I<ApiService>();

  Future<List<Place>> getAllPlaces() async {
    final Response response =
        await apiService.request(url: baseUrl, method: Method.GET);
    List<Place> places = [];
    for (Map<String, dynamic> place in response.data) {
      places.add(Place.fromJson(place));
    }
    return places;
  }

  Future<Place> getPlace(int id) async {
    final Response response =
        await apiService.request(url: '$baseUrl$id', method: Method.GET);
    return Place.fromJson(response.data);
  }

  Future<Place> getPlaceByName(String name) async {
    final Response response = await apiService.request(
        url: '${baseUrl}name/$name', method: Method.GET);
    return Place.fromJson(response.data);
  }

  Future<Place> createPlace(Place place) async {
    final serializedPlace = place.toJson();
    final Response response = await apiService.request(
        url: baseUrl, method: Method.POST, params: serializedPlace);
    return Place.fromJson(response.data);
  }

  Future<Place> updatePlace(Place place) async {
    final serializedPlace = place.toJson();
    print("serializedPlace: $serializedPlace");
    print("id: ${place.id}");
    final Response response = await apiService.request(
        url:
            '$baseUrl${place.id}?name=${place.name}&address=${place.address}&latitude=${place.latitude.toString()}&longitude=${place.longitude.toString()}',
        method: Method.PUT);
    print("SHOW RETURNED EDIT PLACE: ${response.data}");
    return Place.fromJson(response.data);
  }

  Future<Place> deletePlace(String id) async {
    final Response response =
        await apiService.request(url: '$baseUrl$id', method: Method.DELETE);
    return Place.fromJson(response.data);
  }
}
