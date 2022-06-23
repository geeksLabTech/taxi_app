// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:taxi_app/src/styles/style_drawer_items.dart';

class homeDrawer extends StatelessWidget {
  const homeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'John Doe',
                        style: drawerListTileStyleText,
                      ),
                      Text(
                        "+53 59999999",
                        style: drawerPersonalInfoStyleText,
                      ),
                    ],
                  ),
                ],
              )),
          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            leading:
                Icon(Icons.add_location_alt_rounded, color: Colors.blue[800]),
            title: Text('My Places', style: drawerListTileStyleText),
            onTap: () {
              Navigator.pushNamed(context, 'places');
            },
          ),
          ListTile(
            leading: Icon(Icons.history, color: Colors.blue[800]),
            title: Text('History', style: drawerListTileStyleText),
            onTap: () {
              Navigator.pushNamed(context, 'history');
            },
          ),
          ListTile(
            leading:
                Icon(Icons.settings_suggest_rounded, color: Colors.blue[800]),
            title: Text('Preferences', style: drawerListTileStyleText),
            onTap: () {},
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Label',
            ),
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.blue[800]),
            title: Text('Profile', style: drawerListTileStyleText),
            onTap: () {
              Navigator.pushNamed(context, 'profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.blue[800]),
            title: Text('Logout', style: drawerListTileStyleText),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}
