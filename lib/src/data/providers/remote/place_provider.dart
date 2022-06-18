import 'package:taxi_app/src/models/place.dart';
import 'package:taxi_app/src/services/api_service.dart';
import 'package:get_it/get_it.dart';

class PlaceProvider {
  final String baseUrl = "/places";
  final apiService = GetIt.I<ApiService>();

  getAllPlaces() {
    return [
      Place(
        name: 'Place 1',
        address: "Address 1",
        latitude: -34.927192,
        longitude: -56.152912,
      ),
      Place(
        name: 'Place 2',
        address: "Address 2",
        latitude: -34.927192,
        longitude: -56.152912,
      ),
      Place(
        name: 'Place 3',
        address: "Address 3",
        latitude: -34.927192,
        longitude: -56.152912,
      ),
    ];
  }

  getPlace() {}

  getPlaceByName() {}

  createPlace() {}

  updatePlaces() {}

  deletePlace() {}
}
