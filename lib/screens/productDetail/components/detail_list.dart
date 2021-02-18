import 'package:flutter/material.dart';
import 'package:getya/models/product.dart';
import 'package:getya/screens/productDetail/components/product_detail_form.dart';

import '../../../constants.dart';

class DetailList extends StatelessWidget {
  final Product product;

  const DetailList({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductDetailForm(
          title: "Name",
          detail: product.name,
        ),
        SizedBox(height: kDefaultPadding / 2),
        ProductDetailForm(
          title: "Description",
          detail: product.description,
        ),
        SizedBox(height: kDefaultPadding / 2),
        ProductDetailForm(
          title: "Pharmacy",
          detail: product.pharmacy.name,
        ),
        SizedBox(height: kDefaultPadding / 2),
        ProductDetailForm(
          title: "Price/Unit",
          detail: "${product.price} THB",
        ),
      ],
    );
  }
}
