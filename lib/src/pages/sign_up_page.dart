import 'package:flutter/material.dart';
import 'package:taxi_app/src/data/models/passenger_model.dart';
import 'package:taxi_app/src/data/providers/remote/passenger_provider.dart';
import 'package:taxi_app/src/widgets/blue_button.dart';

import '../widgets/custom_input_widget.dart';
import '../widgets/labels_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Logo',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  _Form(),
                  Labels(
                    route: 'login',
                    title: '¿Ya tienes una cuenta?',
                    subtitle: 'Inicia sesión!',
                  ),
                  Text(
                    'Términos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final phoneCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInputWidget(
            icon: Icons.article_outlined,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),
          CustomInputWidget(
            icon: Icons.phone,
            placeholder: 'Teléfono',
            keyboardType: TextInputType.phone,
            textController: phoneCtrl,
          ),
          CustomInputWidget(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),
          BlueButton(
              text: 'Registrar',
              onPress: () {
                Passenger passenger = Passenger(
                    id: 0,
                    name: nameCtrl.text,
                    phone_number: phoneCtrl.text,
                    password: passCtrl.text);
                createPassenger(passenger);

                Navigator.pushReplacementNamed(context, 'home');
              })
        ],
      ),
    );
  }

  void createPassenger(Passenger passenger) {
    PassengerProvider passengerProvider = PassengerProvider();

    passengerProvider.createPassenger(passenger);
  }
}
