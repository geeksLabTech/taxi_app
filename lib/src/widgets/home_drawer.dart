import 'package:flutter/material.dart';

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
          Row(
            // round image with name and email
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                width: 35,
                height: 35,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    'John Doe',
                    style: textTheme.headline6,
                  ),
                  Text(
                    "+53 59999999",
                    style: textTheme.subtitle1,
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Header',
              style: textTheme.headline6,
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.add_location_alt_rounded),
            title: Text('My Places'),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
          ),
          ListTile(
            leading: Icon(Icons.settings_suggest_rounded),
            title: Text('Preferences'),
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
            leading: Icon(Icons.bookmark),
            title: Text('Item A'),
          ),
        ],
      ),
    );
  }
}
