import 'package:flutter/material.dart';
import 'package:taxi_app/src/models/place.dart';

class PlaceTileWidget extends StatelessWidget {
  final Place place;
  const PlaceTileWidget({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        color: Colors.grey[200],
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const Image(
                image: AssetImage(
                  'assets/images/user.png',
                ),
                width: 40,
                height: 40,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text("John Doe"),
                  Row(
                    children: const <Widget>[
                      Icon(Icons.star, color: Colors.yellow),
                      Text("4.9"),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: const <Widget>[
                Text("Final Cost"), // grey small
                Text("\$100"), //black big
              ],
            ),
            Spacer(),
            Column(
              children: const <Widget>[
                Text("Time"), // grey small
                Text("00:15"), //black big
              ],
            ),
          ]),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: const <Widget>[
                        Icon(Icons.location_on),
                        Text("Universidad de La Habana"),
                        Spacer(),
                        Text("9:50 AM"),
                      ],
                    ),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.more_vert),
                      ],
                    ),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.trip_origin),
                        Text("Teatro Nacional"),
                        Spacer(),
                        Text("10:05 AM"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
