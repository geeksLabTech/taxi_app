import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const BlueButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return 0;
          }
          return 5;
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.blue[600];
          }
          return Colors.blue[200];
        }),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      onPressed: () {
        Navigator.pushReplacementNamed(context, 'initial');
      },
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(text,
              style: const TextStyle(color: Colors.white, fontSize: 17)),
        ),
      ),
    );
  }
}
