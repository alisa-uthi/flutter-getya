import 'package:flutter/material.dart';
import 'package:getya/models/order.dart';
import 'package:getya/models/product.dart';

class OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (Product product in currentOrder.products.keys)
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      product.name,
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      currentOrder.products[product].toString() + " pcs",
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    (product.price * currentOrder.products[product])
                            .toString() +
                        " THB",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
