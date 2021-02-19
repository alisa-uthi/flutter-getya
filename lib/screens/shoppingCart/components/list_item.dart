import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/models/product.dart';
import 'package:getya/widgets/adjust_quantity_field.dart';

class ListItem extends StatefulWidget {
  final Product product;
  final int quantity;
  final Function removeItem;
  final Function onQuantityChange;

  ListItem(
      {this.product, this.quantity, this.removeItem, this.onQuantityChange});

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.quantity;
  }

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
                style: Theme.of(context).textTheme.bodyText1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: AdjustQuantityField(
                quantity: _quantity,
                increaseQuan: () {
                  setState(() {
                    _quantity++;
                  });
                  _handleChange(_quantity);
                },
                decreaseQuan: () {
                  setState(() {
                    _quantity--;
                  });
                  if (_quantity <= 0) {
                    setState(() {
                      _quantity = 1;
                    });
                  }
                  _handleChange(_quantity);
                },
              ),
            ),
            Text(
              "${totalPrice.value.toInt()} THB",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(width: 3),
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
          color: Colors.black,
        ),
      ],
    );
  }
}
