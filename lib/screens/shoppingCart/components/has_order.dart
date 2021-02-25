import 'package:flutter/material.dart';
import 'package:getya/controller/order_controller.dart';
import 'package:getya/models/order.dart';
import 'package:getya/models/product.dart';
import 'package:getya/screens/destinationAddress/destination_screen.dart';
import 'package:getya/widgets/custom_btn.dart';
import 'package:getya/widgets/thick_divider.dart';
import 'package:getya/widgets/title_with_price.dart';

import '../../../constants.dart';
import 'list_item.dart';

class HasOrder extends StatefulWidget {
  final Function rebuildEmptyCart;

  const HasOrder({
    Key key,
    this.rebuildEmptyCart,
  }) : super(key: key);

  @override
  _HasOrderState createState() => _HasOrderState();
}

class _HasOrderState extends State<HasOrder> {
  ValueNotifier<Map> _productInOrder = ValueNotifier(tempProductsInOrder);
  double _orderTotalPrice = 0.0;
  OrderController _orderController = OrderController();

  void computeTotalPrice() {
    double totalPrice = 0.0;
    for (Product product in tempProductsInOrder.keys) {
      int quantity = tempProductsInOrder[product];
      totalPrice += product.price * quantity;
    }
    setState(() {
      _orderTotalPrice = totalPrice;
    });

    checkEmptyOrder();
  }

  void checkEmptyOrder() {
    if (tempProductsInOrder.isEmpty) {
      widget.rebuildEmptyCart();
    }
  }

  @override
  void initState() {
    super.initState();
    computeTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(kDefaultPadding / 1.5),
      child: ValueListenableBuilder(
        valueListenable: _productInOrder,
        builder: (context, value, child) {
          return Column(
            children: [
              buildShoppingList(),
              ThickDivider(),
              TitleWithPrice(title: "Delivery Fee", price: 30),
              ThickDivider(),
              TitleWithPrice(title: "Total Cost", price: _orderTotalPrice),
              SizedBox(height: kDefaultPadding),
              CustomBtn(
                text: "Confirm",
                textColor: Colors.white,
                boxColor: kGreenColor,
                onPressed: () async {
                  await _orderController.createNewOrder(_orderTotalPrice);
                  Navigator.pushNamed(context, DestinationScreen.routeName);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildShoppingList() {
    return Expanded(
      child: ListView(
        children: [
          for (Product product in tempProductsInOrder.keys)
            ListItem(
              product: product,
              quantity: tempProductsInOrder[product],
              removeItem: (product) {
                tempProductsInOrder.remove(product);
                computeTotalPrice();
                _productInOrder.notifyListeners();
              },
              onQuantityChange: (changedQuantity) {
                tempProductsInOrder[product] = changedQuantity;
                computeTotalPrice();
                _productInOrder.notifyListeners();
              },
            ),
        ],
      ),
    );
  }
}
