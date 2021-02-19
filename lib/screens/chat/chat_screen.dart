import 'package:flutter/material.dart';
import 'package:getya/constants.dart';

import 'components/message_box.dart';
import 'components/type_section.dart';

class ChatScreen extends StatelessWidget {
  static final routeName = '/chat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              "assets/images/driver.png",
              width: 30,
              height: 30,
            ),
          )
        ],
        title: Text(
          "Driver Kiang",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kDefaultPadding),
            MessageBox(
              message: "I have already received your order!",
              position: FractionalOffset.bottomLeft,
            ),
            SizedBox(height: kDefaultPadding / 2),
            MessageBox(
              message: "Okay!",
              position: FractionalOffset.bottomRight,
            ),
            Spacer(),
            TypeSection(),
          ],
        ),
      ),
    );
  }
}
