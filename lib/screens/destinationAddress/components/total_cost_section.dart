import 'package:flutter/material.dart';
import 'package:getya/widgets/custom_btn.dart';
import 'package:getya/widgets/custom_small_btn.dart';

import '../../../constants.dart';

class TotalCostSection extends StatelessWidget {
  const TotalCostSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration: BoxDecoration(color: kSecondaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: "Total Cost\n",
              style: Theme.of(context).textTheme.bodyText1,
              children: [
                TextSpan(
                  text: "${190} THB",
                  style: Theme.of(context).textTheme.headline1,
                )
              ],
            ),
          ),
          CustomSmallBtn(
            text: "Next",
            onPressed: () {
              // TODO: Save destination
              // Navigator.pushNamed(
              //   context,
              // );
            },
          ),
        ],
      ),
    );
  }
}
