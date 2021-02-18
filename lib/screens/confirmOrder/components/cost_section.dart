import 'package:flutter/material.dart';
import 'package:getya/models/order.dart';
import 'package:getya/widgets/thick_divider.dart';
import 'package:getya/widgets/title_with_price.dart';

class CostSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWithPrice(title: "Delivery Fee", price: 30),
        SizedBox(height: 10),
        TitleWithPrice(title: "Total Cost", price: currentOrder.totalPrice),
        ThickDivider(),
      ],
    );
  }
}
