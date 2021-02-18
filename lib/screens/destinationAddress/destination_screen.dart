import 'package:flutter/material.dart';
import 'package:getya/screens/destinationAddress/components/destination_map.dart';
import 'package:getya/widgets/custom_drawer.dart';

import '../../constants.dart';
import 'components/delivery_address_form.dart';
import 'components/note_field.dart';
import 'components/total_cost_section.dart';

class DestinationScreen extends StatelessWidget {
  static final routeName = '/select_destination';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          "Select Destination",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      bottomNavigationBar: TotalCostSection(),
      body: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DestinationMap(),
              SizedBox(height: kDefaultPadding * 1.5),
              DeliveryAddressForm(),
              SizedBox(height: kDefaultPadding * 1.5),
              NoteField(),
              SizedBox(height: kDefaultPadding * 1.5),
            ],
          ),
        ),
      ),
    );
  }
}
