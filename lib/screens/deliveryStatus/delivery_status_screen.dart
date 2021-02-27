import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/models/order.dart';
import 'package:getya/screens/deliveryStatus/components/driver_section.dart';
import 'package:getya/screens/deliveryStatus/components/map_driver.dart';
import 'package:getya/widgets/custom_drawer.dart';
import 'package:getya/widgets/no_order_screen.dart';

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
      body: currentOrder == null
          ? NoOrderScreen()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MapDriver(),
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
