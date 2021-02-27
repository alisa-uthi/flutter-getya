import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/models/user.dart';

class DeliveryAddressForm extends StatefulWidget {
  final String address;

  const DeliveryAddressForm({Key key, this.address}) : super(key: key);

  @override
  _DeliveryAddressFormState createState() => _DeliveryAddressFormState();
}

class _DeliveryAddressFormState extends State<DeliveryAddressForm> {
  String _address = currentUser.address;

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Delivery Address",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(height: 10),
        TextFormField(
          key: Key(widget.address),
          textInputAction: TextInputAction.next,
          decoration: inputDecoration,
          initialValue: widget.address ?? _address,
          onChanged: (value) => setState(() => _address = value),
          onEditingComplete: () => node.nextFocus(),
        ),
      ],
    );
  }
}
