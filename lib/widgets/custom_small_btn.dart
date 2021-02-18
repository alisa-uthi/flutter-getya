import 'package:flutter/material.dart';

import '../constants.dart';

class CustomSmallBtn extends StatelessWidget {
  const CustomSmallBtn({
    Key key,
    this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(text),
      onPressed: onPressed,
      color: kGreenColor,
      textColor: Colors.white,
      minWidth: 30,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30),
      ),
    );
  }
}
