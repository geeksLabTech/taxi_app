import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_app/src/widgets/custom_input_widget.dart';
import 'package:taxi_app/src/widgets/home_map.dart';
import 'package:taxi_app/src/widgets/round_button.dart';

import '../widgets/home_drawer.dart';

class InitialScreenPage extends StatelessWidget {
  const InitialScreenPage({Key? key}) : super(key: key);

  get placeCtrl => TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: homeDrawer(),
      body: homeMap(scaffoldKey: _scaffoldKey),
    );
  }
}
