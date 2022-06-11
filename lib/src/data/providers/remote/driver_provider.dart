import 'package:taxi_app/src/services/api_service.dart';
import 'package:get_it/get_it.dart';

class DriverProvider {
  final baseUrl = '/driver';
  final apiService = GetIt.I<ApiService>();

  getAllDrivers(){

  }

  getDriver(){}

  getDriverByPhoneNumber(){}

  getDriverByCi(){}

  createDriver(){}

  updateDriver(){

  }

  deleteDriver(){}
}
