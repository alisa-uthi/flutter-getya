import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/models/product.dart';
import 'package:getya/widgets/adjust_quantity_field.dart';

class ListItem extends StatefulWidget {
  Product product;
  int quantity;
  Function removeItem;
  Function onQuantityChange;

  ListItem(
      {this.product, this.quantity, this.removeItem, this.onQuantityChange});

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<double> totalPrice =
        ValueNotifier(widget.product.price * widget.quantity);

    void _handleChange(int changedQuantity) {
      widget.onQuantityChange(changedQuantity);
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                widget.product.name,
                style: Theme.of(context).textTheme.bodyText2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: AdjustQuantityField(
                iconSize: 15,
                quantity: widget.quantity,
                increaseQuan: () {
                  setState(() {
                    widget.quantity++;
                  });
                  _handleChange(widget.quantity);
                },
                decreaseQuan: () {
                  setState(() {
                    widget.quantity--;
                  });
                  if (widget.quantity <= 0) {
                    setState(() {
                      widget.quantity = 1;
                    });
                  }
                  _handleChange(widget.quantity);
                },
              ),
            ),
            Text(
              "${totalPrice.value.toInt()} THB",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: kRedColor,
              ),
              onPressed: () {
                widget.removeItem(widget.product);
              },
            ),
          ],
        ),
        Divider(
          color: Colors.grey[600],
        ),
      ],
    );
  }
}
