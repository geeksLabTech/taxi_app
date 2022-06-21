import 'package:taxi_app/src/services/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class DriverProvider {
  final baseUrl = '/driver';
  final apiService = GetIt.I<ApiService>();

  getAllDrivers() {
    return http.get(Uri.parse('http://194.36.189.148:8000/driver/'));
  }

  getDriver() {}

  getDriverByPhoneNumber() {}

  getDriverByCi() {}

  createDriver() {}

  updateDriver() {}

  deleteDriver() {}
}
