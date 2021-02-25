import 'package:flutter/material.dart';

import '../constants.dart';

class CircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: kDefaultPadding),
          Center(
            child: CircularProgressIndicator(
              backgroundColor: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
