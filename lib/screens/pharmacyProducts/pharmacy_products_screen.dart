import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/models/pharmacy.dart';
import 'package:getya/screens/pharmacyProducts/components/product_list.dart';
import 'package:getya/widgets/custom_drawer.dart';
import 'package:getya/widgets/view_cart_bottom_nav_bar.dart';

class PharmacyProductsScreen extends StatefulWidget {
  static final routeName = "/pharmacy/products";
  final Pharmacy pharmacy;
  final String category;

  PharmacyProductsScreen({
    this.pharmacy,
    this.category,
  });

  @override
  _PharmacyProductsScreenState createState() => _PharmacyProductsScreenState();
}

class _PharmacyProductsScreenState extends State<PharmacyProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          widget.pharmacy.name,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.black,
              ),
        ),
      ),
      bottomNavigationBar: ViewCartBottomNavBar(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2,
          vertical: kDefaultPadding,
        ),
        child: ProductList(
          pharmacy: widget.pharmacy,
          category: widget.category,
        ),
      ),
    );
  }
}
