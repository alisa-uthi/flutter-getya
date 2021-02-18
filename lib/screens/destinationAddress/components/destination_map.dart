import 'package:flutter/material.dart';

class DestinationMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Destination",
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(height: 10),
        Image.asset("assets/images/destination_address.png"),
        SizedBox(height: 10),
        Center(
          child: Text(
            "Kratum Lom, Salaya, Nakhorn Pathom",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}
