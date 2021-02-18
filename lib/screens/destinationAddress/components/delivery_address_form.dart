import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/models/user.dart';

class DeliveryAddressForm extends StatefulWidget {
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
          textInputAction: TextInputAction.next,
          decoration: inputDecoration,
          initialValue: _address,
          onChanged: (value) => setState(() => _address = value),
          onEditingComplete: () => node.nextFocus(),
        )
      ],
    );
  }
}
