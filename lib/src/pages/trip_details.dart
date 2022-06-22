import 'package:flutter/material.dart';
import 'package:taxi_app/src/data/models/trip_model.dart';

class TripDetailsPage extends StatelessWidget {
  const TripDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Trip;
    return Container();
  }
}
