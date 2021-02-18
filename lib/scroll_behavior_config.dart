import 'package:flutter/material.dart';

class ScrollBehaviorConfiguration extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
