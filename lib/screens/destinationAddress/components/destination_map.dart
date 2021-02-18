import 'package:flutter/material.dart';
import 'package:getya/widgets/section_title.dart';

class DestinationMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: "Destination"),
        SizedBox(height: 5),
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
