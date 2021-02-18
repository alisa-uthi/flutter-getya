import 'package:flutter/material.dart';

class AdjustQuantityField extends StatelessWidget {
  final Function increaseQuan;
  final Function decreaseQuan;
  final int quantity;

  const AdjustQuantityField({
    Key key,
    this.increaseQuan,
    this.decreaseQuan,
    this.quantity,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.remove_rounded,
            size: 22,
          ),
          onPressed: decreaseQuan,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        Text(
          "$quantity",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            size: 22,
          ),
          onPressed: increaseQuan,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
      ],
    );
  }
}
