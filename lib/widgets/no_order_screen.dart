import 'package:flutter/material.dart';
import 'package:getya/screens/home/home_screen.dart';

import '../constants.dart';

class NoOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You have not ordered anything yet",
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: kDefaultPadding),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
            child: Text(
              "You can order Here",
              style: TextStyle(
                color: kGreenColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
