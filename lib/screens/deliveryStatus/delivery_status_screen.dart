import 'package:flutter/material.dart';
import 'package:getya/widgets/custom_drawer.dart';

class DeliveryStatusScreen extends StatelessWidget {
  static final routeName = "/delivery_status";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Delivery Status",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
