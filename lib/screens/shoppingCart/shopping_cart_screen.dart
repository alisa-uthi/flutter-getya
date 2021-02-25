import 'package:flutter/material.dart';
import 'package:getya/models/order.dart';
import 'package:getya/screens/shoppingCart/components/has_order.dart';
import 'package:getya/widgets/custom_drawer.dart';
import 'package:getya/widgets/no_order_screen.dart';

class ShoppingCartScreen extends StatefulWidget {
  static final routeName = "/cart";

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  ValueNotifier<Map> _productInOrder = ValueNotifier(tempProductsInOrder);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Shopping Cart",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: _productInOrder,
        builder: (context, child, value) {
          return tempProductsInOrder.isEmpty
              ? NoOrderScreen()
              : HasOrder(rebuildEmptyCart: () {
                  _productInOrder.notifyListeners();
                });
        },
      ),
    );
  }
}
