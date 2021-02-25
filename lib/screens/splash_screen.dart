import 'dart:async';

import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/widgets/circular_progress.dart';

import 'signin/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  static final routeName = '/spash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, SignInScreen.routeName);
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/getya_logo.png',
                width: 270,
                height: 270,
              ),
              Text(
                "GETYA",
                style: TextStyle(
                  fontSize: 40,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              CircularProgress(),
            ],
          ),
        ),
      ),
    );
  }
}
