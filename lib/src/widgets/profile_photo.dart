import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfilePhoto({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(imagePath),
          Positioned(bottom: 0, right: 4, child: editBubble(color)),
        ],
      ),
    );
  }

  Widget buildImage(String imagePath) {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget editBubble(Color color) => buildBubble(
        color: Colors.white,
        all: 3,
        child: buildBubble(
            child: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 20,
            ),
            all: 8,
            color: color),
      );

  Widget buildBubble({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
