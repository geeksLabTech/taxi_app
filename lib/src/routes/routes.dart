import 'package:flutter/material.dart';
import 'package:taxi_app/src/pages/history_page.dart';
import 'package:taxi_app/src/pages/home_page.dart';
import 'package:taxi_app/src/pages/initial_screen_page.dart';
import 'package:taxi_app/src/pages/sign_up_page.dart';
import 'package:taxi_app/src/pages/trip_creation_page.dart';

import '../pages/login_page.dart';
import '../pages/profile_page.dart';
import '../pages/trips_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => HomePage(),
  'initial': (_) => InitialScreenPage(),
  'login': (_) => LoginPage(),
  'register': (_) => SignUpPage(),
  'trip': (_) => TripCreationPage(),
  'trips': (_) => TripsPage(),
  'profile': (_) => ProfilePage(),
  'history': (_) => HistoryPage(),
};
