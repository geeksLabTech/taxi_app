import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_app/src/models/place.dart';
import 'package:taxi_app/src/widgets/place_tile_widget.dart';
import 'package:taxi_app/src/data/providers/remote/place_provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PersonalPlacesPage extends StatefulWidget {
  const PersonalPlacesPage({Key? key}) : super(key: key);

  @override
  State<PersonalPlacesPage> createState() => _PersonalPlacesPageState();
}

class _PersonalPlacesPageState extends State<PersonalPlacesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }

  Widget placesData() {
    final placeProvider = GetIt.I<PlaceProvider>();
    final List<Place> places = placeProvider.getAllPlaces();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: places.length,
      itemBuilder: (context, index) {
        return PlaceTileWidget(place: places[index]);
      },
    );
  }

  TripFilterWidget() {
    return Column(
      children: [placesData()],
    );
  }
}
