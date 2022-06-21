import 'package:flutter/material.dart';
import 'package:taxi_app/src/models/place.dart';
import 'package:taxi_app/src/widgets/text_field_widget.dart';

class AddEditPlacePage extends StatelessWidget {
  final Place? place;

  const AddEditPlacePage({Key? key, this.place = null}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Place originalPlace;

    if (place != null) {
      originalPlace = Place(
        name: place!.name,
        address: place!.address,
        latitude: place!.latitude,
        longitude: place!.longitude,
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
          Container(
              child: Column(
        children: <Widget>[
          TextFieldWidget(
              label: "Name",
              text: place!.name,
              onChanged: (str) => {
                    place!.name = str,
                  }),
          TextFieldWidget(
              label: "Address",
              text: place!.address,
              onChanged: (str) => {
                    place!.address = str,
                  }),
          TextFieldWidget(
              label: "Latitude",
              text: place!.latitude.toString(),
              onChanged: (str) => {
                    place!.latitude = double.parse(str),
                  }),
          TextFieldWidget(
              label: "Longitude",
              text: place!.longitude.toString(),
              onChanged: (str) => {
                    place!.longitude = double.parse(str),
                  }),
        ],
      )),
    );
  }
}
