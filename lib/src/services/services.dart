import 'package:get_it/get_it.dart';
import 'package:taxi_app/src/data/providers/remote/passenger_provider.dart';
import 'package:taxi_app/src/data/providers/remote/place_provider.dart';
import 'package:taxi_app/src/data/providers/remote/trip_provider.dart';

import 'api_service.dart';

class Services {
  GetIt getIt = GetIt.instance;
  void init() {
    getIt.registerSingleton<ApiService>(ApiService());
    getIt.registerSingleton<PassengerProvider>(PassengerProvider());
    getIt.registerSingleton<PlaceProvider>(PlaceProvider());
    getIt.registerSingleton<TripProvider>(TripProvider());
  }
}
