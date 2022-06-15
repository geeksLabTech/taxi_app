import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  // final String route;
  final Function onPressed;
  final Color color;
  final Color background;
  final IconData child;

  const RoundButton({
    Key? key,
    required this.onPressed,
    required this.color,
    required this.background,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding:
            MaterialStateProperty.resolveWith((states) => EdgeInsets.all(0)),
        backgroundColor:
            MaterialStateProperty.resolveWith((state) => background),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: Icon(child, color: color),
      onPressed: onPressed(),
    );
  }
}
