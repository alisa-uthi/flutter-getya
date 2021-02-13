import 'package:flutter/material.dart';
import 'package:getya/widgets/custom_drawer.dart';

class ShoppingCartScreen extends StatelessWidget {
  static final routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          "Shopping Cart",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
