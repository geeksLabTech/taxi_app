import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_app/src/data/providers/remote/place_provider.dart';
import 'package:taxi_app/src/models/place.dart';
import 'package:taxi_app/src/widgets/blue_button.dart';
import 'package:taxi_app/src/widgets/text_field_widget.dart';

class AddEditPlacePage extends StatelessWidget {
  const AddEditPlacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final place = arguments['Place'] as Place;
    Place originalPlace;

    final placeProvider = GetIt.I<PlaceProvider>();

    if (place != null) {
      originalPlace = Place(
        name: place.name,
        address: place.address,
        latitude: place.latitude,
        longitude: place.longitude,
      );
    } else {
      originalPlace = Place(
        name: '',
        address: '',
        latitude: 0,
        longitude: 0,
      );
    }

    final nameController = TextEditingController();
    final adressController = TextEditingController();
    final latitudeController = TextEditingController();
    final longitudeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body:
          // text inputs for name, address, latitude, longitude
          Center(
        child: Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              children: <Widget>[
                TextFieldWidget(
                    label: "Name",
                    text: originalPlace.name == null ? " " : originalPlace.name,
                    onChanged: (str) => {
                          originalPlace.name = str,
                        }),
                TextFieldWidget(
                    label: "Address",
                    text: originalPlace.address,
                    onChanged: (str) => {
                          originalPlace.address = str,
                        }),
                TextFieldWidget(
                    label: "Latitude",
                    text: originalPlace.latitude.toString(),
                    onChanged: (str) => {
                          originalPlace.latitude = double.parse(str),
                        }),
                TextFieldWidget(
                    label: "Longitude",
                    text: originalPlace.longitude.toString(),
                    onChanged: (str) => {
                          originalPlace.longitude = double.parse(str),
                        }),
                BlueButton(
                    text: "Save Place",
                    onPressed: () async {
                      if (place != null) {
                        await placeProvider.updatePlace(originalPlace);
                      } else {
                        await placeProvider.createPlace(originalPlace);
                      }
                    }),
              ],
            )),
      ),
    );
  }
}
