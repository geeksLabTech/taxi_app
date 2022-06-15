// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BottomDetails extends StatelessWidget {
  const BottomDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: .2,
      minChildSize: .1,
      maxChildSize: .6,
      builder: (BuildContext context, ScrollController scrollController) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
            color: Colors.lightBlue[100],
            child: ListView(
              controller: scrollController,
              children: [
                Container(
                  child: ListTile(
                    title: Center(child: Text('Trip Details')),
                    trailing: Icon(Icons.close),
                    onTap: () {},
                  ),
                ),
                Divider(),
                Container(
                  child: ListTile(
                    title: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage(
                              'assets/images/user.png',
                            ),
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text("John Doe"),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.yellow),
                                  Text("4.9"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text("Final Cost"), // grey small
                            Text("\$100"), //black big
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text("Time"), // grey small
                            Text("00:15"), //black big
                          ],
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Divider(),
                Container(
                  child: ListTile(
                    title: Text('Trip',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            Text("Universidad de La Habana"),
                            Spacer(),
                            Text("9:50 AM"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.more_vert),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.trip_origin),
                            Text("Teatro Nacional"),
                            Spacer(),
                            Text("10:05 AM"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Container(
                  child: ListTile(
                    title: Center(
                      child: Text("Status: Finished",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
