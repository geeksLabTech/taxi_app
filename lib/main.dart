import 'package:flutter/material.dart';
import 'package:taxi_app/src/pages/login_page.dart';
import 'package:taxi_app/src/routes/routes.dart';
import 'package:taxi_app/src/services/services.dart';

void main() {
  Services services = Services();
  services.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MaterialApp(
        home: const LoginPage(),
        title: 'Taxi App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: appRoutes,
      ),
    );
  }
}
