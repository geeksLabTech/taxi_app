import 'package:flutter/material.dart';
import 'package:taxi_app/src/models/place.dart';

class PlaceTileWidget extends StatelessWidget {
  final Place place;
  const PlaceTileWidget({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (() => Navigator.pushNamed(context, 'detail_place',
          arguments: {'Place': place})),
      title: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: Colors.grey[200],
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      place.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Text(
                        place.address,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              // Spacer(),

              Spacer(),
              Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    Text("Lat:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold)), // grey small
                    Text(place.latitude.toString()), //black big
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    Text("Long:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold)), // grey small
                    Text(place.longitude.toString()), //black big
                  ],
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
