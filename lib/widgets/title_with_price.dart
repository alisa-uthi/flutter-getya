import 'package:flutter/material.dart';

class TitleWithPrice extends StatelessWidget {
  final double price;
  final String title;
  const TitleWithPrice({
    Key key,
    this.price,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          "${price.toInt()} THB",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
