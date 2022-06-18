import 'package:taxi_app/src/data/models/passenger_model.dart';
import 'package:taxi_app/src/models/passenger.dart';
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

  currentPassenger() {
    return Passenger(
      imagePath:
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
      name: 'Sarah Abs',
      phoneNumber: '+5359999999',
      about:
          'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
    );
  }

  createPassenger() {}

  updatePassenger() {}

  deletePassenger() {}
}
