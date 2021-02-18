import 'package:flutter/material.dart';
import 'package:getya/models/user.dart';
import 'package:getya/widgets/section_title.dart';

class DestinationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: "Destination"),
        Text(
          currentUser.address,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
