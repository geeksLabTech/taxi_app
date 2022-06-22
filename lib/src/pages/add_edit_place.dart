import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_app/src/data/providers/remote/place_provider.dart';
import 'package:taxi_app/src/widgets/blue_button.dart';
import 'package:taxi_app/src/widgets/text_field_widget.dart';
import '../widgets/custom_input_widget.dart';
import '../data/models/place_model.dart';

class AddEditPlacePage extends StatelessWidget {
  const AddEditPlacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Place? place;
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    if (arguments['Place'] != null) place = arguments['Place'] as Place;
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
            child: _Form(
              place: place,
            )),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  Place? place;
  Place originalPlace = Place(
    id: 0,
    name: '',
    address: '',
    latitude: 0,
    longitude: 0,
  );

  _Form({Key? key, Place? place}) : super(key: key) {
    if (place != null) {
      originalPlace = Place(
        id: place.id,
        name: place.name,
        address: place.address,
        latitude: place.latitude,
        longitude: place.longitude,
      );
    }
  }

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nameController = TextEditingController();
  final adressController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  final placeProvider = GetIt.I<PlaceProvider>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomInputWidget(
          icon: Icons.person,
          textController: nameController,
          placeholder: 'Name',
          keyboardType: TextInputType.text,
        ),
        CustomInputWidget(
          icon: Icons.home,
          textController: adressController,
          placeholder: 'Address',
          keyboardType: TextInputType.text,
        ),
        CustomInputWidget(
          icon: Icons.location_on,
          textController: latitudeController,
          placeholder: 'Latitude',
          keyboardType: TextInputType.number,
        ),
        CustomInputWidget(
            icon: Icons.location_on,
            textController: longitudeController,
            placeholder: 'Longitude',
            keyboardType: TextInputType.number),
        BlueButton(
            text: "Save Place",
            onPress: () async {
              print("saving place");
              widget.originalPlace.name = nameController.text;
              widget.originalPlace.address = adressController.text;
              widget.originalPlace.latitude =
                  double.parse(latitudeController.text);
              widget.originalPlace.longitude =
                  double.parse(longitudeController.text);
              if (widget.place != null) {
                await placeProvider.updatePlace(widget.originalPlace);
              } else {
                await placeProvider.createPlace(widget.originalPlace);
              }
              Navigator.pop(context);
            }),
      ],
    );
  }
}
