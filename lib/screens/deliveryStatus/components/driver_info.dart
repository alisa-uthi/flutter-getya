import 'package:flutter/material.dart';
import 'package:getya/widgets/section_title.dart';

class DriverInfo extends StatelessWidget {
  const DriverInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: "Driver Kiang"),
        Text(
          "Vehicle: Suzuki GSXR1000",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
