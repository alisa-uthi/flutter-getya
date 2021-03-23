import 'package:flutter/material.dart';

import '../../../constants.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({
    Key key,
    this.message,
    this.position,
  }) : super(key: key);

  final String message;
  final AlignmentGeometry position;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: position,
      child: Container(
        margin: EdgeInsets.all(kDefaultPadding / 2),
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2,
          vertical: kDefaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: kLightGreyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(message),
      ),
    );
  }
}
