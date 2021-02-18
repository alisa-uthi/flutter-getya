import 'package:flutter/material.dart';

class ThickDivider extends StatelessWidget {
  const ThickDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.black,
      thickness: 2,
      height: 30,
    );
  }
}
