import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:taxi_app/src/widgets/bottom_details_widget.dart';
import 'package:taxi_app/src/widgets/custom_input_widget.dart';
import 'package:taxi_app/src/widgets/round_button.dart';
import 'package:geolocator/geolocator.dart';

import '../widgets/home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  get placeCtrl => TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        drawer: homeDrawer(),
        body: Container(
            child: Stack(
          children: [
            // widget to show a map
            FlutterMap(
              options: MapOptions(
                  center: LatLng(23.065300, -82.291512),
                  minZoom: 13.0,
                  maxZoom: 19.0,
                  zoom: 15.0,
                  plugins: [
                    LocationMarkerPlugin(),
                  ]),
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                  source: 'OpenStreetMap contributors',
                  onSourceTapped: null,
                ),
              ],
              children: [
                TileLayerWidget(
                  options: TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                ),
                LocationMarkerLayerWidget()
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    // round button at the top left
                    Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        width: 35,
                        height: 35,
                        child: InkWell(
                          onTap: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: Icon(
                            Icons.menu,
                            size: 30,
                          ),
                        )),
                    Spacer(),
                    Container(
                        margin: EdgeInsets.only(right: 20, top: 20),
                        width: 35,
                        height: 35,
                        child: RoundButton(
                          child: Icons.person,
                          onPressed: () {},
                          color: Colors.white,
                          background: Colors.blue,
                        )),
                  ],
                ),
                Spacer(),
                // search box at bottom of screen
                Container(
                  margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            BottomDetails(),
          ],
        )));
  }
}
