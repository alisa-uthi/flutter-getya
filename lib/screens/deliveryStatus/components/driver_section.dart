import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/widgets/section_title.dart';

import 'driver_info.dart';

class DriverSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: kSecondaryColor),
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: "Driver"),
            SizedBox(height: kDefaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/driver.png",
                  width: 100,
                  height: 100,
                ),
                DriverInfo(),
              ],
            ),
            // DriverInfo(),
          ],
        ),
      ),
    );
  }
}
