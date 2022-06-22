import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_app/src/data/providers/remote/passenger_provider.dart';
import 'package:taxi_app/src/models/passenger.dart';
import 'package:taxi_app/src/widgets/blue_button.dart';
import 'package:taxi_app/src/widgets/profile_photo.dart';
import 'package:taxi_app/src/widgets/text_field_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    final passengerProvider = GetIt.I<PassengerProvider>();
    final user = passengerProvider.currentPassenger();

    return Scaffold(
      // appBar: buildAppBar(context),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfilePhoto(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Phone Number',
              text: user.phoneNumber,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 5,
              onChanged: (about) {},
            ),
            const SizedBox(height: 24),
            BlueButton(
                text: "save",
                onPress: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
