import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/screens/shoppingCart/shopping_cart_screen.dart';

class ViewCartBottomNavBar extends StatelessWidget {
  const ViewCartBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ShoppingCartScreen.routeName);
      },
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: kSecondaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart),
            SizedBox(width: 10),
            Text(
              "View Cart",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
