import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_app/src/data/providers/remote/passenger_provider.dart';
import 'package:taxi_app/src/widgets/blue_button.dart';

import '../widgets/custom_input_widget.dart';
import '../widgets/labels_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                    route: 'register',
                    title: '¿No tienes cuenta?',
                    subtitle: 'Crea una ahora!',
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
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final PassengerProvider _passengerProvider = GetIt.I<PassengerProvider>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInputWidget(
            icon: Icons.phone,
            placeholder: 'Teléfono',
            keyboardType: TextInputType.phone,
            textController: emailCtrl,
          ),
          CustomInputWidget(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),
          BlueButton(
              text: 'Ingrese',
              onPress: () async {
                try {
                  await _passengerProvider.loginPassenger(
                      emailCtrl.text, passCtrl.text);
                    Navigator.pushReplacementNamed(context, 'home');
                } catch (e) {

                  print(e);
                }
                
              })
        ],
      ),
    );
  }
}
