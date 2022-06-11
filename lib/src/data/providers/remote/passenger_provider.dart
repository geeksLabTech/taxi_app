import 'package:taxi_app/src/data/models/passenger_model.dart';
import 'package:taxi_app/src/services/api_service.dart';
import 'package:get_it/get_it.dart';

class PassengerProvider {
  final String baseUrl = "/passengers";
  final apiService = GetIt.I<ApiService>();

  Future<List<PassengerModel>> getAllPassengers() async {
    List<PassengerModel> passengers = [];
    var response = await apiService.request(url: baseUrl, method: Method.GET);
    for (Map<String, dynamic> passenger in response) {
      passengers.add(PassengerModel.fromJson(passenger));
    }

    return passengers;
  }

  getPassenger() {}

  getPassengerByPhoneNumber() {}

  loginPassenger() {}

  createPassenger() {}

  updatePassenger() {}

  deletePassenger() {}
}
