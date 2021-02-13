import 'package:flutter/material.dart';

class AvartarWithCamera extends StatelessWidget {
  const AvartarWithCamera({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Implement this
      },
      child: Stack(children: [
        Center(
          child: CircleAvatar(
            backgroundImage: AssetImage(
              "assets/images/beni_avartar.png",
            ),
            radius: 60,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 125,
          child: Icon(
            Icons.camera_alt,
            size: 40,
            color: Colors.white,
          ),
        ),
      ]),
    );
  }
}
