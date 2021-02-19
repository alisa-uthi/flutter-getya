import 'package:flutter/material.dart';

import '../../../constants.dart';

class TypeSection extends StatelessWidget {
  const TypeSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding / 2),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kSecondaryColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: inputDecoration,
            ),
          ),
          SizedBox(width: kDefaultPadding / 2),
          Icon(
            Icons.camera_alt,
            size: 30,
          ),
          SizedBox(width: kDefaultPadding / 2),
          Icon(
            Icons.phone,
            size: 30,
          ),
        ],
      ),
    );
  }
}
