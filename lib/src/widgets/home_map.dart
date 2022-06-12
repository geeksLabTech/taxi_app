import 'package:flutter/material.dart';
import 'package:taxi_app/src/widgets/round_button.dart';

class homeMap extends StatelessWidget {
  const homeMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        // widget to show a map
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.black),
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
                    child: RoundButton(
                      child: Icons.menu,
                      onPressed: () {},
                      color: Colors.white,
                      background: Colors.blue,
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
        )
      ],
    ));
  }
}
