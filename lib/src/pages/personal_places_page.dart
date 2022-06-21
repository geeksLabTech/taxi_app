import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_app/src/data/models/place_model.dart';
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
          child: placesData(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, 'add_place'),
        ));
  }

  Widget placesData() {
    final placeProvider = GetIt.I<PlaceProvider>();

    return FutureBuilder(
      future: placeProvider.getAllPlaces(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return PlaceTileWidget(place: snapshot.data?[index]);
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
