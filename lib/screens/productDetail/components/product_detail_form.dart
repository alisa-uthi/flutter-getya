import 'package:flutter/material.dart';
import 'package:getya/constants.dart';

class ProductDetailForm extends StatelessWidget {
  final String title;
  final String detail;

  const ProductDetailForm({Key key, this.title, this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.65,
          decoration: BoxDecoration(
            color: kLightGreyColor,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(detail),
        ),
      ],
    );
  }
}
