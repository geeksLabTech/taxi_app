import 'package:flutter/material.dart';
import 'package:taxi_app/src/models/trip.dart';

class TripTileWidget extends StatelessWidget {
  final Trip trip;
  const TripTileWidget({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // ListTile(
    //   title: Column(children: [
    //     Row(children: [
    //       ClipRRect(
    //         borderRadius: BorderRadius.circular(10),
    //         child: const Image(
    //           image: AssetImage(
    //             'assets/images/user.png',
    //           ),
    //           width: 40,
    //           height: 40,
    //         ),
    //       ),
    //       Container(
    //         margin: EdgeInsets.all(10),
    //         child: Column(
    //           children: [
    //             Text("John Doe"),
    //             Row(
    //               children: [
    //                 Icon(Icons.star, color: Colors.yellow),
    //                 Text("4.9"),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //       Column(
    //         children: [
    //           Text("Final Cost"), // grey small
    //           Text("\$100"), //black big
    //         ],
    //       ),
    //       Spacer(),
    //       Column(
    //         children: [
    //           Text("Time"), // grey small
    //           Text("00:15"), //black big
    //         ],
    //       ),
    //     ]),
    //   ]),
    // );
  }
}
