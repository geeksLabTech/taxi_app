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

  getPassengerByPhoneNumber() {}

  loginPassenger() {}

  currentPassenger() {}

  createPassenger() {}

  updatePassenger() {}

  deletePassenger() {}
}
