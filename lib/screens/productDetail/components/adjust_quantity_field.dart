import 'package:flutter/material.dart';

class AdjustQuantityField extends StatelessWidget {
  final Function increaseQuan;
  final Function decreaseQuan;
  final int quantity;
  final double iconSize;

  const AdjustQuantityField({
    Key key,
    this.increaseQuan,
    this.decreaseQuan,
    this.quantity,
    this.iconSize,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.remove_rounded,
            size: iconSize ?? 22,
          ),
          onPressed: decreaseQuan,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        Text(
          "$quantity",
          style: iconSize == null
              ? Theme.of(context).textTheme.bodyText1
              : Theme.of(context).textTheme.bodyText2,
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            size: iconSize ?? 22,
          ),
          onPressed: increaseQuan,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
      ],
    );
  }
}
