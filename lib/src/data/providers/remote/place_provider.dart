import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:taxi_app/src/data/models/place_model.dart';
import 'package:taxi_app/src/services/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

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

  getPlace(int id) async {
    final Response response =
        await apiService.request(url: '$baseUrl/$id', method: Method.GET);
    return Place.fromJson(response.data);
  }

  getPlaceByName(String name) async {
    final Response response = await apiService.request(
        url: '$baseUrl/name/$name', method: Method.GET);
    return Place.fromJson(response.data);
  }

  createPlace(Place place) async {
    final serializedPlace = place.toJson();
    final Response response = await apiService.request(
        url: baseUrl, method: Method.POST, params: serializedPlace);
    return Place.fromJson(response.data);
  }

  updatePlace(Place place) async {
    final serializedPlace = place.toJson();
    final Response response = await apiService.request(
        url: '$baseUrl/${place.id}',
        method: Method.PUT,
        params: serializedPlace);
    return Place.fromJson(response.data);
  }

  deletePlace(String id) async {
    final Response response =
        await apiService.request(url: '$baseUrl/$id', method: Method.DELETE);
    return Place.fromJson(response.data);
  }
}
