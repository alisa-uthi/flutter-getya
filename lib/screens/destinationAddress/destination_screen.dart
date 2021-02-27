import 'package:flutter/material.dart';
import 'package:getya/controller/order_controller.dart';
import 'package:getya/screens/destinationAddress/components/destination_map.dart';

import '../../constants.dart';
import 'components/delivery_address_form.dart';
import 'components/note_field.dart';
import 'components/total_cost_section.dart';

class DestinationScreen extends StatefulWidget {
  static final routeName = '/select_destination';

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  String _street, _country, _postalCode, _area, _subLocality;
  bool _isLoading = true;
  ValueNotifier<String> _location = ValueNotifier('');
  OrderController _orderController = OrderController();

  void changeLocation(placemarks) {
    setState(() {
      _isLoading = true;
    });

    placemarks.forEach((place) {
      setState(() {
        _area = place.administrativeArea;
        _country = place.country;
        _street = place.street;
        _postalCode = place.postalCode;
        _subLocality = place.subLocality;
      });
    });

    setState(() {
      _location.value =
          "$_street, $_subLocality, $_area $_postalCode, $_country";
      _isLoading = false;
    });

    // Add destination address to the order
    _orderController.addDestination(_location.value);

    _location.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Destination",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      bottomNavigationBar: TotalCostSection(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DestinationMap(onChangeLocation: (placemarks) {
              changeLocation(placemarks);
            }),
            if (_isLoading == false)
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    ValueListenableBuilder(
                        valueListenable: _location,
                        builder: (context, value, child) {
                          return DeliveryAddressForm(
                            address: _location.value,
                          );
                        }),
                    SizedBox(height: kDefaultPadding),
                    NoteField(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
