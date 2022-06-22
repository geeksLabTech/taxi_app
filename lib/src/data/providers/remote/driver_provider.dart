import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:taxi_app/src/data/models/driver_model.dart';
import 'package:taxi_app/src/services/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class DriverProvider {
  final baseUrl = '/driver/';
  final apiService = GetIt.I<ApiService>();

  getAllDrivers() async {
    final Response response = await apiService.request(
      url: baseUrl,
      method: Method.GET,
    );
    List<Driver> drivers = [];
    for (Map<String, dynamic> driver in response.data) {
      drivers.add(Driver.fromJson(driver));
    }
    return drivers;
    // final response =
    //     await http.get(Uri.parse('http://194.36.189.148:8000/driver/'));
    // if (response.statusCode == 200) {
    //   Iterable l = json.decode(response.body);
    //   final drivers = List<Driver>.from(l.map((model) {
    //     return Driver(
    //         id: model['id'],
    //         ci: model['ci'],
    //         name: model['name'],
    //         phoneNumber: model['phoneNumber'],
    //         password: model['password']);
    //   }));
    //   return drivers;
    // }
    // throw Exception('Failed to load data');
  }

  getDriver(int id) async {
    final Response response = await apiService.request(
      url: '$baseUrl/$id',
      method: Method.GET,
    );
    return Driver.fromJson(response.data);

    // final response = await http
    //     .get(Uri.parse('http://194.36.189.148:8000/driver/' + id.toString()));
    // if (response.statusCode == 200) {
    //   return Driver.fromJson(json.decode(response.body));
    // }
    // throw Exception('Failed to load data');
  }

  getDriverByPhoneNumber(String phoneNumber) async {
    final Response response = await apiService.request(
      url: '$baseUrl/phoneNumber/$phoneNumber',
      method: Method.GET,
    );
    return Driver.fromJson(response.data);
    // final response = await http.get(Uri.parse(
    //     'http://194.36.189.148:8000/driver/phone_number/' + phoneNumber));
    // if (response.statusCode == 200) {
    //   return Driver.fromJson(json.decode(response.body));
    // }
    // throw Exception('Failed to load data');
  }

  getDriverByCi(String ci) async {
    final Response response = await apiService.request(
      url: '$baseUrl/ci/$ci',
      method: Method.GET,
    );
    return Driver.fromJson(response.data);
    // final response =
    //     await http.get(Uri.parse('http://194.36.189.148:8000/driver/ci/' + ci));
    // if (response.statusCode == 200) {
    //   return Driver.fromJson(json.decode(response.body));
    // }
    // throw Exception('Failed to load data');
  }

  createDriver(Driver driver) async {
    final Response response = await apiService.request(
      url: baseUrl,
      method: Method.POST,
      params: driver.toJson(),
    );
    return Driver.fromJson(response.data);
    // // post request to create driver
    // final serializedDriver = jsonEncode(driver);
    // final response = await http.post(
    //     Uri.parse('http://194.36.189.148:8000/driver/'),
    //     body: serializedDriver);
    // if (response.statusCode == 200) {
    //   return true;
    // }
    // throw Exception('Failed to load data');
  }

  updateDriver(Driver driver) async {
    // put request to update driver
    final Response response = await apiService.request(
      url: '$baseUrl/${driver.id}',
      method: Method.PUT,
      params: driver.toJson(),
    );
    return Driver.fromJson(response.data);
    // final serializedDriver = jsonEncode(driver);
    // final response = await http.put(
    //     Uri.parse('http://194.36.189.148:8000/driver/'),
    //     body: serializedDriver);
    // if (response.statusCode == 200) {
    //   return true;
    // }
    // throw Exception('Failed to load data');
  }

  deleteDriver(int id) async {

    // delete request to delete driver
    final Response response = await apiService.request(
      url: '$baseUrl/$id',
      method: Method.DELETE,
    );
    return Driver.fromJson(response.data);
  //   final response = await http.delete(
  //       Uri.parse('http:///194.36.189.148:8000/driver/' + id.toString()));
  //   if (response.statusCode == 200) {
  //     return true;
  //   }
  //   throw Exception('Failed to load data');
  }
}
