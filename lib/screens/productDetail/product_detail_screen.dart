import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/controller/order_controller.dart';
import 'package:getya/models/product.dart';
import 'package:getya/screens/pharmacyProducts/pharmacy_products_screen.dart';
import 'package:getya/screens/productDetail/components/detail_list.dart';
import 'package:getya/widgets/adjust_quantity_field.dart';
import 'package:getya/widgets/custom_btn.dart';
import 'package:getya/widgets/custom_drawer.dart';

class ProductDetailScreen extends StatefulWidget {
  static final routeName = '/pharmacy/product/detail';
  final Product product;

  const ProductDetailScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  final OrderController orderController = OrderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          "${widget.product.name}",
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.black,
              ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding / 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product.name,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: kDefaultPadding / 2),
            Center(
              child: Image.asset(
                widget.product.imgPath,
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(height: kDefaultPadding),
            DetailList(product: widget.product),
            SizedBox(height: kDefaultPadding * 1.5),
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
            SizedBox(height: kDefaultPadding / 2),
            Row(
              children: [
                Text("Quantity", style: Theme.of(context).textTheme.bodyText2),
                SizedBox(width: kDefaultPadding * 1.5),
                AdjustQuantityField(
                  quantity: _quantity,
                  increaseQuan: () {
                    setState(() => _quantity++);
                  },
                  decreaseQuan: () {
                    setState(() {
                      _quantity--;
                      if (_quantity <= 0) {
                        _quantity = 1;
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: kDefaultPadding),
            CustomBtn(
              text: "Add To Cart",
              textColor: Colors.white,
              boxColor: kGreenColor,
              onPressed: () {
                orderController.addProductToCart(widget.product, _quantity);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PharmacyProductsScreen(
                      pharmacy: widget.product.pharmacy,
                      category: widget.product.category,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
