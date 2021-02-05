import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/screens/home_screen.dart';

class SignUpSuccessScreen extends StatelessWidget {
  static final routeName = '/signup-success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
        child: Column(
          children: [
            Text(
              "Registration Complete",
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: kDefaultPadding * 2),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: kDefaultPadding),
            Text(
              "to",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              "assets/images/getya_logo.png",
              width: 250,
              height: 250,
            ),
            Text(
              "GETYA",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: kDefaultPadding * 3),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              child: Text(
                "Tap Here To Begin",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
