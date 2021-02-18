import 'package:flutter/material.dart';
import 'package:getya/controller/order_controller.dart';
import 'package:getya/screens/confirmOrder/components/cost_section.dart';
import 'package:getya/screens/confirmOrder/components/destination_section.dart';
import 'package:getya/screens/confirmOrder/components/order_summary.dart';
import 'package:getya/screens/orderComplete/order_complete.dart';
import 'package:getya/widgets/custom_btn.dart';
import 'package:getya/widgets/section_title.dart';
import 'package:getya/widgets/thick_divider.dart';

import '../../constants.dart';

class ConfirmOrderScreen extends StatelessWidget {
  static final routeName = '/confirm_order';
  final OrderController _orderController = OrderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Confirm Order",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: "Order Summary"),
            OrderSummary(),
            ThickDivider(),
            SizedBox(height: 10),
            DestinationSection(),
            ThickDivider(),
            SizedBox(height: 10),
            CostSection(),
            Spacer(),
            CustomBtn(
              text: "Confirm",
              textColor: Colors.white,
              boxColor: kGreenColor,
              onPressed: () async {
                await _orderController.submitOrder();
                Navigator.pushNamed(context, OrderCompleteScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
