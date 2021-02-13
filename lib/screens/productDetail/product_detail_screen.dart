import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/models/product.dart';
import 'file:///D:/Work_ICT/3rd%20YEAR_2020/Wireless/getya/lib/screens/productDetail/components/adjust_quantity_field.dart';
import 'package:getya/widgets/custom_btn.dart';
import 'package:getya/widgets/custom_drawer.dart';
import 'file:///D:/Work_ICT/3rd%20YEAR_2020/Wireless/getya/lib/screens/productDetail/components/product_detail_form.dart';

class ProductDetailScreen extends StatefulWidget {
  static final routeName = '/pharmacy/product/detail';
  final Product product;

  const ProductDetailScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;

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
            ProductDetailForm(
              title: "Name",
              detail: widget.product.name,
            ),
            SizedBox(height: kDefaultPadding / 2),
            ProductDetailForm(
              title: "Description",
              detail: widget.product.description,
            ),
            SizedBox(height: kDefaultPadding / 2),
            ProductDetailForm(
              title: "Pharmacy",
              detail: widget.product.pharmacy.name,
            ),
            SizedBox(height: kDefaultPadding / 2),
            ProductDetailForm(
              title: "Price/Unit",
              detail: "${widget.product.price} THB",
            ),
            SizedBox(height: kDefaultPadding * 2),
            Divider(
              color: Colors.black,
              thickness: 5,
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
            SizedBox(height: kDefaultPadding / 2),
            CustomBtn(
              text: "Add To Cart",
              textColor: Colors.white,
              boxColor: kGreenColor,
              onPressed: () {
                // TODO: Add product to cart
              },
            ),
          ],
        ),
      ),
    );
  }
}
