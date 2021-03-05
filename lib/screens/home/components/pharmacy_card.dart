import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/models/pharmacy.dart';
import 'package:getya/screens/home/components/time_distance_section.dart';
import 'package:getya/screens/pharmacyProducts/pharmacy_products_screen.dart';

class PharmacyCard extends StatelessWidget {
  const PharmacyCard({
    Key key,
    @required Pharmacy pharmacy,
  })  : pharmacy = pharmacy,
        super(key: key);

  final Pharmacy pharmacy;

  void _handleTapCard(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PharmacyProductsScreen(pharmacy: pharmacy),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTapCard(context),
      child: Container(
        width: double.infinity,
        height: 80,
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              pharmacy.imgPath,
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: kDefaultPadding / 2),
            Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding / 2.5),
              child: Text(
                pharmacy.name,
                style: Theme.of(context).textTheme.bodyText1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                right: kDefaultPadding / 2,
                top: kDefaultPadding / 2.5,
              ),
              child: Column(
                children: [
                  TimeAndDistanceSection(
                    icon: Icons.car_rental,
                    text: "1 Km",
                  ),
                  SizedBox(height: 5),
                  TimeAndDistanceSection(
                    icon: Icons.lock_clock,
                    text: pharmacy.startTime + "\n" + pharmacy.endTime,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
