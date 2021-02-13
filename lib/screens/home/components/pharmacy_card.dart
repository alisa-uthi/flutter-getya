import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/models/pharmacy.dart';
import 'file:///D:/Work_ICT/3rd%20YEAR_2020/Wireless/getya/lib/screens/pharmacyProducts/pharmacy_products_screen.dart';

class PharmacyCard extends StatelessWidget {
  const PharmacyCard({
    Key key,
    @required Pharmacy pharmacy,
  })  : pharmacy = pharmacy,
        super(key: key);

  final Pharmacy pharmacy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to detail screen
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PharmacyProductsScreen(pharmacy: pharmacy),
            ));
      },
      child: Container(
        width: double.infinity,
        height: 80,
        margin: EdgeInsets.only(bottom: kDefaultPadding / 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(pharmacy.imgPath),
            SizedBox(width: kDefaultPadding / 2),
            Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding / 2.5),
              child: Text(
                pharmacy.name,
                style: Theme.of(context).textTheme.bodyText1,
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
                  Row(
                    children: [
                      Icon(Icons.car_rental),
                      SizedBox(width: 3),
                      Text("1 Km"),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.lock_clock),
                      SizedBox(width: 3),
                      Text(pharmacy.startTime + "\n" + pharmacy.endTime),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
