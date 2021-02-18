import 'package:flutter/material.dart';
import 'package:getya/screens/deliveryStatus/delivery_status_screen.dart';
import 'package:getya/widgets/success_screen.dart';

class OrderCompleteScreen extends StatelessWidget {
  static final routeName = '/order_complete';

  @override
  Widget build(BuildContext context) {
    return SucessScreen(
      title: "Order Completed",
      message: "Thank You For Shopping With Us",
      submessage: "You can check delivery tracking",
      navigation: () {
        Navigator.pushNamed(context, DeliveryStatusScreen.routeName);
      },
    );
  }
}
