import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:taxi_app/src/data/models/passenger_model.dart';
import 'package:taxi_app/src/services/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;

class PassengerProvider {
  final String baseUrl = "http://194.36.189.148:8000/passenger";
  final apiService = GetIt.I<ApiService>();

  Future<List<Passenger>> getAllPassengers() async {
    List<Passenger> passengers = [];
    var response = await apiService.request(url: baseUrl, method: Method.GET);
    for (Map<String, dynamic> passenger in response) {
      passengers.add(Passenger.fromJson(passenger));
    }

    return passengers;
  }

  Future<Passenger> getPassenger(int id) async {
    var response = await apiService.request(
        url: p.join(baseUrl, id.toString()), method: Method.GET);
    return Passenger.fromJson(response);
  }

  getPassengerByPhoneNumber(String phoneNumber) async {
    var response = await apiService.request(
        url: p.join(baseUrl, "phone_number", phoneNumber), method: Method.GET);
    return Passenger.fromJson(response);
  }

  loginPassenger(String phoneNumber, String password) async {
    var response = await apiService.request(
        url: p.join(baseUrl, "login"),
        method: Method.POST,
        params: {"phone_number": phoneNumber, "password": password});
    return Passenger.fromJson(response);
  }

  currentPassenger() async {}

  createPassenger(Passenger passenger) async {
    var response = await apiService.request(
        url: baseUrl, method: Method.POST, params: passenger.toJson());
    return Passenger.fromJson(response);
  }

  updatePassenger(Passenger passenger) async {
    var response = await apiService.request(
        url: p.join(baseUrl, passenger.id.toString()),
        method: Method.PUT,
        params: passenger.toJson());
    return Passenger.fromJson(response);
  }

  deletePassenger(int id) async {
    var response = await apiService.request(
        url: p.join(baseUrl, id.toString()), method: Method.DELETE);
    return Passenger.fromJson(response);
  }
}
