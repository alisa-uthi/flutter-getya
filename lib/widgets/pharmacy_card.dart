import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/models/pharmacy.dart';

class PharmacyCard extends StatelessWidget {
  const PharmacyCard({
    Key key,
    @required Pharmacy phamacy,
  })  : phamacy = phamacy,
        super(key: key);

  final Pharmacy phamacy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to detail screen
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
            Image.asset(phamacy.imgPath),
            SizedBox(width: kDefaultPadding / 2),
            Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding / 2.5),
              child: Text(
                phamacy.name,
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
                      Text(phamacy.startTime + "\n" + phamacy.endTime),
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
