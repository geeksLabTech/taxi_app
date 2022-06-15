import 'package:flutter/material.dart';
import 'package:taxi_app/src/models/passenger.dart';
import 'package:taxi_app/src/pages/edit_profile.dart';
import 'package:taxi_app/src/services/passenger_service.dart';
import 'package:taxi_app/src/widgets/passenger_stats.dart';
import 'package:taxi_app/src/widgets/profile_photo.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = PassengerPreferences.myUser;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfilePhoto(
              imagePath: user.imagePath,
              onClicked: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
            ),
            const SizedBox(height: 24),
            buildName(user),
            const SizedBox(height: 24),
            // Center(child: buildUpgradeButton()),
            // const SizedBox(height: 24),
            NumbersWidget(),
            const SizedBox(height: 48),
            buildAbout(user),
          ],
        ),
      ),
    );
  }

  Widget buildName(Passenger user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.phoneNumber,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );
  Widget buildAbout(Passenger user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
