import 'package:taxi_app/src/services/api_service.dart';
import 'package:get_it/get_it.dart';

class PlaceProvider {
  final String baseUrl = "/places";
  final apiService = GetIt.I<ApiService>();

  getAllPlaces() {
    
  }

  getPlace() {}

  getPlaceByName(){}

  createPlace(){}

  updatePlaces(){}

  deletePlace(){}
}
