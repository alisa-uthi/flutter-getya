import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_drawer.dart';

class SucessScreen extends StatelessWidget {
  final String titleAppBar;
  final String title;
  final String message;
  final String submessage;
  final Function navigation;

  const SucessScreen({
    Key key,
    this.titleAppBar,
    @required this.title,
    @required this.message,
    @required this.submessage,
    @required this.navigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.done,
              size: 120,
              color: kGreenColor,
            ),
            Text(
              message,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              submessage,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: navigation,
              child: Text(
                "Here",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kGreenColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
