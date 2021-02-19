import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/screens/deliveryStatus/components/driver_section.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/destination_address.png"),
          SizedBox(height: kDefaultPadding),
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding),
            child: Text(
              "Estimate arrival time: 10 mins",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(height: kDefaultPadding),
          DriverSection(),
        ],
      ),
    );
  }
}
