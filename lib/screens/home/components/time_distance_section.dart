import 'package:flutter/material.dart';

class TimeAndDistanceSection extends StatelessWidget {
  const TimeAndDistanceSection({
    Key key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 3),
        Text(text),
      ],
    );
  }
}
