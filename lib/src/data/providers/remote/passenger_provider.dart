import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:taxi_app/src/data/models/login_passenger_model.dart';
import 'package:taxi_app/src/data/models/passenger_model.dart';
import 'package:taxi_app/src/services/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;

class PassengerProvider {
  final String baseUrl = "/passenger/";
  final apiService = GetIt.I<ApiService>();

  Future<List<Passenger>> getAllPassengers() async {
    List<Passenger> passengers = [];
    Response response =
        await apiService.request(url: baseUrl, method: Method.GET);
    for (Map<String, dynamic> passenger in response.data) {
      passengers.add(Passenger.fromJson(passenger));
    }

    return passengers;
  }

  Future<Passenger> getPassenger(int id) async {
    Response response = await apiService.request(
        url: p.join(baseUrl, id.toString()), method: Method.GET);
    return Passenger.fromJson(response.data);
  }

  Future<Passenger> getPassengerByPhoneNumber(String phoneNumber) async {
    Response response = await apiService.request(
        url: p.join(baseUrl, "phone_number", phoneNumber), method: Method.GET);
    return Passenger.fromJson(response.data);
  }

  Future<LoginPassengerModel> loginPassenger(String phoneNumber, String password) async {
    try {
      Response response = await apiService.request(
          url: p.join(baseUrl, "login"),
          method: Method.POST,
          params: {"phone_number": phoneNumber, "password": password});
      print("response: ${response.data}");
      return LoginPassengerModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Login Error: $e');
    }
  }

  currentPassenger() async {}

  Future<Passenger> createPassenger(Passenger passenger) async {
    print(passenger.toJson());
    Response response = await apiService.request(
        url: baseUrl, method: Method.POST, params: passenger.toJson());
    return Passenger.fromJson(response.data);
  }

  Future<Passenger> updatePassenger(Passenger passenger) async {
    Response response = await apiService.request(
        url: p.join(baseUrl, passenger.id.toString()),
        method: Method.PUT,
        params: passenger.toJson());
    return Passenger.fromJson(response.data);
  }

  Future<Passenger> deletePassenger(int id) async {
    Response response = await apiService.request(
        url: p.join(baseUrl, id.toString()), method: Method.DELETE);
    return Passenger.fromJson(response.data);
  }
}
