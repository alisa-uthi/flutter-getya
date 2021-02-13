import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/models/product.dart';
import 'file:///D:/Work_ICT/3rd%20YEAR_2020/Wireless/getya/lib/screens/productDetail/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: EdgeInsets.only(bottom: kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(product.imgPath),
          SizedBox(width: kDefaultPadding / 2),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "${product.price} THB",
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          Spacer(),
          FlatButton(
            child: Text("ADD"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    product: product,
                  ),
                ),
              );
            },
            color: kGreenColor,
            textColor: Colors.white,
            minWidth: 30,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30),
            ),
          ),
          SizedBox(width: kDefaultPadding / 2),
        ],
      ),
    );
  }
}
