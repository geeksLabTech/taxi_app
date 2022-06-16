import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_app/src/widgets/bottom_details_widget.dart';
import 'package:taxi_app/src/widgets/custom_input_widget.dart';
import 'package:taxi_app/src/widgets/round_button.dart';

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
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              // child: _createFlutterMap(context),
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
