import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/controller/order_controller.dart';
import 'package:getya/models/order.dart';
import 'package:getya/models/product.dart';
import 'package:getya/screens/destinationAddress/destination_screen.dart';
import 'package:getya/screens/shoppingCart/components/list_item.dart';
import 'package:getya/widgets/custom_btn.dart';
import 'package:getya/widgets/custom_drawer.dart';
import 'package:getya/widgets/thick_divider.dart';
import 'package:getya/widgets/title_with_price.dart';

class ShoppingCartScreen extends StatefulWidget {
  static final routeName = "/cart";

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
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
  }

  @override
  void initState() {
    super.initState();
    computeTotalPrice();
  }

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
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(kDefaultPadding / 1.5),
        child: ValueListenableBuilder(
          valueListenable: _productInOrder,
          builder: (context, value, child) {
            return Column(
              children: [
                SingleChildScrollView(
                  child: Column(
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
                ),
                Spacer(),
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
      ),
    );
  }
}
